angular.module("grapes.services").factory "GrapesDBServ", [
  "$resource"
  'Formator'
  '$rootScope'
  ($resource, Formator, $rootScope) ->
    $resource "http://happymuslim.net/grapes/api/act.php", {_id: 1, res: "json"},
      getActivityMessage:
        method: 'POST'
        headers:
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        params:
          api: 'get_act_msg'
        isArray: true
        transformRequest: (data) ->
          if angular.isObject(data) && String(data) != '[object File]' then Formator.formatObj2Params(data) else data
        transformResponse: (result) ->
          return angular.fromJson(result)?.data
      addActivityMessage:
        method: 'POST'
        headers:
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        params:
          api: 'add_act_msg'
        transformRequest: (data) ->
          if angular.isObject(data) && String(data) != '[object File]' then Formator.formatObj2Params(data) else data
        transformResponse: (result) ->
          return angular.fromJson(result)?.data
]