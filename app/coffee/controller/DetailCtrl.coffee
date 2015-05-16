angular.module("grapes.controllers").controller "DetailCtrl", [
  "$scope"
  "$rootScope"
  "$routeParams"
  "GrapesServ"
  ($scope, $rootScope, $routeParams, GrapesServ) ->
    $scope.setTitle
      title: "Activity Detail"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        window.location.hash = "#/grapes"
        return

      visible: true

    $scope.activities = GrapesServ.getActivityDetail(
      act: $routeParams.act_id
    , (act) ->
      $scope.actTitle = act.title
      $scope.address = act.address
      $scope.planner = act.planner
      $scope.time = act.time
      $scope.status = act.status
      $scope.fee = act.fee
      $scope.items = act.items
      return
    )
    $scope.members = GrapesServ.getActivityMembers(act: $routeParams.act_id)
    $scope.join = ->
      GrapesServ.joinActivity
        act: $routeParams.act_id
        user: $rootScope.currentUser
      , (result) ->
        if result.success
          window.alert "Join Success!"
        else
          window.alert "Join Error!"
        return

      return

    $scope.showJoin = ->
      return false  unless $rootScope.currentUser
      return true  if not $rootScope.userActivities or not $rootScope.userActivities.length
      i = 0

      while i < $rootScope.userActivities.length
        activity = $rootScope.userActivities[i]
        return false  if $routeParams.act_id is activity.id
        i++
      true
]