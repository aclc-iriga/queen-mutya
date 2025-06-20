<template id="team-block"><div style="display: contents;">
<!-------------------------------------------------------->

    <div :class="`d-flex justify-content-start align-items-${alignItems} gap-2 w-100 px-0`">
        <div
            class="flex-shrink-0 flex-grow-0"
            style="position: relative; overflow: hidden; border-radius: 100%"
            :style="{ 'height': `${avatarSize}px`, 'width': `${avatarSize}px` }"
        >
            <img :src="`../crud/uploads/${team.avatar}`" style="position: absolute: top: 0; left: 0; width: 100%;"/>
        </div>
        <div>
            <h5 class="m-0 p-0" v-if="!noNumber" style="font-size: 1.1rem;">#{{ team.number }}</h5>
            <p class="m-0 p-0 fw-bold opacity-75" style="font-size: 0.65rem;">{{ team.name }}</p>
            <p class="m-0 p-0 fw-bold opacity-75" style="font-size: 0.6rem;">{{ team.location }}</p>
        </div>
    </div>

<!-------------------------------------------------------->
</div></template>

<script>
    window.TeamBlock = {
        /** TEMPLATE */
        template: `#team-block`,


        /** COMPONENTS */
        components: {

        },


        /** PROPS */
        props: {
            team: {
                type: Object,
                required: true
            },

            noNumber: {
                type: Boolean,
                default: false
            },

            avatarSize: {
                type: String,
                default: '48'
            },

            alignItems: {
                type: String,
                default: 'center'
            }
        },


        /** DATA */
        data() {
            return {

            }
        },


        /** COMPUTED */
        computed: {
            
        },


        /** WATCHERS */
        watch: {

        },


        /** METHODS */
        methods: {

        },


        /** CREATED HOOK */
        created() {

        },


        /** MOUNTED HOOK */
        mounted() {
            this.$nextTick(() => {

            });
        },


        /** BEFORE UNMOUNT HOOK*/
        beforeUnmount() {

        }
    };
</script>