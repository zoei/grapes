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
    $routeProvider.when("/home",
      templateUrl: "partials/home.html"
      controller: "HomeCtrl"
    ).when("/grapes_detail/:act_id",
      templateUrl: "partials/detail.html"
      controller: "DetailCtrl"
    ).when("/grapes_user_login",
      templateUrl: "partials/login.html"
      controller: "UserLoginCtrl"
    ).when("/grapes_user_reg",
      templateUrl: "partials/register.html"
      controller: "UserRegCtrl"
    ).when("/grapes_user_console",
      templateUrl: "partials/user_console.html"
      controller: "UserConsoleCtrl"
    ).when("/grapes_new_activity",
      templateUrl: "partials/new_activity.html"
      controller: "NewActivityCtrl"
    ).otherwise redirectTo: "/home"
]
