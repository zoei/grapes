angular.module("grapes.controllers").controller "UserRegCtrl", [
  "$scope"
  "GrapesServ"
  ($scope, GrapesServ) ->
    $scope.setTitle
      title: "Register"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        window.location.hash = "#/grapes"
        return

      rightAction: (e) ->
        console.debug "right tap", e
        return

      visible: true

    $scope.goLogin = ->
      console.log $scope.userpass
      return

    $scope.doRegister = ->
      GrapesServ.doRegister
        username: $scope.username
        userpass: $scope.userpass
        nickname: $scope.nickname
        sex: (if $scope.sex is "male" then 1 else 0)
        phone: $scope.phone or ""
        email: $scope.email or ""
        address: $scope.address or ""
        headicon: $scope.headicon
      , (result) ->
        if result.success
          window.alert "Register Success"
          window.location.hash = "#/grapes_user_login"
        return

      return
]