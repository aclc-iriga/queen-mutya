<template><div style="display: contents">
    <!-- results -->
    <v-table
        density="comfortable" :bordered="true"
        hover
        :height="scoreSheetHeight"
        fixed-header
    >
        <thead>
            <tr>
                <th colspan="3" class="text-center text-uppercase font-weight-bold text-grey-darken-4 text-h5 py-3">
                    {{ event.title }}
                    <div class="result-title text-center opacity-75 d-none" style="padding-top: 8px;">
                        <h6 class="ma-0" style="line-height: 1;">{{ $store.state.app.title }}</h6>
                    </div>
                </th>
                <th
                    v-for="(technical, technicalKey, technicalIndex) in technicals"
                    :key="technical.id"
                    class="text-center text-uppercase font-weight-bold text-red-darken-4 py-3"
                    :class="{ 'bg-red-lighten-3': !technical.online }"
                >
                    <!-- technical unlock deductions -->
                    <v-btn
                        v-if="technicalSubmitted[technicalKey]"
                        class="unlock"
                        @click="unlockTechnicalDeductions(technical)"
                        variant="text"
                        size="x-small"
                        icon
                        :ripple="false"
                        style="position: absolute; top: -7px; right: -7px"
                    >
                        <v-icon icon="mdi-lock-open-variant"/>
                    </v-btn>

                    Deduct
                    <div>
                        {{ technicalIndex + 1 }}
                    </div>
                    &nbsp;

                    <!-- technical help status -->
                    <div class="help-status mt-1" v-if="technical.calling">
                        <v-chip
                            size="small"
                            color="warning"
                            variant="flat"
                        >
                            HELP
                        </v-chip>
                    </div>
                </th>
                <th
                    v-for="(judge, judgeKey, judgeIndex) in judges"
                    :key="judge.id"
                    class="text-center text-uppercase py-3"
                    :class="{ 'bg-red-lighten-3': !judge.online }"
                >
                    <!-- judge unlock ratings -->
                    <v-btn
                        v-if="judgeSubmitted[judgeKey]"
                        class="unlock"
                        @click="unlockJudgeRatings(judge)"
                        variant="text"
                        size="x-small"
                        icon
                        :ripple="false"
                        style="position: absolute; top: -7px; right: -7px"
                    >
                        <v-icon icon="mdi-lock-open-variant"/>
                    </v-btn>

                    <div
                        :class="{
                            'text-dark-darken-1': judge.is_chairman == 0,
                            'text-red-darken-3': judge.is_chairman == 1
                        }"
                    >
                        <div>
                            Judge {{ judge.number }}<span v-if="judge.is_chairman == 1">*</span>
                        </div>
                        <div class="text-blue-darken-2">
                            <small>Rank</small>
                        </div>
                        <div
                            :class="{
                                'text-dark-darken-1': judge.is_chairman == 0,
                                'text-red-darken-4': judge.is_chairman == 1
                            }"
                            style="margin-top: -10px;"
                        >
                            <small>Rating</small>
                        </div>
                    </div>

                    <!-- judge help status -->
                    <div class="help-status mt-1" v-if="judge.calling">
                        <v-chip
                            size="small"
                            color="warning"
                            variant="flat"
                        >
                            HELP
                        </v-chip>
                    </div>
                </th>
                <th class="text-center text-uppercase font-weight-bold text-blue-darken-4 py-3">
                    Rank<br>Total
                </th>
                <th class="text-center text-uppercase font-weight-bold text-blue-darken-3 py-3">
                    Rank<br>Avg.
                </th>
                <th class="text-center text-uppercase font-weight-bold text-grey-darken-1 py-3">
                    Initial<br>Rank
                </th>
                <th class="text-center text-uppercase font-weight-bold text-green-darken-4 py-3">
                    Rating<br>Avg.
                </th>
                <th class="text-center text-uppercase font-weight-bold text-grey-darken-4 py-3">
                    Final<br>Rank
                </th>
                <th class="text-center text-uppercase font-weight-bold text-grey-darken-4 py-3">
                    Title
                </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(team, teamKey, teamIndex) in teams" :key="team.id">
                <td
                    class="text-h5 text-center font-weight-bold"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                    style="width: 30px;"
                >
                    {{ team.number }}
                </td>
                <td
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                    style="width: 72px;"
                >
                    <v-avatar size="72">
                        <v-img
                            cover
                            :src="`${$store.getters.appURL}/crud/uploads/${team.avatar}`"
                            transition="none"
                            eager
                        />
                    </v-avatar>
                </td>
                <td :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }">
                    <p class="ma-0 text-subtitle-2 text-uppercase font-weight-bold" style="line-height: 1.2">{{ team.name }}</p>
                    <p class="mt-1 mb-0" style="line-height: 1"><small>{{ team.location }}</small></p>
                </td>
                <td
                    v-for="(technical, technicalKey, technicalIndex) in technicals"
                    :key="technical.id"
                    class="text-center text-uppercase font-weight-bold text-red-darken-3"
                    :class="{
                        'bg-grey-lighten-3' : !team.deductions.inputs[technicalKey].is_locked,
                        'bg-white' : team.deductions.inputs[technicalKey].is_locked && team.title === '',
                        'bg-yellow-lighten-3': allSubmitted && team.deductions.inputs[technicalKey].is_locked && team.title !== ''
                    }"
                >
                    <span :class="{ blurred: !team.deductions.inputs[technicalKey].is_locked && team.deductions.inputs[technicalKey].value <= 0 }">
                        {{ team.deductions.inputs[technicalKey].value.toFixed(2) }}
                    </span>
                </td>
                <td
                    v-for="judge in judges" :key="judge.id"
                    class="text-right"
                    :class="{
                        'bg-grey-lighten-3' : !team.ratings.inputs[`judge_${judge.id}`].final.is_locked,
                        'bg-white' : team.ratings.inputs[`judge_${judge.id}`].final.is_locked && team.title === '',
                        'bg-yellow-lighten-3' : allSubmitted && team.ratings.inputs[`judge_${judge.id}`].final.is_locked && team.title !== ''
                    }"
                >
                    <div
                        class="text-right font-weight-bold text-blue-darken-2"
                        :class="{
                            'bg-grey-lighten-3' : !team.ratings.inputs[`judge_${judge.id}`].final.is_locked,
                            'bg-white' : team.ratings.inputs[`judge_${judge.id}`].final.is_locked && team.title === '',
                            'bg-yellow-lighten-3' : allSubmitted && team.ratings.inputs[`judge_${judge.id}`].final.is_locked && team.title !== ''
                        }"
                    >
                        <span :class="{ blurred: !team.ratings.inputs[`judge_${judge.id}`].final.is_locked && (team.ratings.inputs[`judge_${judge.id}`].final.deducted <= 0 || team.ratings.inputs[`judge_${judge.id}`].final.original < $store.state.rating.min) }">
                            {{ team.ratings.inputs[`judge_${judge.id}`].rank.fractional.toFixed(2) }}
                        </span>
                    </div>

                    <div
                        :class="{
                            'text-dark-darken-1': judge.is_chairman == 0,
                            'text-red-darken-3': judge.is_chairman == 1,
                            'text-warning': team.ratings.inputs[`judge_${judge.id}`].final.original < $store.state.rating.min
                        }"
                    >
                        <span :class="{ blurred: !team.ratings.inputs[`judge_${judge.id}`].final.is_locked && team.ratings.inputs[`judge_${judge.id}`].final.deducted <= 0 }">
                            {{ team.ratings.inputs[`judge_${judge.id}`].final.deducted.toFixed(2) }}
                        </span>
                    </div>
                </td>
                <td
                    class="text-right font-weight-bold text-blue-darken-4"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                >
                    <span>{{ team.rank.total.fractional.toFixed(2) }}</span>
                </td>
                <td
                    class="text-right font-weight-bold text-blue-darken-4"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                >
                    <span>{{ team.rank.average.fractional.toFixed(2) }}</span>
                </td>
                <td
                    class="text-right font-weight-bold text-grey-darken-1"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                >
                    <span>{{ team.rank.initial.fractional.toFixed(2) }}</span>
                </td>
                <td
                    class="text-right font-weight-bold text-green-darken-4"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                >
                    <span :style="{ 'opacity': (this.teams_with_ties.includes(teamKey)) ? 1 : 0.45 }">{{ team.ratings.average.toFixed(3) }}</span>
                </td>
                <td
                    class="text-center font-weight-bold text-h6"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                >
                    <span>{{ team.rank.final.fractional }}</span>
                </td>
                <td
                    class="text-center font-weight-bold text-body-1"
                    :class="{ 'bg-yellow-lighten-3': allSubmitted && team.title !== '' }"
                    style="line-height: 1.1"
                >
                    {{ team.title }}
                </td>
            </tr>
            <tr>
                <td :colspan="(9 + totalSignatories)">
                    <v-row class="justify-center">
                        <v-col
                            v-for="technical in technicals" :key="technical.id"
                            :style="{ 'flex': `0 0 ${(signatoryColumnWidth / 12) * 100}%`, 'max-width': `${(signatoryColumnWidth / 12) * 100}%` }"
                        >
                            <v-card class="text-center mb-5" :class="{ 'text-warning': technical.calling }" flat>
                                <v-card-title class="pt-16 pb-1 font-weight-bold">
                                    {{ technical.name }}
                                </v-card-title>
                                <v-card-text class="text-center">
                                    Technical Judge {{ technical.number }}
                                    <p class="mt-2 mb-0 online-status">
                                        <v-chip v-if="technical.online" size="x-small" color="success" variant="outlined">ONLINE</v-chip>
                                        <v-chip v-else size="x-small" color="error" variant="flat">OFFLINE</v-chip>
                                    </p>
                                    <div v-if="technical.active_portion_title" class="user-active-portion mt-3 text-caption text-uppercase text-grey-darken-1">
                                        <div class="d-inline-block" align="left">
                                            <small>OPENED:</small><br>
                                            <p style="margin-top: -5px;"><b>{{ technical.active_portion_title }}</b></p>
                                        </div>
                                    </div>
                                </v-card-text>
                            </v-card>
                        </v-col>

                        <v-col
                            v-for="judge in judges" :key="judge.id"
                            :style="{ 'flex': `0 0 ${(signatoryColumnWidth / 12) * 100}%`, 'max-width': `${(signatoryColumnWidth / 12) * 100}%` }"
                        >
                            <v-card class="text-center mb-5" :class="{ 'text-warning': judge.calling }" flat>
                                <v-card-title class="pt-16 pb-1 font-weight-bold">
                                    {{ judge.name }}
                                </v-card-title>
                                <v-card-text class="text-center">
                                    Judge {{ judge.number }}<template v-if="judge.is_chairman == 1">* (Chairman)</template>
                                    <p class="mt-2 mb-0 online-status">
                                        <v-chip v-if="judge.online" size="x-small" color="success" variant="outlined">ONLINE</v-chip>
                                        <v-chip v-else size="x-small" color="error" variant="flat">OFFLINE</v-chip>
                                    </p>
                                    <div v-if="judge.active_portion_title" class="user-active-portion mt-3 text-caption text-uppercase text-grey-darken-1">
                                        <div class="d-inline-block" align="left">
                                            <small>OPENED:</small><br>
                                            <p style="margin-top: -5px;"><b>{{ judge.active_portion_title }}</b></p>
                                        </div>
                                    </div>
                                </v-card-text>
                            </v-card>
                        </v-col>
                    </v-row>
                </td>
            </tr>
        </tbody>
    </v-table>

    <!-- winners -->
    <v-row
        v-if="Object.values(winners).length > 0"
        class="winners-page d-none justify-center pt-3"
        style="page-break-before: always;"
    >
        <v-col cols="12" sm="9" md="7" lg="5">
            <div style="padding: 15px">
                <table class="table-winners" style="width: 100%">
                    <tbody>
                        <template
                            v-for="(winner, winnerIndex) in Object.entries(winners).reverse()"
                            :key="winner[0]"
                        >
                            <tr v-if="winnerIndex > 0">
                                <td colspan="3" style="height: 100px;"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="pa-3 text-center" style="border: 1px solid #ddd">
                                    <span class="text-h4 font-weight-bold">{{ winner[1] }}</span>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    class="text-h3 text-center font-weight-bold pl-3 py-3 pr-6"
                                    style="border-left: 1px solid #ddd; border-bottom: 1px solid #ddd;"
                                >
                                    {{ teams[winner[0]].number }}
                                </td>
                                <td style="width: 72px; padding-top: 8px !important; padding-bottom: 8px !important; border-bottom: 1px solid #ddd;">
                                    <img
                                        style="width: 100%; border-radius: 100%;"
                                        :src="`${$store.getters.appURL}/crud/uploads/${teams[winner[0]].avatar}`"
                                    />
                                </td>
                                <td
                                    class="pa-3"
                                    style="border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;"
                                >
                                    <p class="ma-0 text-h6 text-uppercase font-weight-bold" style="line-height: 1.2">{{ teams[winner[0]].name }}</p>
                                    <p class="mt-1 text-body-1 mb-0" style="line-height: 1"><small>{{ teams[winner[0]].location }}</small></p>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                </table>
            </div>
        </v-col>
    </v-row>
