<?php
header('Content-Type: application/json');

// a simple heartbeat to check if the API is running
$obj = new stdClass();
$obj->status = 'Healthy';
$obj->time = time();
$obj->engine = 'ParafiaOS v2.13.7';
echo json_encode($obj);
