angular.module("grapes.controllers").controller "HomeCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    $scope.setTitle
      title: "Grapes"
      leftText: ""
      rightText: (if $rootScope.currentUser then "New" else "")
      rightAction: ->
        window.location.hash = "#/grapes_new_activity"
        return

      visible: true

    # $rootScope.userActivities = GrapesServ.getUserActivities(
    #   user: $rootScope.currentUser
    # , (acts) ->
    # )
    
    $scope.pub_acts = GrapesServ.getPublicActivities(
      count: 20
    , (acts) ->
      $scope.$scrollers.refresh('s1', 500);
    )

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
]