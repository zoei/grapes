angular.module("grapes.services").factory "GrapesServ", [
  "HTTPProxy"
  "Formator"
  "$resource"
  (HTTPProxy, Formator, $resource) ->
    factory = {}
    way = "ajax" # jsonp/server

    factory.getUser = (params, callback) ->
      defaultParams =
        _id: 1
        api: "user"
        user: params.user
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.userResource = factory.userResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.userResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.userResource.request request.params, callback

    factory.getActivityMembers = (params, callback) ->
      defaultParams =
        _id: 1
        api: "act_members"
        act: params.act
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: true
        transformResponse: transform
        way: way

      factory.activityMembersResource = factory.activityMembersResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.activityMembersResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.activityMembersResource.request request.params, callback

    factory.getUserActivities = (params, callback) ->
      defaultParams =
        _id: 1
        api: "user_acts"
        user: params.user
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: true
        transformResponse: transform
        way: way

      factory.userActivitiesResource = factory.userActivitiesResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.userActivitiesResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.userActivitiesResource.request request.params, callback

    factory.getPublicActivities = (params, callback) ->
      defaultParams =
        _id: 1
        api: "public_acts"
        count: params.count
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: true
        transformResponse: transform
        way: way

      factory.publicActivitiesResource = factory.publicActivitiesResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.publicActivitiesResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.publicActivitiesResource.request request.params, callback

    factory.getActivityDetail = (params, callback) ->
      defaultParams =
        _id: 1
        api: "act_detail"
        act: params.act
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.activityDetailResource = factory.activityDetailResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.activityDetailResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.activityDetailResource.request request.params, callback

    factory.doLogin = (params, callback) ->
      defaultParams =
        _id: 1
        api: "check_user"
        res: "json"
        username: params.username
        password: params.userpass

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        headers:
          "X-Contract": true

      config =
        uri: request.url
        method: 'POST'
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.doLoginResource = factory.doLoginResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.doLoginResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.doLoginResource.request request.params, callback

    factory.doRegister = (params, callback) ->
      defaultParams =
        _id: 1
        api: "add_user"
        user: params.username
        password: params.userpass
        nickname: params.nickname
        sex: params.sex
        mail: params.email
        phone: params.phone
        address: params.address
        headicon: params.headicon
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.doRegisterResource = factory.doRegisterResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.doRegisterResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.doRegisterResource.request request.params, callback

    factory.joinActivity = (params, callback) ->
      defaultParams =
        _id: 1
        api: "join_act"
        act: params.act
        user: params.user
        res: "json"

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.joinActivityResource = factory.joinActivityResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.joinActivityResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.joinActivityResource.request request.params, callback

    factory.addActivity = (params, callback) ->
      defaultParams =
        _id: 1
        api: "add_act"
        title: params.title or ""
        category: params.category or 0
        planner: params.planner or ""
        time: params.time or ""
        address: params.address or ""
        fee: params.fee or ""
        content: params.content or ""
        comment: params.comment or ""
        image_urls: params.image_urls or ""
        scope: params.scope or 0

      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.addActivityResource = factory.addActivityResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.addActivityResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.addActivityResource.request request.params, callback

    factory.addActivityItems = (params, callback) ->
      defaultParams =
        _id: 1
        api: "add_act_items"
        act: params.act
        items: JSON.stringify(params.items)

      
      # title: params.title,
      # category: params.category || 0,
      # place: params.place || '',
      # lasting: params.lasting || '',
      # content: params.content || '',
      # image_urls: params.image_urls || ''
      transform = (result) ->
        result = JSON.parse(result)  if typeof result is "string"
        result.data

      request =
        url: "http://happymuslim.net/grapes/db/db.php"
        params: defaultParams
        postData: {}
        headers:
          "X-Contract": true

      config =
        uri: request.url
        format: "json"
        isArray: false
        transformResponse: transform
        way: way

      factory.addActivityItemsResource = factory.addActivityItemsResource or HTTPProxy.init(config)
      if way is "jsonp" or way is "server"
        factory.addActivityItemsResource.request Formator.encodeJsonpRequest(request), callback
      else
        factory.addActivityItemsResource.request request.params, callback

    return factory
]