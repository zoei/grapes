angular.module('grapes.controllers').controller('DetailCtrl', ['$scope', '$rootScope', '$routeParams', 'GrapesServ', function($scope, $rootScope, $routeParams, GrapesServ) {
        $scope.$parent.setTitle({
            title: 'Activity Detail',
            leftText: 'Home',
            rightText: '',
            leftAction: function(e){
                window.location.hash = '#/grapes';
            },
            visible: true
        });

        $scope.activities = GrapesServ.getActivityDetail({act: $routeParams.act_id}, function(act){
            $scope.actTitle = act.title;
            $scope.address = act.address;
            $scope.planner = act.planner;
            $scope.time = act.time;
            $scope.status = act.status;
            $scope.fee = act.fee;
            $scope.items = act.items;
        });

        $scope.members = GrapesServ.getActivityMembers({act: $routeParams.act_id});

        $scope.join = function(){
            GrapesServ.joinActivity({act: $routeParams.act_id, user: $rootScope.currentUser}, function(result){
                if(result.success){
                    window.alert('Join Success!');
                } else {
                    window.alert('Join Error!');
                }
            });
        };

        $scope.showJoin = function(){
            if(!$rootScope.currentUser){
                return false;
            }
            if(!$rootScope.userActivities || !$rootScope.userActivities.length){
                return true;
            }
            for(var i = 0; i < $rootScope.userActivities.length;i++){
                var activity = $rootScope.userActivities[i];
                if($routeParams.act_id == activity.id){
                    return false;
                }
            }
            return true;
        };
    }
]);