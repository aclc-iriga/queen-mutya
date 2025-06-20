<?php
    require_once __DIR__ . '/../models/User.php';
    require_once __DIR__ . '/../models/Team.php';
    require_once __DIR__ . '/../models/Duo.php';
    require_once __DIR__ . '/../models/Judge.php';
    require_once __DIR__ . '/../models/Event.php';


    // get admin user
    $admin_assoc = User::getUser();

    // get project directory (competition)
    $competition = explode('/', trim($_SERVER['REQUEST_URI'], '/'))[0];

    // get websocket url
    $websocket_url = '';
    if (file_exists(__DIR__ . '/../config/websocket.php')) {
        require_once __DIR__ . '/../config/websocket.php';
        if (isset($websocket)) {
            $websocket_url = $websocket['url'];
        }
    }

    // get teams
    $team_objects = Team::all();
    $teams_assoc  = [];
    foreach ($team_objects as $team_object) {
        $team_key = 'team_' . $team_object->getId();
        $teams_assoc[$team_key] = $team_object->toArray();
    }

    // get duos
    $duo_objects = Duo::all();
    $duos_assoc  = [];
    $event_duos  = [];
    foreach ($duo_objects as $duo_object) {
        $duo_key = 'duo_' . $duo_object->getId();
        $duos_assoc[$duo_key] = $duo_object->toArray();
        $event1_key = 'event_' . $duo_object->getEventId1();
        $event2_key = 'event_' . $duo_object->getEventId2();
        $duos_assoc[$duo_key]['events'] = [
            $event1_key,
            $event2_key
        ];
        $event_duos[$event1_key] = $duo_key;
        $event_duos[$event2_key] = $duo_key;
    }

    // get judges
    $judge_objects = Judge::all();
    $judges_assoc  = [];
    foreach ($judge_objects as $judge_object) {
        $judge_key = 'judge_' . $judge_object->getId();
        $judges_assoc[$judge_key] = [ ...$judge_object->toArray(), 'visible' => true ];

        // judge events and duos
        $judges_assoc[$judge_key]['events'] = [];
        $judges_assoc[$judge_key]['duos']   = [];
        foreach ($judge_object->getAllEvents() as $event_object) {
            $event_key = 'event_' . $event_object->getId();
            $judges_assoc[$judge_key]['events'][] = $event_key;
            if (isset($event_duos[$event_key])) {
                if (!in_array($event_duos[$event_key], $judges_assoc[$judge_key]['duos'])) {
                    $judges_assoc[$judge_key]['duos'][] = $event_duos[$event_key];
                }
            }
        }
    }

    // get events
    $event_objects = Event::all();
    $events_assoc  = [];
    foreach ($event_objects as $event_object) {
        $event_key = 'event_' . $event_object->getId();
        $events_assoc[$event_key] = $event_object->toArray();

        // event criteria
        $events_assoc[$event_key]['criteria'] = $event_object->getRowCriteria();

        // event criteria percentage total
        $events_assoc[$event_key]['criteria_total'] = $event_object->getTotalCriteriaPercentage();

        // event teams
        $events_assoc[$event_key]['teams'] = [];
        foreach ($event_object->getAllTeams() as $team_object) {
            $team_key = 'team_' . $team_object->getId();
            $events_assoc[$event_key]['teams'][] = $team_key;
        }

        // event judges
        $events_assoc[$event_key]['judges'] = [];
        $events_assoc[$event_key]['judge_chairmen'] = [];
        foreach ($event_object->getAllJudges() as $judge_object) {
            $judge_key = 'judge_' . $judge_object->getId();
            $events_assoc[$event_key]['judges'][] = $judge_key;
            if ($judge_object->isChairmanOfEvent($event_object)) {
                $events_assoc[$event_key]['judge_chairmen'][] = $judge_key;
            }
        }
    }
