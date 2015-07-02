angular.module("grapes.controllers").controller "AppCtrl", [
  "$scope"
  '$rootScope'
  '$route'
  '$routeParams'
  '$location'
  ($scope, $rootScope, $route, $routeParams, $location) ->

    $scope.setTitle = (options) ->
      $scope.title = options.title or ""
      $scope.leftText = options.leftText or ""
      $scope.leftAction = options.leftAction
      $scope.rightText = options.rightText or ""
      $scope.rightAction = options.rightAction
      $scope.titleVisible = options.visible
      return

    $scope.barTabs = [
      {
        id: "home",
        text: "首页",
        url: "#/home",
        icon: "icon-home",
        cls: "active"
      }, {
        id: "messages",
        text: "消息",
        url: "#/messages",
        icon: "icon-pages"
      }, {
        id: "profile",
        text: "我的",
        url: "#/user_console",
        icon: "icon-person",
        fn: ->
          window.location.hash = if $rootScope.currentUser then "#/user_console" else "#/user_login"
      }
    ]

    $scope.enter = ->
      $scope.showNavbar = true
      window.location.hash = '#/home'

    # $scope.$on '$locationChangeStart', (event) ->
    #   console.log event
    # $scope.$on '$viewContentLoaded', ->
    #   console.log 'viewContentLoaded'
    # $scope.$on '$routeChangeSuccess', ->
    #   console.log 'routeChangeSuccess'
    # $scope.$on '$stateChangeSuccess', ->
    #   console.log 'stateChangeSuccess'

    $scope.isAuthorized = ->
      $rootScope.tokenInfo?.access_token

    $scope.hasJoined = (act_id)->
      return false  unless $rootScope.currentUser
      return false  if not $rootScope.userActivities or not $rootScope.userActivities.length
      i = 0
      while i < $rootScope.userActivities.length
        activity = $rootScope.userActivities[i]
        return true if act_id is activity.id
        i++
      false

]