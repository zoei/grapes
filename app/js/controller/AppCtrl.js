angular.module('grapes.controllers').controller('AppCtrl', ['$scope', function($scope) {
    $scope.setTitle = function(options) {
        $scope.title = options.title || '';
        $scope.leftText = options.leftText || '';
        $scope.leftAction = options.leftAction;
        $scope.rightText = options.rightText || '';
        $scope.rightAction = options.rightAction;
        $scope.titleVisible = options.visible;
    };
}]);
