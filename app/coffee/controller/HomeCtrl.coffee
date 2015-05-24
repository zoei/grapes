angular.module("grapes.controllers").controller "HomeCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->

    $scope.ActivityCategories = [
      '音乐'
      '戏剧'
      '讲座'
      '聚会'
      '电影'
      '展览'
      '运动'
      '公益'
      '旅行'
      '其它'
    ]
    $scope.onActTap = (act) ->
      window.location.hash = "#/detail/" + act.id
      return

    $scope.switchAllActivities = ->
      $scope.acts = GrapesServ.getPublicActivities count: 20

    $scope.switchNearbyActivities = ->
      $rootScope.userActivities = $scope.acts = GrapesServ.getUserActivities user: $rootScope.currentUser

    $scope.swipePage = (direction)->
      activeTab = $ '.segmented-control a.active'
      allTabs = $ '.segmented-control a'
      index = allTabs.index activeTab
      length = allTabs.length

      if direction is 'left'
        index = if index + 1 >= length then 0 else index + 1
      else
        index = if index - 1 < 0 then length-1 else index - 1

      nextTab = $ allTabs[index]

      activeTab.removeClass 'active'
      nextTab.addClass 'active'

      eval '$scope.' + nextTab.attr('hm-tap')
      return

    $scope.switchAllActivities()
]