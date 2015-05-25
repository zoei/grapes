angular.module("grapes.controllers").controller "WelcomeCtrl", [
  "$scope"
  ($scope) ->

    $scope.enter = ->
      $scope.$root.showNavbar = true
      window.location.hash = '#/home'
]