?>
<template id="dashboard"><div style="display: contents;">
<!-------------------------------------------------------->

    <div id="dashboard-container" style="display: flex; flex-direction: column; overflow: hidden;">
        <div class="position-sticky px-3 pb-3" style="top: 15px; z-index: 2147483646;">
            <!-- Judges Table -->
            <judges-panel
                competition="<?= $competition ?>"
                :judges="judges"
                :duos="duos"
                :events="events"
                :judges-online="judges_online"
                :judges-duo="judges_duo"
                :judges-team-column="judges_team_column"
                :judges-for-help="judges_for_help"
                :judges-on-screensaver="judges_on_screensaver"
                :teams="teams"
                @toggle-screensaver="toggleScreensaver"
                @toggle-screensaver-all="toggleScreensaverAll"
                @terminate-help="terminateJudgeHelp"
                @switch-duo="switchJudgeDuo"
                @refresh-duo="refreshJudgeDuo"
                @switch-duo-all="switchAllJudgeDuo"
            >
            </judges-panel>
        </div>
        <div class="overflow-auto" style="flex: 1;">
            <div class="row justify-content-center mx-0"
                v-for="([duoKey, duo], duoIndex) in Object.entries(duos)"
                :key="duo.id"
            >
                <template
                    v-for="(eventKey, eventKeyIndex) in duo.events"
                    :key="eventKey"
                >
                    <div v-if="events[eventKey].slug !== ''" class="col-12 col-sm-12 col-md-12 col-lg-6">
                        <teams-table
                            competition="<?= $competition ?>"
                            :teams="teams"
                            :event="events[eventKey]"
                            :duo="duos[event_duos[eventKey]]"
                            :judges="judges"
                            :judges-online="judges_online"
                            :judges-duo="judges_duo"
                            :judges-team-column="judges_team_column"
                            :judges-for-help="judges_for_help"
                        >
                        </teams-table>
                    </div>
                </template>
            </div>
        </div>
    </div>

<!-------------------------------------------------------->
</div></template>

