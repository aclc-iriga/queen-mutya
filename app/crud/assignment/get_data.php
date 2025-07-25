<?php
const LOGIN_PAGE_PATH = '../';
require_once '../auth.php';

require_once '../../config/database.php';
require_once '../../models/Event.php';
require_once '../../models/Judge.php';

if(isset($_POST['option'])) {
    $option = $_POST['option'];
    if($option != "Select Judge") {
        $judge_data = Judge::findById($option);
        $judgeEvent = $judge_data->getAllEvents();
        $judgeID = $option;

        $all_event = Event::all();
        $j = 0;
        $display = [];
        $displayTitle = [];

        foreach($all_event as $all) {
            foreach($judgeEvent as $evt) {
                if($all->getId() == $evt->getId()) {
                    $j++;
                }

            }
            if($j == 0) {
                $display[] = $all->getId();
            }
            else {
                $j = 0;
            }
        }
        for($i = 0; $i < count($display); $i++) {
            $displayTitle[] = Event::findById($display[$i]);
        }

    }
    else {
        $judgeEvent = [];
    }
    // sleep(1);
}

if (isset($_POST['toggleValue'])){
    $toggleValue = $_POST['toggleValue'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="logo.png">
    <link rel="stylesheet" href="../dist/bootstrap-5.2.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="../dist/fontawesome-6.3.0/css/all.min.css">
    <title>CRUD</title>
    <style>
        .smallSpinner{
            margin-left: 35%;
            display: none;
        }
    </style>
</head>
<body>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData<?= $option ?>"
        style="margin-left: 77%; width: 23%; margin-top: 30px;">
    Assign Event
</button>

<!-- ADD Modal -->
<div class="modal fade" id="addData<?= $option ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Judge: Add Event</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex justify-content-center align-items-center">
                <select class="form-select" aria-label="Default select example"
                        style="width: 50%; color: white; background-color: #2F4F4F; text-align: center;"
                        id="selected_Event<?= $option ?>">
                    <option selected><b>Select Event</b></option>
                    <?php foreach($displayTitle as $disTitle) { ?>
                        <option value="<?= $disTitle->getId() ?>"><?= $disTitle->getTitle() ?></option>
                    <?php } ?>
                </select>
                <div class="d-flex">
                    <div class="form-check form-switch" style="margin-left: 25px;">
                        <input class="form-check-input" value="<?php if (isset($toggleValue)){ echo "true";} else{echo "false";} ?>"  onclick="toggleValue1()"  type="checkbox" id="addEventToggle" style="cursor:pointer;">
                    </div>
                    Chairman
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeAdd<?= $option ?>">
                    Close
                </button>
                <button type="button" class="btn btn-primary" onclick="submitAdd(<?= $option ?>)">Submit</button>
            </div>
        </div>
    </div>
</div>
<table class="table table-bordered" style="margin-top: 10px;">
    <thead>
    <tr style="font-size: 20px;">
        <th style="text-align: center;">
            Event
        </th>
        <th style="text-align: center;">
            Chairman
        </th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($judgeEvent as $eventData) { ?>
        <tr>
            <td style="padding-left: 30px;">
                <?= $eventData->getTitle() ?>
            </td>
            <td style="width: 10%;" align="center">
                <div style="height: 25px">
                    <div class="spinner-border spinner-border-sm text-primary smallSpinner mx-0 d-none" role="status" id="smSpinner<?= $judgeID ?><?= $eventData->getId() ?>">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="form-check form-switch m-0 d-inline-block" onclick="judgeToggle(<?= $judgeID ?>,<?= $eventData->getId() ?>)">
                        <input class="form-check-input" type="checkbox" id="judgeSwitch<?= $judgeID ?><?= $eventData->getId() ?>" <?php if ($judge_data->isChairmanOfEvent(Event::findById($eventData->getId())) == "1") { echo "checked "; echo "value=true";} else{echo "value=false";} ?> style="cursor: pointer">
                    </div>
                </div>
            </td>
            <td style="width: 10%;">
                <span
                    class="fa fa-fw fa-remove text-danger"
                    type="button"
                    style="cursor: pointer;
                    margin-left: 10px;"
                    data-bs-toggle="modal"
                    data-bs-target="#deleteModal<?= $eventData->getId() ?>">
                </span>
            </td>
        </tr>

        <!-- DELETE Modal -->
        <div class="modal fade" id="deleteModal<?= $eventData->getId() ?>" data-bs-backdrop="static"
             data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Do you want to <b>Delete <?= $eventData->getTitle() ?></b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                id="button<?= $eventData->getId() ?>">Close
                        </button>
                        <button class="btn btn-primary" onclick="remove(<?= $judgeID ?>,<?= $eventData->getId() ?>)">
                            Proceed
                        </button>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
    </tbody>
</table>
</body>
</html>
