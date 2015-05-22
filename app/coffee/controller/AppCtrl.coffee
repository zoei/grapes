angular.module("grapes.controllers").controller "AppCtrl", [
  "$scope"
  "NavBarTabs"
  ($scope, NavBarTabs) ->

    $scope.$root.showNavbar = true

    $scope.setTitle = (options) ->
      $scope.title = options.title or ""
      $scope.leftText = options.leftText or ""
      $scope.leftAction = options.leftAction
      $scope.rightText = options.rightText or ""
      $scope.rightAction = options.rightAction
      $scope.titleVisible = options.visible
      return

    $scope.barTabs = NavBarTabs.query()

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