angular.module("grapes.directives").directive "header", ->
  restrict: "EA"
  template: "<span class=\"back\" hm-tap=\"leftAction($event)\">{{leftText}}</span>" + "<span class=\"text-title\">{{title}}</span>" + "<span class=\"more\" hm-tap=\"rightAction($event)\">{{rightText}}</span>"
  link: (scope, element, attrs) ->
    scope.back = ->
      window.history.go -1
      return

    return
