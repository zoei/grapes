angular.module("grapes", [
  "ngRoute"
  "ngResource"
  "hmTouchEvents"
  "grapes.utils"
  "grapes.services"
  "grapes.directives"
  "grapes.controllers"
]).config [
  "$routeProvider"
  ($routeProvider) ->
    $routeProvider.when("/welcome",
      templateUrl: "partials/welcome.html"
      controller: "WelcomeCtrl"
    ).when("/home",
      templateUrl: "partials/home.html"
      controller: "HomeCtrl"
    ).when("/detail/:act_id",
      templateUrl: "partials/detail.html"
      controller: "DetailCtrl"
    ).when("/user_login",
      templateUrl: "partials/login.html"
      controller: "UserLoginCtrl"
    ).when("/user_reg",
      templateUrl: "partials/register.html"
      controller: "UserRegCtrl"
    ).when("/user_console",
      templateUrl: "partials/user_console.html"
      controller: "UserConsoleCtrl"
    ).when("/new_activity",
      templateUrl: "partials/new_activity.html"
      controller: "NewActivityCtrl"
    ).when("/setting",
      templateUrl: "partials/setting.html"
      controller: "SettingCtrl"
    ).otherwise redirectTo: "/home"
]

# angular.module('grapes').config [
#   '$httpProvider'
#   ($http) ->
#     $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
# ]