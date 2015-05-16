angular.module("grapes.controllers").controller "UserLoginCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    $scope.setTitle
      title: "Login"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        window.location.hash = "#/grapes"
        return

      rightAction: (e) ->
        console.debug "right tap", e
        return

      visible: true

    $scope.doLogin = ->
      GrapesServ.doLogin
        username: $scope.username
        userpass: $scope.userpass
      , (result) ->
        if result.code is "S00"
          $rootScope.currentUser = $scope.username
          window.location.hash = "#/grapes"
        return

      return

    $scope.goRegister = ->
      window.location.hash = "#/grapes_user_reg"
      return
]