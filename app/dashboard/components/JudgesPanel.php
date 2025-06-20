<template id="judges-panel"><div style="display: contents;">
<!-------------------------------------------------------->

    <!-- Judges -->
    <div class="row no-gutters mb-3">
        <!-- All Judges Column -->
        <div class="col-12 col-sm-6 col-md-3 col-lg-2">
            <!-- All Judges Container -->
            <div class="p-0 rounded-0" style="border: 1px solid rgb(222, 226, 230)">
                <!-- All Judges Box -->
                <div
                    class="d-flex flex-column p-0 m-0"
                    style="border: 8px solid transparent"
                >
                    <div>
                        <!-- All Judges Header -->
                        <div class="d-flex justify-content-center align-items-center p-2">
                            <div class="dropdown-center" style="z-index: 2147483647">
                                <button
                                    id="btn-judges-dropdown-toggle"
                                    class="btn btn-outline-secondary dropdown-toggle no-caret pe-1 border-0 fw-bold"
                                    data-bs-toggle="dropdown"
                                    data-bs-auto-close="outside"
                                >
                                    ALL JUDGES
                                    <i class="fas fa-fw fa-caret-down"></i>
                                </button>

                                <ul class="dropdown-menu">
                                    <li class="px-3 pb-1 fw-normal text-secondary">
                                        <small style="font-size: 0.8rem; opacity: 0.9">TOGGLE SCREENSAVER</small>
                                    </li>
                                    <li>
                                        <button
                                            class="dropdown-item text-secondary btn-dropdown fw-bold"
                                            @click="$emit('toggle-screensaver-all', { status: true, judgeKeys: onlineVisibleItems })"
                                            :disabled="!hasOnlineJudge"
                                            :style="{ 'opacity': hasOnlineJudge ? '1' : '0.5' }"
                                        >
                                            <i class="fas fa-fw fa-eye"></i> Show Screensaver
                                        </button>
                                    </li>
                                    <li>
                                        <button
                                            class="dropdown-item text-secondary btn-dropdown fw-bold"
                                            @click="$emit('toggle-screensaver-all', { status: false, judgeKeys: onlineVisibleItems })"
                                            :disabled="!hasOnlineJudge"
                                            :style="{ 'opacity': hasOnlineJudge ? '1' : '0.5' }"
                                        >
                                            <i class="fas fa-fw fa-eye-slash"></i> Hide Screensaver
                                        </button>
                                    </li>
                                    <li><hr></li>
                                    <li class="px-3 pb-1 fw-normal text-secondary">
                                        <small style="font-size: 0.8rem; opacity: 0.9">SET ACTIVE DUO / PORTION</small>
                                    </li>
                                    <li v-for="([duoKey, duo], duoIndex) in Object.entries(duos)" :key="duo.id">
                                        <button
                                            class="dropdown-item text-secondary btn-dropdown fw-bold"
                                            @click="$emit('switch-duo-all', { duo: duo, judgeKeys: onlineVisibleItems })"
                                            :disabled="!hasOnlineJudge"
                                            :style="{ 'opacity': hasOnlineJudge ? '1' : '0.5' }"
                                        >
                                            <i class="fas fa-fw fa-bars-progress"></i> {{ duo.title }}
                                        </button>
                                    </li>
                                    <li><hr></li>
                                    <li class="px-3 pb-1 fw-normal text-secondary">
                                        <small style="font-size: 0.8rem; opacity: 0.9">SHOW / HIDE JUDGES</small>
                                    </li>
                                    <li
                                        v-for="([judgeKey, judge], judgeIndex) in Object.entries(judges)"
                                        :key="judge.id"
                                    >
                                        <label
                                            class="dropdown-item d-flex align-items-center btn-dropdown"
                                            style="cursor: pointer; user-select: none; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none;"
                                            :style="{ 'opacity': isJudgeVisible(judgeKey) ? '1' : '0.6' }"
                                        >
                                            <input
                                                class="form-check-input me-2"
                                                type="checkbox"
                                                :checked="isJudgeVisible(judgeKey)"
                                                @click.stop="toggleJudgeVisibility(judgeKey)"
                                            >
                                            <b class="opacity-75">JUDGE #{{ judge.number }}:</b>&nbsp;{{ judge.name }}
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <template
            v-for="([judgeKey, judge], judgeIndex) in Object.entries(processedJudges)"
            :key="judge.id"
            :class="{ 'table-danger': !judge.online, 'help-blink': judge.helpStatus }"
        >
            <!-- Judge Column -->
            <div
                class="col-12 col-sm-6 col-md-3 col-lg-2"
                v-if="judge.visible"
            >
                <!-- Judge Container -->
                <div
                    class="p-0 m-0 rounded-0"
                    :class="{ 'alert alert-danger': !judge.online, 'help-blink': judge.helpStatus }"
                    style="border: 1px solid rgb(222, 226, 230)"
                >
                    <!-- Judge Box -->
                    <div
                        class="d-flex flex-column p-0 m-0"
                        style="transition: border-left 0.2s ease; min-height: 220px;"
                        :style="{ 'border': judge.onScreenSaver && judge.online ? '8px solid rgb(222, 226, 230)' : '8px solid transparent' }"
                    >
                        <div>
                            <!-- Judge Header -->
                            <div class="d-flex justify-content-between align-items-center px-2 pt-2 pb-0">
                                <!-- Judge Number -->
                                <h6 class="m-0" style="font-size: 0.9rem;">
                                    JUDGE #{{ judge.number }}
                                </h6>

                                <!-- Judge Dropdown Menu -->
                                <div class="dropdown d-inline">
                                    <p
                                        :id="`btn-judge-dropdown-toggle-${judge.id}`"
                                        class="dropdown-toggle no-caret m-0 p-0 fw-bold opacity-75"
                                        :class="!judge.helpStatus ? `text-${judge.statusClass}` : ''"
                                        style="font-size: 0.7rem;"
                                        :style="{ 'cursor': judge.online ? 'pointer' : 'not-allowed' }"
                                        data-bs-toggle="dropdown"
                                        role="button"
                                        aria-expanded="false"
                                    >
                                        {{ judge.statusText }}
                                        <i class="fas fa-fw fa-caret-down" v-if="judge.online || judge.helpStatus"></i>
                                    </p>
                                    <ul class="dropdown-menu bg-white" v-show="judge.online || judge.helpStatus" style="z-index: 2147483647">
                                        <li class="py-1 fw-bold" style="font-size: 0.8rem; opacity: 0.8">
                                            <div class="d-flex justify-content-between align-items-center px-3">
                                                <span>JUDGE #{{ judge.number }}</span>
                                                <i class="fas fa-fw fa-remove" style="cursor: pointer" onclick="event.stopPropagation();bootstrap.Dropdown.getOrCreateInstance(this.closest('.dropdown')).hide()"></i>
                                            </div>
                                        </li>
                                        <li v-if="judge.onScreenSaver">
                                            <button class="dropdown-item btn-dropdown text-secondary" @click="$emit('toggle-screensaver', { judge: judge, status: false })">
                                                <small class="fw-bold">
                                                    <i class="fas fa-fw fa-eye-slash"></i> Hide Screensaver
                                                </small>
                                            </button>
                                        </li>
                                        <li v-else>
                                            <button class="dropdown-item btn-dropdown text-success" @click="$emit('toggle-screensaver', { judge: judge, status: true })">
                                                <small class="fw-bold">
                                                    <i class="fas fa-fw fa-eye"></i> Show Screensaver
                                                </small>
                                            </button>
                                        </li>
                                        <li v-if="judge.helpStatus">
                                            <button class="dropdown-item btn-dropdown" @click="$emit('terminate-help', judge.id)" style="color: orangered">
                                                <small class="fw-bold">
                                                    <i class="fas fa-fw fa-circle-question"></i> Terminate Help
                                                </small>
                                            </button>
                                        </li>
                                        <template v-if="judge.online">
                                            <li v-if="judge.duos.length > 0" style="height: 15px;"></li>
                                            <li v-for="(duoKey, duoKeyIndex) in judge.duos" :key="duoKey">
                                                <button
                                                    v-if="judge.activeDuo && judge.activeDuo.id === duos[duoKey].id"
                                                    class="dropdown-item text-success btn-dropdown btn-dropdown-active"
                                                    @click="$emit('refresh-duo', { judge: judge, duo: duos[duoKey] })"
                                                >
                                                    <small class="fw-bold">
                                                        <i class="fas fa-fw fa-rotate"></i> {{ duos[duoKey].title }}
                                                    </small>
                                                </button>
                                                <button
                                                    v-else
                                                    class="dropdown-item text-primary btn-dropdown"
                                                    @click="$emit('switch-duo', { judge: judge, duo: duos[duoKey] })"
                                                >
                                                    <small class="fw-bold">
                                                        <i class="fas fa-fw fa-bars-progress"></i> {{ duos[duoKey].title }}
                                                    </small>
                                                </button>
                                            </li>
                                        </template>
                                    </ul>
                                </div>
                            </div>

                            <!-- Judge Name -->
                            <div class="d-flex justify-content-start align-items-center px-2">
                                <p class="m-0" style="line-height: 1; font-size: 0.75rem; opacity: 0.8; margin-top: 4px !important;">{{ judge.name }}</p>
                            </div>
                        </div>

                        <!-- Judge Duo -->
                        <div v-if="judge.online" class="d-flex flex-grow-1 flex-column justify-content-center align-items-center pt-3 px-2">
                            <p v-if="judge.activeDuo" class="fw-bold opacity-75 text-uppercase text-center mx-0 mt-0 mb-2" style="font-size: 0.85rem;">
                                {{ judge.activeDuo.title }}
                            </p>
                            <div class="d-flex flex-grow-1 flex-column justify-content-between align-items-center w-100" style="padding-bottom: 3px;">
                                <team-block v-if="judge.online && judge.activeTeam" :team="judge.activeTeam" align-items="start"></team-block>
                                <table v-if="judge.activeTeam && judge.activeEvent" style="width: 100%">
                                    <tbody class="border-0">
                                        <tr class="border-0">
                                            <td style="width: 45%; text-align: left; line-height: 1; vertical-align: bottom !important;">
                                                <span style="font-size: 0.65rem; font-weight: bold; opacity: 0.8">{{ judge.activeEvent.title }}</span><br/>
                                                <span style="font-size: 0.7rem; opacity: 0.8">Field #{{ judge.activeColumn + 1 }}</span><br/>
                                            </td>
                                            <td style="width: 55%; text-align: right; line-height: 1; vertical-align: bottom !important;">
                                                <span v-if="judge.activeEvent.criteria[judge.activeColumn]" style="font-size: 0.65rem;">{{ judge.activeEvent.criteria[judge.activeColumn].title }} ({{ judge.activeEvent.criteria[judge.activeColumn].percentage }}%)</span>
                                                <span v-else-if="judge.activeColumn >= judge.activeEvent.criteria.length" style="font-size: 0.65rem;">TOTAL ({{ judge.activeEvent.criteria_total }}%)</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </template>
    </div>

