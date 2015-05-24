angular.module("grapes.controllers").controller "UserRegCtrl", [
  "$scope"
  "GrapesServ"
  ($scope, GrapesServ) ->

    $scope.user = 
      username: ''
      userpass: ''
      nickname: ''
      sex: 1
      phone: ''
      email: ''
      address: ''
      headicon: ''

    $scope.doRegister = ->
      GrapesServ.doRegister
        username: $scope.user.username
        userpass: $scope.user.userpass
        nickname: $scope.user.nickname
        sex: (if $scope.user.sex is "male" then 1 else 0)
        phone: $scope.user.phone or ""
        email: $scope.user.email or ""
        address: $scope.user.address or ""
        headicon: $scope.user.headicon
      , (result) ->
        if result.success
          window.alert "Register Success"
          window.location.hash = "#/user_login"
        return

      return
]