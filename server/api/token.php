<?php

require_once "../util/log.php";
require_once '../auth/server.php';

$request = OAuth2_Request::createFromGlobals();

$request->request['grant_type'] = 'password';
$request->request['client_id'] = 'testclient';
$request->request['client_secret'] = 'testpass';

$server->handleTokenRequest($request, new OAuth2_Response())->send();