<script>
    window.Dashboard = {
        /** TEMPLATE */
        template: `#dashboard`,


        /** COMPONENTS */
        components: {
            JudgesPanel,
            TeamsTable
        },


        /** PROPS */
        props: {

        },


        /** DATA */
        data() {
            return {
                admin: <?= json_encode($admin_assoc) ?>,

                websocket: {
                    url : '<?= $websocket_url ?>',
                    conn: null
                },

                duos      : <?= json_encode($duos_assoc) ?>,
                events    : <?= json_encode($events_assoc) ?>,
                event_duos: <?= json_encode($event_duos) ?>,
                teams     : <?= json_encode($teams_assoc) ?>,
                judges    : <?= json_encode($judges_assoc) ?>,

                judges_online        : [],
                judges_duo           : {},
                judges_team_column   : {},
                judges_for_help      : [],
                judges_on_screensaver: []
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
            /**
             * @method websocketSend
             * @description Send message to WebSocket server.
             * @param {string} action
             * @param {any} payload
             */
            websocketSend(action, payload) {
                if (this.websocket.conn !== null && this.websocket.conn.readyState === WebSocket.OPEN) {
                    this.websocket.conn.send(JSON.stringify({
                        competition: '<?= $competition ?>',
                        entity     : 'dashboard',
                        id         : this.admin?.id,
                        action     : action,
                        payload    : payload
                    }));
                }
            },

            /**
             * @method toggleScreensaver
             * @description Toggle judge screensaver.
             * @param {Object} payload
             */
            toggleScreensaver(payload) {
                if ('judge' in payload && 'status' in payload) {
                    this.websocketSend(
                        '__toggle_judge_screensaver__',
                        {
                            judge_id: payload.judge.id,
                            status  : payload.status
                        }
                    );
                }
            },

            /**
             * @method toggleScreensaverAll
             * @description Toggle all judges' screensaver status.
             * @param {Object} payload
             */
            toggleScreensaverAll(payload) {
                if ('status' in payload && 'judgeKeys' in payload) {
                    const status    = payload.status;
                    const judgeKeys = payload.judgeKeys;
                    if (judgeKeys.length > 0) {
                        if (confirm(`${status ? 'SHOW' : 'HIDE'} screensaver of ALL VISIBLE JUDGES?`)) {
                            this.websocketSend(
                                '__toggle_all_judge_screensaver__',
                                {
                                    status    : status,
                                    judge_keys: judgeKeys
                                }
                            );
                            setTimeout(() => {
                                document.getElementById('btn-judges-dropdown-toggle').click();
                            }, 1);
                        }
                    }
                }
            },

            /**
             * @method terminateJudgeHelp
             * @description Turn off help for given judge id.
             * @param {number} judgeId
             */
            terminateJudgeHelp(judgeId) {
                this.websocketSend(
                    '__terminate_help__',
                    {
                        judge_id: judgeId
                    }
                );
            },

            /**
             * @method switchJudgeDuo
             * @description Switch judge event.
             * @param {Object} payload
             */
            switchJudgeDuo(payload) {
                if (payload.judge && payload.duo) {
                    if (confirm(`SWITCH active duo of JUDGE #${payload.judge.number} to "${payload.duo.title}"?`)) {
                        this.websocketSend(
                            '__switch_judge_event__',
                            {
                                judge_id  : payload.judge.id,
                                event_slug: payload.duo.slug
                            }
                        );
                    }
                }
            },

            /**
             * @method refreshJudgeDuo
             * @description Refresh judge duo.
             * @param {Object} payload
             */
            refreshJudgeDuo(payload) {
                if (payload.judge && payload.duo) {
                    if (confirm(`REFRESH "${payload.duo.title}" of JUDGE #${payload.judge.number}?`)) {
                        this.websocketSend(
                            '__refresh_judge_event__',
                            {
                                judge_id  : payload.judge.id,
                                event_slug: payload.duo.slug
                            }
                        );
                    }
                }
            },

            /**
             * @method switchAllJudgeDuo
             * @description Switch all judges' duo.
             * @param {Object} payload
             */
            switchAllJudgeDuo(payload) {
                if ('duo' in payload && 'judgeKeys' in payload) {
                    const duo       = payload.duo;
                    const judgeKeys = payload.judgeKeys;
                    if (duo && judgeKeys.length > 0) {
                        if (confirm(`SWITCH active duo of ALL VISIBLE JUDGES to "${duo.title}"?`)) {
                            this.websocketSend(
                                '__switch_all_judge_event__',
                                {
                                    event_slug: duo.slug,
                                    judge_keys: judgeKeys
                                }
                            );
                            setTimeout(() => {
                                document.getElementById('btn-judges-dropdown-toggle').click();
                            }, 1);
                        }
                    }
                }
            }
        },


        /** CREATED HOOK */
        created() {
            if (this.websocket.url !== '') {
                // initialize websocket connection
                this.websocket.conn = new WebSocket(`${this.websocket.url}?competition=<?= $competition ?>&entity=dashboard&id=${this.admin?.id}`);

                // handle websocket open
                this.websocket.conn.onopen = () => {

                };

                // handle websocket message
                this.websocket.conn.onmessage = (e) => {
                    let data = {};
                    try { data = JSON.parse(e.data); } catch (e) {}

                    if ('subject' in data && 'body' in data) {
                        const subject = data.subject;
                        const body    = data.body;

                        // receive online judges
                        if (subject === '__online_judges__') {
                            this.judges_online = body;
                        }

                        // receive active event of judges
                        else if (subject === '__judges_active_event__') {
                            if (body) {
                                const body2 = {};
                                for (const judgeKey in body) {
                                    body2[judgeKey] = body[judgeKey].replace('event_', 'duo_');
                                }
                                this.judges_duo = body2;
                            }
                        }

                        // receive active team and column of judges
                        else if (subject === '__judges_active_team_column__') {
                            this.judges_team_column = body;
                        }

                        // receive judges requesting for help
                        else if (subject === '__judges_requesting_help__') {
                            this.judges_for_help = body;
                        }

                        // receive judges on screensaver
                        else if (subject === '__judges_on_screensaver__') {
                            this.judges_on_screensaver = body;
                        }
                    }
                };

                // handle websocket close
                this.websocket.conn.onclose = () => {

                };
            }
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