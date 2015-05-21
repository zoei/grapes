angular.module("grapes.directives").directive "navBar", ->
  restrict: "EA"
  template: '<nav class="bar bar-tab">
              <a ng-repeat="tab in $navbartabs" class="tab-item {{tab.cls}}" href="{{tab.url}}">
                <span class="icon {{tab.icon}}"></span>
                <span class="tab-label">{{tab.text}}</span>
              </a>
            </nav>'
  replace: true
  link: (scope, element, attrs) ->
    scope.$navbartabs = scope[attrs['ds']]
    scope.$on '$viewContentLoaded', ->
      $('nav.bar-tab a').hammer().bind "tap", (event)->
        $('nav.bar-tab a.active').removeClass 'active'
        $(this).addClass 'active'
      return
    return

