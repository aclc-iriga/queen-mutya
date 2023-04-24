export default {
    namespaced: true,

    state: {
        duos  : [],
        events: []
    },

    getters: {
        getDuos(state) {
            return state.duos;
        },
        getEvents(state) {
            return state.events;
        },
        getAssignedDuos(state) {
            const duos = [];
            for(let i=0; i<state.duos.length; i++) {
                const duo = state.duos[i];

                // get slug of event1
                let eventSlug1 = null;
                for(let j=0; j<state.events.length; j++) {
                    const event = state.events[j];
                    if(event.id === duo.event_id_1) {
                        eventSlug1 = event.slug;
                        break;
                    }
                }

                // get slug of event2
                let eventSlug2 = null;
                for(let j=0; j<state.events.length; j++) {
                    const event = state.events[j];
                    if(event.id === duo.event_id_2) {
                        eventSlug2 = event.slug;
                        break;
                    }
                }

                // push to duos
                if(eventSlug1 || eventSlug2) {
                    duo.eventSlugs = [eventSlug1, eventSlug2];
                    duos.push(duo);
                }
            }
            return duos;
        }
    },
    mutations: {
        setDuos(state, payload) {
            state.duos = payload;
        },
        setEvents(state, payload) {
            state.events = payload;
        }
    }
};