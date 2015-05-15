angular.module('grapes.controllers').controller('UserRegCtrl', ['$scope', 'GrapesServ', function($scope, GrapesServ) {
        $scope.$parent.setTitle({
            title: 'Register',
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
        $scope.goLogin = function(){
            console.log($scope.userpass);
        };
        $scope.doRegister = function(){
            GrapesServ.doRegister({
                    username: $scope.username,
                    userpass: $scope.userpass,
                    nickname: $scope.nickname,
                    sex: $scope.sex == 'male' ? 1 : 0,
                    phone: $scope.phone || '',
                    email: $scope.email || '',
                    address: $scope.address || '',
                    headicon: $scope.headicon
                }, function(result){
                    if(result.success){
                        window.alert('Register Success');
                        window.location.hash = '#/grapes_user_login';
                    }
            });
        };
    }
]);