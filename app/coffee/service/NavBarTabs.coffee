angular.module("grapes.services").factory "NavBarTabs", ($resource) ->
  $resource 'data/nav-bar-tabs.json', {},
    query:
      method: 'GET',
      isArray: true