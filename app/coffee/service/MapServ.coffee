angular.module("grapes.services").factory "MapServ", [
  '$http'
  ($http)->
    lodMap: (success, error)->
      $http.jsonp('http://webapi.amap.com/maps?v=1.3&key=bc2d8e1027a1b4baa9d05b421ba7c840&callback=JSON_CALLBACK').
        success?(maploaded).
        error?(maploaded)

    searchPoi: (address, success)->
      AMap.service ["AMap.PlaceSearch"], ->
        search = new AMap.PlaceSearch
          pageIndex:1,
          pageSize:10,
          city: "上海"
        search.search address, (status, result) ->
          callback?(result.poiList.pois[0].location) if status is 'complete' and result.info is 'OK'
        return
      return

    searchCity: (success)->
      AMap.service ["AMap.CitySearch"], ->
        citysearch = new AMap.CitySearch()
        citysearch.getLocalCity (status, result) ->
          success?(result.bounds) if status == 'complete' and result.info == 'OK' and result.city and result.bounds

    autoComplete: (keywords, success, city='')->
      AMap.plugin ["AMap.Autocomplete"], ->
        auto = new AMap.Autocomplete city: ''

        if keywords.length > 0
          AMap.event.addListener auto, 'complete', (result)->
            success?(result.tips)
          auto.search keywords
          return
        return
      return
]