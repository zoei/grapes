angular.module("grapes.controllers").controller "WelcomeCtrl", [
  "$scope"
  ($scope) ->
    $scope.$root.showNavbar = false
    $scope.enter = ->
      $scope.$root.showNavbar = true
      window.location.hash = '#/home'
]