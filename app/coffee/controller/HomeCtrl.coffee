angular.module("grapes.controllers").controller "HomeCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->

    $scope.onActTap = (act) ->
      window.location.hash = "#/grapes_detail/" + act.id
      return

    $scope.goLogin = ->
      window.location.hash = "#/grapes_user_login"
      return

    $scope.goRegister = ->
      window.location.hash = "#/grapes_user_reg"
      return

    $scope.logout = ->
      $rootScope.currentUser = null
      window.history.go 0
      return

    $scope.switchAllActivities = ->
      $scope.acts = GrapesServ.getPublicActivities count: 20

    $scope.switchUserActivities = ->
      $rootScope.userActivities = $scope.acts = GrapesServ.getUserActivities user: $rootScope.currentUser

    $scope.switchAllActivities()
]