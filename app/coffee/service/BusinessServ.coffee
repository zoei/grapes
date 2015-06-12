angular.module("grapes.services").factory "BusinessServ", [
  "$resource"
  ($resource) ->
    common =
      appkey: '5589931241'
      secret: '16adbf199c38458f847f4c99d25cab4d'
      getSecretSign: (param)->
        array = (key for key of param).sort()
        paramArray = [@appkey]
        paramArray.push(key + param[key]) for key in array
        paramArray.push @secret
        new String(CryptoJS.SHA1(paramArray.join "")).toUpperCase()
      getQueryObject: (param, extraParams)->
        extraParams = extraParams || {}
        extraParams[k] = v for k, v of param
        extraParams["sign"] = @getSecretSign extraParams
        extraParams["appkey"] = common.appkey
        extraParams

    resource = $resource '', {},
      getRegions:
        url: 'http://api.dianping.com/v1/metadata/get_regions_with_businesses'
        method: 'GET'
        isArray: true
        transformResponse: (data)->
          JSON.parse(data)?.cities?[0]?.districts
      getCategories:
        url: 'http://api.dianping.com/v1/metadata/get_categories_with_businesses'
        method: 'GET'
        isArray: true
        transformResponse: (data)->
          JSON.parse(data)?.categories
      getDetail:
        url: 'http://api.dianping.com/v1/business/get_single_business'
        method: 'GET'
        transformResponse: (data)->
          JSON.parse(data)?.businesses[0]
      getReviews:
        url: 'http://api.dianping.com/v1/review/get_recent_reviews'
        method: 'GET'
        isArray: true
        transformResponse: (data)->
          JSON.parse(data)?.reviews
      getBusiness:
        url: 'http://api.dianping.com/v1/business/find_businesses'
        method: 'GET'
        isArray: true
        transformResponse: (data)->
          JSON.parse(data)?.businesses

    getRegions: (params)->
      resource.getRegions common.getQueryObject params
    getCategories: (params)->
      resource.getCategories common.getQueryObject params
    getDetail: (params)->
      resource.getDetail common.getQueryObject params
    getReviews: (params)->
      resource.getReviews common.getQueryObject params
    getBusiness: (params)->
      defaultParams =
        # city: "上海"
        # category: "美食"
        # region: "黄浦区"
        # latitude: '31.18268013000488'
        # longitude: '121.42769622802734'
        limit: "20"
        # radius: "5000"
        # offset_type: "1"
        # out_offset_type: "1"
        has_deal: "1"
        # keyword: "菜"
        sort: "1"
        platform: 2
      resource.getBusiness common.getQueryObject params, defaultParams

]