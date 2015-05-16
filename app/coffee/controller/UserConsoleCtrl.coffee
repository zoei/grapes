angular.module("grapes.controllers").controller "UserConsoleCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    $scope.setTitle
      title: "User Console"
      leftText: "Home"
      rightText: "Mod"
      leftAction: ->
        window.location.hash = "#/grapes"
        return

      rightAction: ->

      visible: true

    $scope.user = GrapesServ.getUser(
      user: $rootScope.currentUser
    , (user) ->
      $scope.username = user.id
      $scope.userpass = 12345678
      $scope.nickname = user.nickname
      $scope.sex = (if user.sex is "1" then "male" else "female")
      $scope.phone = user.phone or ""
      $scope.email = user.email or ""
      $scope.address = user.address or ""
      $scope.headicon = user.headicon

      return
    )
]