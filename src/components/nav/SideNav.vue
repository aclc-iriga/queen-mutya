<template>
	<v-navigation-drawer
		theme="dark"
		v-model="$store.state.app.sideNav"
		:permanent="$vuetify.display.lgAndUp"
	>
        <v-list class="pa-0">
            <v-list-item
                v-for="duo in $store.getters['events/getAssignedDuos']"
                :key="duo.id"
                :variant="$route.params.duoSlug === duo.slug ? 'tonal' : 'text'"
                class="text-center"
                :class="`justify-center text-center text-button${$route.params.duoSlug === duo.slug ? ' text-yellow' : ''}`"
                block
                @click="handleDuoChange(duo)"
            >
                {{ duo.title }}
            </v-list-item>
        </v-list>
		<template v-slot:append>
			<v-col class="text-center mt-4" cols="12">
                <v-btn class="mb-3" variant="tonal" @click="refresh" block :loading="refreshing">REFRESH</v-btn>
				&copy; <strong class="text-uppercase">ACLC Iriga 2023</strong>
			</v-col>
		</template>
	</v-navigation-drawer>
</template>

<script>
    import $ from 'jquery';

    export default {
        name: "SideNav",
        data() {
            return {
                refreshing: false
            }
        },
        methods: {
            handleDuoChange(duo) {
                localStorage.setItem('active-duo', duo.slug);
                this.$router.push({
                    name: this.$store.getters['auth/getUser'].userType,
                    params: {
                        duoSlug: duo.slug
                    }
                });

                // close sidebar when screen is mdAndDown
                if (this.$vuetify.display.mdAndDown)
                    this.$store.state.app.sideNav = false;
            },

            refresh() {
                this.refreshing = true;
                window.location.reload();
            }
        },
        created() {
            $.ajax({
                url: `${this.$store.getters.appURL}/${this.$store.getters['auth/getUser'].userType}.php`,
                type: 'GET',
                xhrFields: {
                    withCredentials: true
                },
                data: {
                    getEvents: ''
                },
                success: (data) => {
                    data = JSON.parse(data);
                    this.$store.commit('events/setDuos', data.duos);
                    this.$store.commit('events/setEvents', data.events);
                    const activeDuo = localStorage.getItem('active-duo');
                    if(activeDuo !== undefined) {
                        const duo = data.duos.find(duo => duo.slug === activeDuo);
                        if(duo)
                            this.handleDuoChange(duo);
                    }
                },
                error: (error) => {
                    alert(`ERROR ${error.status}: ${error.statusText}`);
                },
            });
        }
    }
</script>


<style scoped>

</style>