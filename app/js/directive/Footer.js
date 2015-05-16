angular.module('grapes.directives').directive('footer', function() {
  return {
    restrict: 'EA',
    template: '<span class="back" hm-tap="leftAction($event)">{{leftText}}</span>'
            + '<span class="text-title">{{title}}</span>'
            + '<span class="more" hm-tap="rightAction($event)">{{rightText}}</span>',
    link: function(scope, element, attrs) {
      scope.back = function() {
        window.history.go(-1);
      };
    }
  };
});