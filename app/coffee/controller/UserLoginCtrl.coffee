angular.module("grapes.controllers").controller "UserLoginCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    $scope.user = 
      name: ""
      pass: ""

    $scope.doLogin = ->
      GrapesServ.doLogin
        username: $scope.user.name
        userpass: $scope.user.pass
      , (result) ->
        if result.code is "S00"
          $rootScope.currentUser = $scope.user.name
          window.location.hash = "#/user_console"
        return

      return

    $scope.doRegister = ->
      window.location.hash = "#/user_reg"
      return
]