<!-------------------------------------------------------->
</div></template>

<script>
    window.JudgesPanel = {
        /** TEMPLATE */
        template: `#judges-panel`,


        /** COMPONENTS */
        components: {
            TeamBlock
        },


        /** PROPS */
        props: {
            competition: {
                type: String,
                required: true
            },

            judges: {
                type: Object,
                required: true
            },

            duos: {
                type: Object,
                required: true
            },

            events: {
                type: Object,
                required: true
            },

            judgesOnline: {
                type: Array,
                required: true
            },

            judgesDuo: {
                type: Object,
                required: true
            },

            judgesTeamColumn: {
                type: Object,
                required: true
            },

            judgesForHelp: {
                type: Array,
                required: true
            },

            judgesOnScreensaver: {
                type: Array,
                required: true
            },

            teams: {
                type: Object,
                required: true
            }
        },


        /** DATA */
        data() {
            return {
                visible: {
                    key  : 'dashboard-judges',
                    items: []
                }
            }
        },


        /** COMPUTED */
        computed: {
            /**
             * @computed processedJudges
             * @description Judge objects with injected data.
             * @returns {Object}
             */
            processedJudges() {
                const judges = { ...this.judges };
                for (const judgeKey in judges) {
                    // judge online status
                    const isOnline  = this.judgesOnline.includes(judgeKey);
                    let statusText  = 'OFFLINE';
                    let statusClass = 'danger';
                    if (isOnline) {
                        statusText  = 'ONLINE';
                        statusClass = 'success';
                    }

                    // judge active duo
                    let activeDuoKey = '';
                    let activeDuo    = null;
                    if (judgeKey in this.judgesDuo) {
                        activeDuoKey = this.judgesDuo[judgeKey] || '';
                    }
                    if (activeDuoKey in this.duos) {
                        activeDuo = this.duos[activeDuoKey];
                    }

                    // judge active team and column
                    let activeTeamKey = '';
                    let activeColumn  = 0;
                    let activeTeam    = null;
                    if (judgeKey in this.judgesTeamColumn) {
                        activeTeamKey   = this.judgesTeamColumn[judgeKey].team || '';
                        activeColumn = this.judgesTeamColumn[judgeKey].column  || 0;
                    }
                    if (activeTeamKey in this.teams) {
                        activeTeam = this.teams[activeTeamKey];
                    }

                    // judge active event
                    let activeEventKey = '';
                    let activeEvent    = null;
                    if (activeDuo !== null && activeTeamKey !== '') {
                        for (let i = 0; i < activeDuo.events.length; i++) {
                            const eventKey = activeDuo.events[i];
                            const event    = this.events[eventKey];
                            if (event) {
                                if (event.teams.includes(activeTeamKey)) {
                                    activeEventKey = eventKey;
                                    activeEvent    = event;
                                    break;
                                }
                            }
                        }
                    }

                    // judge help request status
                    const helpStatus = this.judgesForHelp.includes(judgeKey);
                    if (helpStatus) {
                        statusText += ': HELP';
                    }

                    judges[judgeKey] = {
                        ...judges[judgeKey],
                        online        : isOnline,
                        statusText    : statusText,
                        statusClass   : statusClass,
                        activeDuoKey  : activeDuoKey,
                        activeDuo     : activeDuo,
                        activeEventKey: activeEventKey,
                        activeEvent   : activeEvent,
                        activeTeamKey : activeTeamKey,
                        activeTeam    : activeTeam,
                        activeColumn  : activeColumn,
                        helpStatus    : helpStatus,
                        onScreenSaver : this.judgesOnScreensaver.includes(judgeKey),
                        visible       : this.isJudgeVisible(judgeKey)
                    }
                }

                return judges;
            },

            /**
             * @computed onlineVisibleItems
             * @description Visible items that are online.
             */
            onlineVisibleItems() {
                const items = [];
                for (let i = 0; i < this.visible.items.length; i++) {
                    if (this.processedJudges[this.visible.items[i]]) {
                        if (this.processedJudges[this.visible.items[i]].online) {
                            items.push(this.visible.items[i]);
                        }
                    }
                }

                return items;
            },

            /**
             * @computed hasOnlineJudge
             * @desription There's an online judge.
             * @returns {boolean}
             */
            hasOnlineJudge() {
                return this.onlineVisibleItems.length > 0;
            }
        },


        /** WATCHERS */
        watch: {

        },


        /** METHODS */
        methods: {
            /**
             * @method storeVisibleJudges
             * @description Store the visible judges to local storage.
             */
            storeVisibleJudges() {
                localStorage.setItem(`${this.competition}-${this.visible.key}`, JSON.stringify(this.visible.items));
            },

            /**
             * @method retrieveVisibleJudges
             * @description Retrieve the visible judges from local storage.
             */
            retrieveVisibleJudges() {
                const visibleJudges = localStorage.getItem(`${this.competition}-${this.visible.key}`);
                if (visibleJudges) {
                    let items = null;
                    try { items = JSON.parse(visibleJudges); } catch (e) {}
                    if (items) {
                        this.visible.items = items;
                        for (const judgeKey in this.judges) {
                            this.judges[judgeKey]['visible'] = this.visible.items.includes(judgeKey);
                        }
                    }
                }
            },

            /**
             * @method addVisibleJudge
             * @description Add visible judge.
             * @param {string} judgeKey
             */
            addVisibleJudge(judgeKey) {
                if (!(this.visible.items.includes(judgeKey))) {
                    this.visible.items.push(judgeKey);
                    this.judges[judgeKey].visible = true;
                    this.storeVisibleJudges();
                }
            },

            /**
             * @method removeVisibleJudge
             * @description Remove visible judge.
             * @param {string} judgeKey
             */
            removeVisibleJudge(judgeKey) {
                const index = this.visible.items.indexOf(judgeKey);
                if (index !== -1) {
                    this.visible.items.splice(index, 1);
                    this.judges[judgeKey].visible = false;
                    this.storeVisibleJudges();
                }
            },

            /**
             * @method isJudgeVisible
             * @description Checks if judge is visible.
             * @param judgeKey
             * @returns {boolean}
             */
            isJudgeVisible(judgeKey) {
                return this.visible.items.includes(judgeKey);
            },

            /**
             * @method toggleJudgeVisibility
             * @description Toggle judge visibility.
             * @param {string} judgeKey
             */
            toggleJudgeVisibility(judgeKey) {
                if (this.isJudgeVisible(judgeKey)) {
                    this.removeVisibleJudge(judgeKey);
                }
                else {
                    this.addVisibleJudge(judgeKey);
                }
            }
        },


        /** CREATED HOOK */
        created() {
            // initialize visible judges
            this.visible.items = Object.keys(this.judges);
        },


        /** MOUNTED HOOK */
        mounted() {
            this.$nextTick(() => {
                // retrieve the visible judges from local storage
                this.retrieveVisibleJudges();
            });
        },


        /** BEFORE UNMOUNT HOOK*/
        beforeUnmount() {

        }
    };
</script>