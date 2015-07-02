angular.module("grapes", [
  "ngRoute"
  "ngResource"
  "ngAnimate"
  "hmTouchEvents"
  "grapes.utils"
  "grapes.services"
  "grapes.directives"
  "grapes.controllers"
]).config [
  "$locationProvider"
  "$routeProvider"
  ($locationProvider, $routeProvider) ->
    # $locationProvider.html5Mode true

    $routeProvider.when("/welcome",
      templateUrl: "partials/welcome.html"
      controller: "WelcomeCtrl"
    ).when("/home",
      templateUrl: "partials/home.html"
      controller: "HomeCtrl"
    ).when("/detail/:act_id",
      templateUrl: "partials/detail.html"
      controller: "DetailCtrl"
    ).when("/messages",
      templateUrl: "partials/messages.html"
      controller: "MessagesCtrl"
    ).when("/user_login",
      templateUrl: "partials/login.html"
      controller: "UserLoginCtrl"
    ).when("/user_reg",
      templateUrl: "partials/register.html"
      controller: "UserRegCtrl"
    ).when("/user_console",
      templateUrl: "partials/user_console.html"
      controller: "UserConsoleCtrl"
    ).when("/user_joined",
      templateUrl: "partials/user_joined.html"
      controller: "UserJoinedCtrl"
    ).when("/users",
      templateUrl: "partials/users.html"
      controller: "UsersCtrl"
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