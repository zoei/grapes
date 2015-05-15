angular.module('grapes.controllers').controller('UserLoginCtrl', ['$scope', '$rootScope', 'GrapesServ', function($scope, $rootScope, GrapesServ) {
    $scope.$parent.setTitle({
        title: 'Login',
        leftText: 'Home',
        rightText: '',
        leftAction: function(e){
            window.location.hash = '#/grapes';
        },
        rightAction: function(e){
            console.debug('right tap', e);
        },
        visible: true
    });
    $scope.doLogin = function(){
        GrapesServ.doLogin({username: $scope.username, userpass: $scope.userpass}, function(result){
            if(result.code == 'S00'){
                $rootScope.currentUser = $scope.username;
                window.location.hash = '#/grapes';
            }
        });
    };
    $scope.goRegister = function(){
        window.location.hash = '#/grapes_user_reg';
    };
  }
]);