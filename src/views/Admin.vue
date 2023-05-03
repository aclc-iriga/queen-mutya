<template>
	<top-nav/>

	<side-nav/>

    <v-main v-if="$store.getters['auth/getUser'] !== null">
        <template v-if="duoSlug && results">
            <v-row>
                <v-col cols="12" lg="6">
                    <template v-if="results.event_1">
                        <admin-result :event="results.event_1" :result="results.result_1"/>
                    </template>
                </v-col>
                <v-col cols="12" lg="6">
                    <template v-if="results.event_2">
                        <admin-result :event="results.event_2" :result="results.result_2"/>
                    </template>
                </v-col>
            </v-row>
        </template>

        <!-- loader -->
        <div v-else-if="duoSlug" class="d-flex justify-center align-center" style="height: 100vh;">
            <v-progress-circular
                :size="80"
                color="black"
                class="mb-16"
                indeterminate
            />
        </div>
    </v-main>
</template>


<script>
	import TopNav from "../components/nav/TopNav.vue";
	import SideNav from "../components/nav/SideNav.vue";
    import AdminResult from '../components/result/AdminResult.vue';
    import $ from 'jquery';

    export default {
        name: 'Admin',
        emits: ['startPing'],
		components: {
            TopNav,
            SideNav,
            AdminResult
		},
        data() {
            return {
                duoSlug: null,
                results: null,

                timer: null,
            }
        },
        computed: {
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
                    if(this.timer)
                        clearTimeout(this.timer);

                    this.duoSlug = to.params.duoSlug;
                    this.results = null;
                    this.tabulate();
                }
            }
        },
        methods: {
            async tabulate() {
                // tabulate selected duo
                if(this.duoSlug) {
                    await $.ajax({
                        url: `${this.$store.getters.appURL}/admin.php`,
                        type: 'GET',
                        xhrFields: {
                            withCredentials: true
                        },
                        data: {
                            tabulate: this.duoSlug
                        },
                        success: (data) => {
                            data = JSON.parse(data);
                            this.results = data.results;

                            // request again
                            if(data.duoSlug === this.duoSlug) {
                                this.timer = setTimeout(() => {
                                    this.tabulate();
                                }, 2400);
                            }
                        },
                        error: (error) => {
                            alert(`ERROR ${error.status}: ${error.statusText}`);
                        },
                    });
                }
            }
        }
    }
</script>


<style scoped>

</style>
