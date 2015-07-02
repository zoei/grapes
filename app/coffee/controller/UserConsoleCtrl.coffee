angular.module("grapes.controllers").controller "UserConsoleCtrl", [
  "$scope"
  "$rootScope"
  "UserServ"
  ($scope, $rootScope, UserServ) ->
    unless $rootScope.tokenInfo?.access_token
      window.location.hash = "#/user_login"
      return

    $scope.user = UserServ.getUser
      user: $rootScope.currentUser
      access_token: $rootScope.tokenInfo.access_token,
      (result) ->
      (error) ->
        console.log error

    $scope.getHeadIcon = ->
      if $scope.user.headicon then 'background-image': 'url(' + $scope.user.headicon + ')' else ''
]