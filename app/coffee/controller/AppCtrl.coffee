angular.module("grapes.controllers").controller "AppCtrl", [
  "$scope"
  ($scope) ->
    $scope.setTitle = (options) ->
      $scope.title = options.title or ""
      $scope.leftText = options.leftText or ""
      $scope.leftAction = options.leftAction
      $scope.rightText = options.rightText or ""
      $scope.rightAction = options.rightAction
      $scope.titleVisible = options.visible
      return

    myScroll = new IScroll 'ng-view'
]