angular.module("grapes.controllers").controller "AppCtrl", [
  "$scope"
  '$rootScope'
  ($scope, $rootScope) ->

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
        text: "活动",
        url: "#/home",
        icon: "icon-home",
        cls: "active"
      }, {
        id: "new",
        text: "发布",
        url: "#/new_activity",
        icon: "icon-plus"
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
]