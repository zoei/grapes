angular.module("grapes.services").factory "HTTPProxy", [
  "$resource"
  "Extends"
  ($resource, Extends) ->
    return init: (config) ->
      url = undefined
      resource = undefined
      config = config or {}
      switch config.way
        when "jsonp"
          Extends.__default__ config,
            method: "JSONP"
            params:
              callback: "JSON_CALLBACK"

          url = "http://happymuslim.net/jsonpproxy.php"
        when "ajax"
          Extends.__default__ config,
            method: "GET"

          url = config.uri
        when "server"
        else
          Extends.__default__ config,
            method: "GET"

          url = "./php/jsonpproxy.php"
      resource = $resource(url, {},
        request: config
      )
      resource
]