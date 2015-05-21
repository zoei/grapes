angular.module("grapes.directives").directive "activityItem", ->
  restrict: 'EA'
  scope: true
  templateUrl: './partials/activity_item.html'
  link: (scope, element, attrs) ->
    scope.ActivityItemCategories = ['美食', '娱乐', '运动', '美容']
    scope.data = scope.$parent[attrs['data']]
    return