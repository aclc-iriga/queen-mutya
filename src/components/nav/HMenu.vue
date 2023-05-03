<template>
    <v-btn
        v-for="duo in $store.getters['events/getAssignedDuos']"
        :key="duo.id"
        :variant="$route.params.duoSlug === duo.slug ? 'tonal' : 'text'"
        class="text-center"
        :class="`justify-center text-center text-button${$route.params.duoSlug === duo.slug ? ' text-yellow' : ''}`"
        @click="handleDuoChange(duo)"
        size="small"
    >
        {{ duo.title }}
    </v-btn>
    <v-btn variant="tonal" @click="refresh" :loading="refreshing" size="small" icon class="mx-3">
        <v-icon icon="mdi-refresh"/>
    </v-btn>
</template>

<script>
    import $ from 'jquery';

    export default {
        name: "HMenu",
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