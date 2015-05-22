angular.module("grapes.directives").directive "navBar", ->
  restrict: "EA"
  template: '<nav class="bar bar-tab">
              <div ng-repeat="tab in $navbartabs" id="{{tab.id}}" class="tab-item {{tab.cls}}" hm-tap="tapTab(tab)">
                <span class="icon {{tab.icon}}"></span>
                <span class="tab-label">{{tab.text}}</span>
              </div>
            </nav>'
  replace: true
  link: (scope, element, attrs) ->
    scope.$navbartabs = scope[attrs['ds']]
    scope.tapTab = (tab) -> 
      $('nav.bar-tab div.tab-item.active').removeClass 'active'
      $('#' + tab.id).addClass 'active'
      window.location.hash = tab.url
    return