</div></template>


<script>
    import $ from 'jquery';

    export default {
        name: 'AdminResult',
        props: {
            event: {
                type: Object,
                default: null
            },
            result: {
                type: Object,
                default: null
            }
        },
        data() {
            return {
                openUnlockDialog: false,
            }
        },
		computed: {
            teams() {
                return this.result?.teams;
            },
            judges() {
                return this.result?.judges;
            },
            technicals() {
                return this.result?.technicals;
            },
            winners() {
                return this.result?.winners;
            },
            teams_with_ties() {
                return this.result?.teams_with_ties;
            },
			scoreSheetHeight() {
				return this.$store.getters.windowHeight - 64;
			},
            totalTechnicals() {
                return Object.values(this.technicals).length;
            },
            totalJudges() {
                return Object.values(this.judges).length;
            },
            totalSignatories() {
                return this.totalTechnicals + this.totalJudges;
            },
            signatoryColumnWidth() {
                return [4, 7, 8, 10, 11, 12, 13, 14].includes(this.totalSignatories) ? '3' : '4';
            },
            technicalSubmitted() {
                const status = {};
                for(const technicalKey in this.technicals) {
                    let submitted = true;
                    for(const teamKey in this.teams) {
                        if(!this.teams[teamKey].deductions.inputs[technicalKey].is_locked) {
                            submitted = false;
                            break;
                        }
                    }
                    status[technicalKey] = submitted;
                }
                return status;
            },
            judgeSubmitted() {
                const status = {};
                for(const judgeKey in this.judges) {
                    let submitted = true;
                    for(const teamKey in this.teams) {
                        if(!this.teams[teamKey].ratings.inputs[judgeKey].rank.rating.is_locked) {
                            submitted = false;
                            break;
                        }
                    }
                    status[judgeKey] = submitted;
                }
                return status;
            },
            allSubmitted() {
                let status = true;
                const submissions = {...this.technicalSubmitted, ...this.judgeSubmitted};
                for(const key in submissions) {
                    if(!submissions[key]) {
                        status = false;
                        break;
                    }
                }
                return status;
            }
		},
        methods: {
			unlockJudgeRatings(judge) {
				// ask admin for unlock ratings
				if (confirm(`Are you sure to unlock ratings for ${judge.name} (Judge ${judge.number}) in ${this.event.title}?`)) {
					$.ajax({
						url: `${this.$store.getters.appURL}/admin.php`,
						type: 'POST',
						xhrFields: {
							withCredentials: true
						},
						data: {
							unlock_judge_id: judge.id,
							unlock_event_id: this.event.id
						},
						error: (error) => {
							alert(`ERROR ${error.status}: ${error.statusText}`);
						},
					});
				}
			},
			unlockTechnicalDeductions(technical) {
				// ask admin for unlock ratings
				if (confirm(`Are you sure to unlock deductions for ${technical.name} (Technical ${technical.number}) in ${this.event.title}?`)) {
					$.ajax({
						url: `${this.$store.getters.appURL}/admin.php`,
						type: 'POST',
						xhrFields: {
							withCredentials: true
						},
						data: {
							unlock_technical_id: technical.id,
							unlock_event_id: this.event.id
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
    tbody td, th {
        height: 64px !important;
    }

    tbody td {
        padding-top: 9px !important;
        padding-bottom: 9px !important;
    }

    th, td {
        border: 1px solid #ddd;
    }

    .table-winners tr,
    .table-winners th,
    .table-winners td {
        border: 0;
    }

    .blurred {
        opacity: 0.3;
    }
</style>
