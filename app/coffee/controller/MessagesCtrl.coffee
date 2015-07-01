angular.module("grapes.controllers").controller "MessagesCtrl", [
  "$scope"
  "$rootScope"
  "UserServ"
  ($scope, $rootScope, UserServ) ->
    unless $rootScope.tokenInfo?.access_token
      window.location.hash = "#/user_login"
      return

    $scope.messages = UserServ.getUsers
      access_token: $rootScope.tokenInfo.access_token,
      count: 10
]