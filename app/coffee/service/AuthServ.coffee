angular.module("grapes.services").factory "AuthServ", [
  "$resource"
  ($resource) ->
    $resource "http://happymuslim.net/grapes/api/token.php", {_id: 1, res: "json"},
      getToken:
        method: 'POST'
]