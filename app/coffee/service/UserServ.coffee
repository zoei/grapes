angular.module("grapes.services").factory "UserServ", [
  "$resource"
  ($resource, $rootScope) ->
    $resource "http://happymuslim.net/grapes/api/user.php", {_id: 1, res: "json"},
      getUser:
        method: 'POST'
        params:
          api: 'user'
]