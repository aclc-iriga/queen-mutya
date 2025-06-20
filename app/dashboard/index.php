<?php
const LOGIN_PAGE_PATH = '../crud/';
require_once '../crud/auth.php';
require_once '../config/database.php';

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="../crud/dist/bootstrap-5.2.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../crud/dist/fontawesome-6.3.0/css/all.min.css"/>
    <script src="../crud/dist/vue-3.2.47/vue.global.js"></script>
    <style>
        th, td {
            vertical-align: middle !important;
        }
        .help-blink {
            animation: helpBlink 1.2s infinite;
            color: inherit;
        }
        .no-caret::after {
            display: none !important;
        }
        .btn-dropdown-active,
        .btn-dropdown-active:active {
            background-color: #eee !important;
        },
        .btn-dropdown:not(.btn-dropdown-active):hover {
            background-color: #ddd !important;
        }
        .btn-dropdown:not(.btn-dropdown-active):active {
            background-color: #ccc !important;
        }
        #dashboard-container {
            height: 100vh;
        }
        @keyframes helpBlink {
            0%, 100% {
                color: inherit;
                background: orange;
            }
            50% {
                color: orangered;
                background: inherit;
            }
        }
        @media (max-width: 768px) {
            #dashboard-container {
                height: 100%;
            }
        }
    </style>
    <title>Dashboard</title>
</head>
<body style="background-color: #f9f9f9;">
    <?php require_once __DIR__ . '/components/TeamBlock.vue.php'; ?>
    <?php require_once __DIR__ . '/components/JudgeBlock.vue.php'; ?>
    <?php require_once __DIR__ . '/components/JudgeAvatar.vue.php'; ?>
    <?php require_once __DIR__ . '/components/JudgesPanel.php'; ?>
    <?php require_once __DIR__ . '/components/TeamsTable.vue.php'; ?>
    <?php require_once __DIR__ . '/Dashboard.vue.php'; ?>

    <div id="app">
        <dashboard></dashboard>
    </div>

    <script>
        const app = Vue.createApp({});
        app.component('dashboard', Dashboard);
        app.mount('#app');
    </script>
    <script src="../crud/dist/bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>
    <script>
        // reload on idle
        let idleTime = null;

        // set idle time for 5 minutes
        const startIdleTime = () => {
            idleTime = setTimeout(() => {
                window.location.reload();
            }, 300000);
        }

        // clear idle time
        const clearIdleTime = () => {
            clearTimeout(idleTime);
            startIdleTime();
        }

        // start idle time
        startIdleTime();

        // event handlers
        window.addEventListener('mousemove', function() {
            clearIdleTime();
        });
        window.addEventListener('keypress', function() {
            clearIdleTime();
        });
    </script>
</body>
</html>