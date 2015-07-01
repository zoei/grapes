<?php

require_once "../auth/server.php";
require_once "../db/GrapesDB.php";
require_once "../util/log.php";

Logger::log("\r\n=========== act.php start ===========");

function auth(){
    if (!$server->verifyResourceRequest(OAuth2_Request::createFromGlobals(), new OAuth2_Response())) {
        $server->getResponse()->send();
        die;
    }
}

define("HOST", "localhost");
define("USER_NAME", "happymuslim_f");
define("USER_PASS", "happymuslim");
define("DB_NAME", "happymuslim");

$result = array();
$result["_id"] = $_REQUEST['_id'];

$grapesDB = new GrapesDB(HOST, USER_NAME, USER_PASS, DB_NAME);

switch ($_REQUEST['api']){
    case "act":
        Logger::log('act');
        $data = $grapesDB->getActivity($_REQUEST['act']);
        break;
    case "act_detail":
        Logger::log('act_detail');
        $data = $grapesDB->getActivityDetail($_REQUEST['act']);
        break;
    case "acts":
        Logger::log('acts');
        $data = $grapesDB->getAllActivities($_REQUEST['count']);
        break;
    case "public_acts":
        Logger::log('public_acts');
        $data = $grapesDB->getPublicActivities($_REQUEST['count']);
        break;
    case "private_acts":
        Logger::log('private_acts');
        $data = $grapesDB->getPrivateActivities($_REQUEST['user'], $_REQUEST['count']);
        break;
    case "user_acts":
        Logger::log('user_acts');
        $data = $grapesDB->getUserActivities($_REQUEST['user']);
        break;
    case "act_members":
        Logger::log('act_members');
        $data = $grapesDB->getActivityMembers($_REQUEST['act']);
        break;
    case "join_act":
        Logger::log('join_act');
        $success = $grapesDB->joinActivity($_REQUEST['act'], $_REQUEST['user']);
        $data = array("success"=>$success);
        break;
    case "add_act":
        Logger::log('add_act');
        $success = $grapesDB->addActivity(
            $_REQUEST['title'],
            $_REQUEST['category'],
            $_REQUEST['planner'],
            $_REQUEST['time'],
            $_REQUEST['address'],
            $_REQUEST['fee'],
            $_REQUEST['content'],
            $_REQUEST['comment'],
            $_REQUEST['image_urls'],
            $_REQUEST['scope']
        );
        $data = array("act_id"=>$success);
        break;
    case "add_act_item":
        Logger::log('add_act_item');
        $success = $grapesDB->addActivityItem(
            $_REQUEST['act'],
            $_REQUEST['title'],
            $_REQUEST['category'],
            $_REQUEST['place'],
            $_REQUEST['lasting'],
            $_REQUEST['content'],
            $_REQUEST['image_urls']
        );
        $data = array("success"=>$success);
        break;
    case "add_act_items":
        Logger::log('add_act_items');
        $success = $grapesDB->addActivityItems(
            $_REQUEST['act'],
            json_decode($_REQUEST['items'])
        );
        $data = array("success"=>$success);
        break;
    case "get_act_msg":
        Logger::log('get_act_msg');
        $data = $grapesDB->getActivityMessages($_REQUEST['act'], $_REQUEST['count'], $_REQUEST['start']);
        break;
    case "add_act_msg":
        Logger::log('add_act_msg');
        $success = $grapesDB->addActivityMessage(
            $_REQUEST['act'],
            $_REQUEST['user'],
            $_REQUEST['msg']
        );
        $data = array("success"=>$success);
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

?>