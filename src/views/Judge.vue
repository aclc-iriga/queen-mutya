<template>
    <top-nav ref="top-nav" @toggle-help="handleToggleHelp" @sign-out="handleSignOut"/>

    <side-nav ref="side-nav" v-if="$vuetify.display.mdAndDown"/>

	<v-main v-if="$store.getters['auth/getUser'] !== null">
        <v-row>
            <v-col cols="12" lg="6" class="pr-lg-6">
                <template v-if="eventSlugs[0]">
                    <judge-rating
                        :event-slug="eventSlugs[0]"
                        @send-active-duo="sendActiveDuo"
                        @send-active-coordinates="sendActiveCoordinates"
                    />
                </template>
            </v-col>
            <v-col cols="12" lg="6" class="pl-lg-6">
                <template v-if="eventSlugs[1]">
                    <judge-rating
                        :event-slug="eventSlugs[1]"
                        @send-active-duo="sendActiveDuo"
                        @send-active-coordinates="sendActiveCoordinates"
                    />
                </template>
            </v-col>
        </v-row>
	</v-main>
</template>


<script>
    import topNav from '../components/nav/TopNav.vue';
    import sideNav from '../components/nav/SideNav.vue';
    import judgeRating from '../components/score/JudgeRating.vue';

    export default {
        name: 'Judge',
        emits: ['startPing'],
        components: {
            topNav,
            sideNav,
            judgeRating
        },
        data() {
            return {
                duoSlug: null,
                competition: '',
                ws: null
            }
        },
        computed: {
            duo() {
                let duo = null;
                if (this.duoSlug !== null) {
                    const duos = this.$store.getters['events/getDuos'];
                    for (let i = 0; i < duos.length; i++) {
                        if (duos[i].slug === this.duoSlug) {
                            duo = duos[i];
                            break;
                        }
                    }
                }
                return duo;
            },
            eventSlugs() {
                let slugs = [null, null];
                if(this.duoSlug) {
                    const duo = this.$store.getters['events/getAssignedDuos'].find(duo => duo.slug === this.duoSlug);
                    if(duo)
                        slugs = duo.eventSlugs;
                }
                return slugs;
            }
        },
        watch: {
            $route: {
                immediate: true,
                handler(to, from) {
                    this.duoSlug = null;

                    // delay duoSlug change to force re-render
                    setTimeout(() => {
                        this.duoSlug = to.params.duoSlug;
                        this.sendActiveDuo();
                    }, 60);
                }
            }
        },
        methods: {
            sendActiveDuo() {
                const sendActiveDuo = () => {
                    this.websocketSend('__active_event__', { event_id: this.duo.id });
                };
                if (this.duo) sendActiveDuo();
                else setTimeout(() => { sendActiveDuo(); }, 100);
            },
            sendActiveCoordinates(payload) {
                if ('team_id' in payload && 'column' in payload) {
                    this.websocketSend(
                        '__active_team_column__',
                        payload
                    );
                }
            },
            handleToggleHelp(status) {
                this.websocketSend('__call_for_help__', { status: status });
            },
            handleSignOut() {
                this.websocketSend('__sign_out__');
            },
            handleScreensaverShown() {
                this.websocketSend('__screensaver__', { status: true });
            },
            handleScreensaverHidden() {
                this.websocketSend('__screensaver__', { status: false });
            },
            websocketSend(action, payload) {
                if (this.ws !== null && this.ws.readyState === WebSocket.OPEN) {
                    this.ws.send(JSON.stringify({
                        competition: this.competition,
                        entity     : 'judge',
                        id         : this.$store.getters['auth/getUser']?.id,
                        action     : action,
                        payload    : payload
                    }));
                }
            }
        },
        created() {
            // initialize websocket connection
            this.competition = import.meta.env.BASE_URL.replaceAll('/', '');
            this.ws = new WebSocket(`${this.$store.getters['websocketUrl']}?competition=${this.competition}&entity=judge&id=${this.$store.getters['auth/getUser']?.id}`);

            // handle websocket open
            this.ws.onopen = () => {
                this.sendActiveDuo();
            };

            // handle websocket message
            this.ws.onmessage = (e) => {
                let data = {};
                try { data = JSON.parse(e.data); } catch (e) {}

                if ('subject' in data && 'body' in data) {
                    const subject = data.subject;
                    const body    = data.body;

                    // receive help status
                    if (subject === '__help_status__') {
                        const user = this.$store.getters['auth/getUser'];
                        user.calling = !body;
                        const topNav = this.$refs['top-nav'];
                        if (topNav) {
                            topNav.toggleHelp();
                        }
                    }

                    // receive active duo
                    else if (subject === '__active_event__') {
                        if (body !== '') {
                            localStorage.setItem('active-duo', body);
                            const duos = this.$store.getters['events/getAssignedDuos'];
                            let duo = null;
                            for (let i = 0; i < duos.length; i++) {
                                if (body === duos[i].slug) {
                                    duo = duos[i];
                                }
                            }

                            // duo is found: route to that duo
                            if (duo) {
                                hideScreenSaver();
                                this.$router.push({ params: { duoSlug: duo.slug } });
                            }
                            // duo is not found: refresh to that duo
                            else {
                                window.location.href = `${window.location.origin}/${this.competition}/judge/${body}`;
                            }
                        }
                    }

                    // receive event refresh
                    else if (subject === '__refresh_event__') {
                        if (body !== '' && this.duo) {
                            if (body === this.duo.slug) {
                                window.location.reload();
                            }
                        }
                    }

                    // receive all active event
                    else if (subject === '__all_active_event__') {
                        if (body !== '') {
                            localStorage.setItem('active-duo', body);
                            if (this.duo && this.duo.slug === body) {
                                window.location.reload();
                            }
                            else {
                                const duos = this.$store.getters['events/getAssignedDuos'];
                                let duo = null;
                                for (let i = 0; i < duos.length; i++) {
                                    if (body === duos[i].slug) {
                                        duo = duos[i];
                                    }
                                }

                                // duo is found: route to that duo
                                if (duo) {
                                    hideScreenSaver();
                                    this.$router.push({ params: { duoSlug: duo.slug } });
                                }
                                // duo is not found: refresh to that duo
                                else {
                                    window.location.href = `${window.location.origin}/${this.competition}/judge/${body}`;
                                }
                            }
                        }
                    }

                    // receive screensaver status
                    else if (subject === '__screensaver_status__') {
                        if (body) {
                            showScreenSaver();
                        }
                        else {
                            hideScreenSaver();
                        }
                    }
                }
            };

            // handle websocket close
            this.ws.onclose = () => {

            };
        },
        mounted() {
            this.$emit('startPing');
            this.$nextTick(() => {
                window.addEventListener('screensaver-shown' , this.handleScreensaverShown);
                window.addEventListener('screensaver-hidden', this.handleScreensaverHidden);
            });
        },
        beforeUnmount() {
            window.removeEventListener('screensaver-shown' , this.handleScreensaverShown);
            window.removeEventListener('screensaver-hidden', this.handleScreensaverHidden);
        }
    }
</script>


<style scoped>

</style>