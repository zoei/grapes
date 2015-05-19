angular.module("grapes.directives").directive 'scrollable', ->
  restrict: 'EA'
  replace: false
  transclude: true
  template: '<div ng-transclude></div>'
  link: (scope, element, attrs) ->
    scrollerId = attrs.scrollerId ? attrs.scrollable

    _scroller = new IScroll element.context,
      scrollbars: !!attrs.showScrollbar
      # 滚动条不拖动时隐藏
      fadeScrollbars: true
      # 滚动条是否可操作
      interactiveScrollbars: true
      # 滚动条是否伸缩 clip/scale
      shrinkScrollbars: 'clip'
      preventDefaultException:
        tagName: /^.*$/

    scope.$scrollers = scope._scrollers ? 
      _scrollers: {},
      put: (id, scroller) ->
        scope.$scrollers._scrollers[id] = scroller
        return
      refreshAll: ->
        scroller.refresh for scroller in scope.$scrollers
        return
      refresh: (id, delay) ->
        setTimeout ->
          scope.$scrollers._scrollers[id].refresh true
          return
        , delay ? 0
        return

    scope.$scrollers.put scrollerId, _scroller
    return