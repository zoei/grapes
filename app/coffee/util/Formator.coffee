angular.module("grapes.utils").factory "Formator", [->
  encodeJsonpRequest: (params) ->
    base64Encoder = new Base64()
    paramsb64 = JSON.stringify(params)
    paramsb64 = base64Encoder.encode(paramsb64)
    _: paramsb64
]