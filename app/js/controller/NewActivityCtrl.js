angular.module('grapes.controllers').controller('NewActivityCtrl', ['$scope', '$rootScope', 'GrapesServ', function($scope, $rootScope, GrapesServ) {
    if (!$rootScope.currentUser) {
        window.location.hash = '#/grapes_user_login';
    }

    $scope.setTitle({
        title: 'Create Activity',
        leftText: 'Home',
        rightText: 'Save',
        leftAction: function() {
            window.location.hash = '#/grapes';
        },
        rightAction: function() {},
        visible: true
    });

    if (!$rootScope.currentUser) {
        window.location.hash = '#/grapes_user_login';
    }

    $scope.ActivityCategories = ['美食', '娱乐', '运动', '美容'];

    $scope.fees = ['AA', '免费', '请客'];

    $scope.categoryChange = function() {
        console.debug($scope.activityCategory, $scope.ActivityCategories[$scope.activityCategory]);
    };

    $scope.feeChange = function() {
        console.debug($scope.fee, $scope.fees[$scope.fee]);
    };

    $scope.addItem = function() {
        $scope.items = $scope.items || [];
        $scope.items.push({
            act: '',
            title: '',
            category: 0,
            place: '',
            lasting: '',
            content: ''
        });
    };

    // $scope.addItem();

    $scope.save = function() {
        GrapesServ.addActivity({
            title: $scope.actTitle,
            category: $scope.category,
            planner: $rootScope.currentUser,
            time: $scope.time,
            address: $scope.address,
            fee: $scope.fees[$scope.fee],
            content: $scope.content,
            comment: $scope.comment,
            image_urls: $scope.image_urls,
            scope: $scope.scope
        }, function(result) {
            $scope.act = result.act_id;
            $scope.saveItems();
        });
    };

    $scope.saveItems = function() {
        if (!Array.isArray($scope.items) || $scope.items.length <= 0) {
            return;
        }

        var items = [];
        $scope.items.forEach(function(item) {
            items.push({
                title: item.title,
                category: item.category || 0,
                place: item.place || '',
                lasting: item.lasting || '',
                content: item.content || '',
                image_urls: item.image_urls || ''
            });
        });
        GrapesServ.addActivityItems({
            act: $scope.act,
            items: items
        }, function(result) {
            if (result.success) {
                window.location.hash = '#/grapes_detail/' + $scope.act;
            } else {
                alert('error');
            }
        });
    }
}]);