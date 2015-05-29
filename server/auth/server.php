<?php

$dsn      = 'mysql:dbname=happymuslim;host=localhost';
$username = 'happymuslim_f';
$password = 'happymuslim';
$config   = array(
  'client_table'        => 'grapes_oauth_clients',
  'access_token_table'  => 'grapes_oauth_access_tokens',
  'refresh_token_table' => 'grapes_oauth_refresh_tokens',
  'code_table'          => 'grapes_oauth_authorization_codes',
  'user_table'          => 'grapes_oauth_users',
  'jwt_table'           => 'grapes_oauth_jwt',
  'jti_table'           => 'grapes_oauth_jti',
  'scope_table'         => 'grapes_oauth_scopes',
  'public_key_table'    => 'grapes_oauth_public_keys',
);

// error reporting (this is a demo, after all!)
ini_set('display_errors',1);error_reporting(E_ALL);

// Autoloading (composer is preferred, but for this example let's just do this)
require_once('../lib/OAuth2/Autoloader.php');
OAuth2_Autoloader::register();

// $dsn is the Data Source Name for your database, for exmaple "mysql:dbname=my_oauth2_db;host=localhost"
$storage = new OAuth2_Storage_Pdo(array('dsn' => $dsn, 'username' => $username, 'password' => $password), $config);

// Pass a storage object or array of storage objects to the OAuth2 server class
$server = new OAuth2_Server($storage);

// Add the "Client Credentials" grant type (it is the simplest of the grant types)
$server->addGrantType(new OAuth2_GrantType_ClientCredentials($storage));

// Add the "Authorization Code" grant type (this is where the oauth magic happens)
$server->addGrantType(new OAuth2_GrantType_AuthorizationCode($storage));

// Add the "Authorization Code" grant type (this is where the oauth magic happens)
$server->addGrantType(new OAuth2_GrantType_UserCredentials($storage));