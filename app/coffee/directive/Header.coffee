angular.module("grapes.directives").directive "header", ->
  restrict: "EA"
  template: '<a class="icon icon-left-nav pull-left" hm-tap="leftAction($event)"></a>
            <h1 class="title">{{title}}</h1>
            <a class="icon icon-compose pull-right" hm-tap="rightAction($event)"></a>'
  link: (scope, element, attrs) ->
    element.addClass('bar bar-nav');
    scope.back = ->
      window.history.go -1
      return

    return
