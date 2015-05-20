angular.module("grapes.controllers").controller "AppCtrl", [
  "$scope"
  "$route"
  ($scope, $route) ->
    $scope.setTitle = (options) ->
      $scope.title = options.title or ""
      $scope.leftText = options.leftText or ""
      $scope.leftAction = options.leftAction
      $scope.rightText = options.rightText or ""
      $scope.rightAction = options.rightAction
      $scope.titleVisible = options.visible
      return

    $scope.$on '$locationChangeStart', (event) ->
      console.log event
    # $('ng-view').attr('id', )

    # $scope.$on '$viewContentLoading', ->
    #   console.log 'viewContentLoading'
    # $scope.$on '$viewContentLoaded', ->
    #   console.log 'viewContentLoaded'
    # $scope.$on '$routeChangeSuccess', ->
    #   console.log 'routeChangeSuccess'
    # $scope.$on '$stateChangeSuccess', ->
    #   console.log 'stateChangeSuccess'
]