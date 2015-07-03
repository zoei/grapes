angular.module("grapes.controllers").controller "UserLoginCtrl", [
  "$scope"
  "$rootScope"
  "AuthServ"
  "$window"
  ($scope, $rootScope, AuthServ, $window) ->
    $scope.user = 
      name: ""
      pass: ""

    $scope.doLogin = -> 
      AuthServ.getToken
        username: $scope.user.name
        password: $scope.user.pass
      , (result) ->
        if result.access_token
          $rootScope.tokenInfo = result
          $rootScope.currentUser = $scope.user.name
          $window.history.back()
        return

      return

    $scope.doRegister = ->
      window.location.hash = "#/user_reg"
      return
]