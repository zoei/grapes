angular.module("grapes.controllers").controller "UsersCtrl", [
  "$scope"
  "$rootScope"
  "UserServ"
  ($scope, $rootScope, UserServ) ->
    unless $rootScope.tokenInfo?.access_token
      window.location.hash = "#/user_login"
      return

    $scope.users = UserServ.getUsers
      access_token: $rootScope.tokenInfo.access_token,
      count: 10
]