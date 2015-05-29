<?php

// include our OAuth2 Server object
require_once __DIR__.'/server.php';

$request = OAuth2_Request::createFromGlobals();
$response = new OAuth2_Response();

// Handle a request to a resource and authenticate the access token
if (!$server->verifyResourceRequest($request, $response)) {
    $server->getResponse()->send();
    die;
}
echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
