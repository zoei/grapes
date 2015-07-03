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

    $scope.$on '$locationChangeStart', ->
    $scope.$on '$viewContentLoaded', ->
      /^\/(\w*)/.test $scope.currentRoute.originalPath
      currentViewName = RegExp.$1

      preView = $ '[ng-view][id]'
      preView.attr 'switched-view', currentViewName

      currentView = $ '[ng-view]:not([id])'
      currentView.attr 'id', currentViewName
      currentView.attr 'switched-view', preView.attr('id')

    $scope.$on '$routeChangeSuccess', (e, currentRoute, preRoute)->
      $scope.preRoute = preRoute
      $scope.currentRoute = currentRoute

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