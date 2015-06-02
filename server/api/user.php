<?php

require_once "../auth/server.php";
require_once "../db/GrapesDB.php";
require_once "../util/log.php";


Logger::log("\r\n=========== user.php start ===========");

if (!$server->verifyResourceRequest(OAuth2_Request::createFromGlobals(), new OAuth2_Response())) {
    $server->getResponse()->send();
    die;
}

define("HOST", "localhost");
define("USER_NAME", "happymuslim_f");
define("USER_PASS", "happymuslim");
define("DB_NAME", "happymuslim");

$result = array();
$result["_id"] = $_REQUEST['_id'];


$grapesDB = new GrapesDB(HOST, USER_NAME, USER_PASS, DB_NAME);

switch ($_REQUEST['api']){
    case "check_user":
        Logger::log('check_user');
        $code = $grapesDB->checkUser($_REQUEST['username'], $_REQUEST['password']);
        $data = array("code"=>$code);
        break;
    case "add_user":
        Logger::log('add_user');
        $success = $grapesDB->addUser(
            $_REQUEST['user'],
            $_REQUEST['password'],
            $_REQUEST['nickname'],
            $_REQUEST['sex'],
            $_REQUEST['phone'],
            $_REQUEST['mail'],
            $_REQUEST['address'],
            $_REQUEST['headicon']
        );
        $data = array("success"=>$success);
        break;
    case "user":
        Logger::log('user');
        $data = $grapesDB->getUser($_REQUEST['user']);
        break;
    case "users":
        Logger::log('users');
        $data = $grapesDB->getUsers($_REQUEST['count']);
        break;
    default:
        $data = array();
}

$result["data"] = $data;

$res_type = $_REQUEST['res'];

if($res_type == 'jsonp'){
    echo $_REQUEST['_callback']."(".json_encode($result).")";
} else {
    echo json_encode($result);
}