angular.module("grapes.services").factory "JSONPProxy", [
  "$resource"
  ($resource) ->
    $resource("./php/HTTPProxy.php", {},
      request:
        method: "GET"
        isArray: false
        params: {}
    )
]