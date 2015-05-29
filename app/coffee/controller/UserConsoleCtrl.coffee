angular.module("grapes.controllers").controller "UserConsoleCtrl", [
  "$scope"
  "$rootScope"
  "UserServ"
  ($scope, $rootScope, UserServ) ->
    window.location.hash = "#/user_login" unless $rootScope.currentUser

    $scope.user = UserServ.getUser
      user: $rootScope.currentUser
      access_token: $rootScope.tokenInfo.access_token
]