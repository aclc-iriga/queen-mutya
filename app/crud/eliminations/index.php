<?php
const LOGIN_PAGE_PATH = '../';
require_once '../auth.php';

require_once '../../config/database.php';
require_once '../../models/Competition.php';
require_once '../../models/Category.php';
require_once '../../models/Event.php';
require_once '../../models/Team.php';

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../crud/dist/bootstrap-5.2.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../crud/dist/fontawesome-6.3.0/css/all.min.css">
    <script src="../../crud/dist/vue-3.2.47/vue.global.js"></script>
    <script src="../../crud/dist/jquery-3.6.4/jquery-3.6.4.min.js"></script>
    <title>Eliminations</title>
    <style>
        .text-decor-none {
            text-decoration: none !important;
        }
    </style>
</head>
<body>
<div id="app" class="container mt-3">
    <h1 class="text-center fw-bolder ">Eliminations</h1>
    <?php
    $competitions = Competition::all();
    foreach ($competitions as $competition) { ?>
        <h2 class="text-center fw-bold text-uppercase"><?= $competition->getTitle(); ?></h2>
        <?php
        $categories = Category::all($competition->getId());
        foreach ($categories as $category) { ?>
            <hr>
            <div class="row d-flex justify-content-center">
                <h3 class="text-center text-uppercase"><u><?= $category->getTitle(); ?></u></h3>
                <?php
                    $events = Event::all($category->getId());
                foreach ($events as $event) {
                    $event_name = $event->getTitle();
                    $event_id = $event->getId();
                ?>
                    <div class="col-lg-4 col-md-6 text-center mt-3">
                        <table class="table table-bordered text-center">
                            <thead>
                            <tr class="table-danger">
                                <th>#</th>
                                <th class="text-uppercase text-danger"><?= $event_name ?></th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $teams = Team::all(0, 'id, number');
                            foreach ($teams as $team) {
                                $team_name = $team->getName();
                                $team_id = $team->getId();
                                $team_number = $team->getNumber();
                                $team_location = $team->getLocation();
                                $team_avatar = $team->getAvatar();
                                ?>
                                <tr
                                    id="team_<?= $team_id ?>_<?= $event_id ?>"
                                    class="<?= $event->hasTeamBeenEliminated($team) ? 'opacity-25 ' : ''; ?>"
                                    :class="{
                                        'opacity-25': (team['isEliminated_<?= $team_id ?>_<?= $event_id ?>'] == true),
                                        'opacity-100 text-decor-none': (team['isEliminated_<?= $team_id ?>_<?= $event_id ?>'] == false)
                                    }"
                                >
                                    <td class="align-middle fw-bolder fs-4"><?= $team_number ?></td>
                                    <td>
                                        <div class="d-flex">
                                            <div class="d-flex align-items-center">
                                                <img class="ms-2 rounded-5" src="../uploads/<?= $team_avatar ?>" style="height: 3rem;" alt="Photo of <?= $team_name ?>">
                                            </div>
                                            <div class="ms-3 text-start">
                                               <p class="m-0 card-header fw-bold" style="line-height: 1.1;"><?= $team_name ?></p>
                                               <small class="m-0" style="font-size: 12px"><?= $team_location ?></small>
                                           </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <button
                                            id="action_<?= $team_id ?>_<?= $event_id ?>"
                                            class="btn <?= $event->hasTeamBeenEliminated($team) ? 'btn-outline-secondary' : 'btn-outline-danger' ?>"
                                            @click="toggleElimination(<?= $event_id ?>, <?= $team_id ?>)"
                                        >
                                            <i
                                                id="icon_<?= $team_id ?>_<?= $event_id ?>"
                                                class="fa-solid <?= $event->hasTeamBeenEliminated($team) ? 'fa-hands-holding-child' : 'fa-skull-crossbones' ?> fa-fw">
                                            </i>
                                        </button>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    <?php } ?>
</div>
</body>

<script>

    const {createApp} = Vue

    createApp({
        data() {
            return {
                team: {}
            }
        },
        methods: {
            toggleElimination(eventId, teamId) {
                $.ajax({
                    url: 'controller.php',
                    type: 'POST',
                    xhrFields: {
                        withCredentials: true
                    },
                    data: {
                        eventId,
                        teamId
                    },
                    success: (data, textStatus, jqXHR) => {
                        data = JSON.parse(data);

                        this.team[`isEliminated_${teamId}_${eventId}`] = data.teamEliminated;
                        if (this.team[`isEliminated_${teamId}_${eventId}`]) {
                            $(`#icon_${teamId}_${eventId}`)
                                .addClass("fa-hands-holding-child")
                                .removeClass("fa-skull-crossbones");
                            $(`#team_${teamId}_${eventId}`)
                                .removeClass("text-decoration-line-through");
                            $(`#action_${teamId}_${eventId}`)
                                .removeClass("btn-outline-danger")
                                .addClass("btn-outline-secondary");
                        } else {
                            $(`#icon_${teamId}_${eventId}`)
                                .addClass("fa-skull-crossbones")
                                .removeClass("fa-hands-holding-child");
                            $(`#team_${teamId}_${eventId}`)
                                .addClass("text-decoration-line-through");
                            $(`#action_${teamId}_${eventId}`)
                                .removeClass("btn-outline-secondary")
                                .addClass("btn-outline-danger");
                        }
                        console.log(`${jqXHR.status}: ${jqXHR.statusText}`);
                    },
                    error: (error) => {
                        alert(`ERROR ${error.status}: ${error.statusText}`);
                    }
                })
            }
        }
    }).mount('#app')
</script>
</html>
