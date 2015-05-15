angular.module('grapes.controllers').controller('UserConsoleCtrl', ['$scope', '$rootScope', 'GrapesServ', function($scope, $rootScope, GrapesServ) {
        $scope.$parent.setTitle({
            title: 'User Console',
            leftText: 'Home',
            rightText: 'Mod',
            leftAction: function(){
                window.location.hash = '#/grapes';
            },
            rightAction: function(){
            },
            visible: true
        });
        $scope.user = GrapesServ.getUser({user: $rootScope.currentUser}, function(user){
            $scope.username = user.id,
            $scope.userpass = 12345678,
            $scope.nickname = user.nickname,
            $scope.sex = user.sex == '1' ? 'male' : 'female',
            $scope.phone = user.phone || '',
            $scope.email = user.email || '',
            $scope.address = user.address || '',
            $scope.headicon = user.headicon
        });
    }
]);