<?php
// include our OAuth2 Server object
require_once __DIR__.'/server.php';

$request = OAuth2_Request::createFromGlobals();
$response = new OAuth2_Response();

// Handle a request for an OAuth2.0 Access Token and send the response to the client
$server->handleTokenRequest($request, $response)->send();
