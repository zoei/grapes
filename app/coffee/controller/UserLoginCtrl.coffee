angular.module("grapes.controllers").controller "UserLoginCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    $scope.user = 
      name: ""
      pass: ""

    $scope.setTitle
      title: "Login"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        return

      rightAction: (e) ->
        return

      visible: true

    $scope.doLogin = ->
      GrapesServ.doLogin
        username: $scope.user.name
        userpass: $scope.user.pass
      , (result) ->
        if result.code is "S00"
          $rootScope.currentUser = $scope.user.name
          window.location.hash = "#/grapes"
        return

      return

    $scope.doRegister = ->
      window.location.hash = "#/grapes_user_reg"
      return
]