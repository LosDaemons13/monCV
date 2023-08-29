<?php
$leagueId = $_GET['leagueId'] ?? 53;

$apiUrl = "https://www.fotmob.com/api/tltable?leagueId=" . $leagueId;

$response = file_get_contents($apiUrl);

header('Content-Type: application/json');
echo $response;
