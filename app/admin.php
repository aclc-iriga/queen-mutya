<?php
require_once '_init.php';

// get authenticated user
$authUser = getUser();

if(!$authUser)
    denyAccess();

else if($authUser['userType'] !== 'admin')
    denyAccess();

else {
    require_once 'models/Admin.php';
    $admin = new Admin($authUser['username'], $_SESSION['pass']);

    if(!$admin->authenticated())
        denyAccess();

    else {
        // get events
        if(isset($_GET['getEvents'])) {
            require_once 'models/Duo.php';
            require_once 'models/Event.php';

            echo json_encode([
                'duos'   => Duo::rows(),
                'events' => Event::rows()
            ]);
        }

        // tabulate a duo
        else if(isset($_GET['tabulate'])) {
            require_once 'models/Duo.php';

            // get duo object
            $duo_slug = trim($_GET['tabulate']);
            $duo = Duo::findBySlug($duo_slug);
            // $admin->setActivePortion($duo_slug);

            // get events
            $event_1 = $duo->getEvent1();
            $event_2 = $duo->getEvent2();

            // tabulate events
            $result_1 = $event_1 ? $admin->tabulate($event_1) : null;
            $result_2 = $event_2 ? $admin->tabulate($event_2) : null;

            echo json_encode([
                'duoSlug' => $duo_slug,
                'results' => [
                    'event_1'  => $event_1->toArray(),
                    'event_2'  => $event_2->toArray(),
                    'result_1' => $result_1,
                    'result_2' => $result_2
                ]
            ]);
        }

        // unlock ratings of judge for an event
        else if (isset($_POST['unlock_judge_id']) && isset($_POST['unlock_event_id'])) {
            // instantiate judge object
            require_once 'models/Judge.php';
            $judge = Judge::findById($_POST['unlock_judge_id']);

            // instantiate event object
            require_once 'models/Event.php';
            $event = Event::findById($_POST['unlock_event_id']);

            // unlock ratings of judge
            $judge->unlockRatings($event);
        }

        // unlock deductions of technical for an event
        else if (isset($_POST['unlock_technical_id']) && isset($_POST['unlock_event_id'])) {
            // instantiate technical object
            require_once 'models/Technical.php';
            $technical = Technical::findById($_POST['unlock_technical_id']);

            // instantiate event object
            require_once 'models/Event.php';
            $event = Event::findById($_POST['unlock_event_id']);

            // unlock deductions of technical
            $technical->unlockDeductions($event);
        }

        else
            denyAccess();
    }
}
