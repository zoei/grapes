angular.module("grapes.controllers").controller "UserConsoleCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    window.location.hash = "#/user_login" unless $rootScope.currentUser

    $scope.user = GrapesServ.getUser user: $rootScope.currentUser
]