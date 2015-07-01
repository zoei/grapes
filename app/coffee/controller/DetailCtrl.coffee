angular.module("grapes.controllers").controller "DetailCtrl", [
  "$scope"
  "$rootScope"
  "$routeParams"
  "GrapesServ"
  "GrapesDBServ"
  '$http'
  ($scope, $rootScope, $routeParams, GrapesServ, GrapesDBServ, $http) ->
    $scope.setTitle
      title: "Activity Detail"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        window.location.hash = "#/grapes"
        return

      visible: true

    $scope.activities = GrapesServ.getActivityDetail
      act: $routeParams.act_id
      (act)->
        $scope.actId = $routeParams.act_id
        $scope.actTitle = act.title
        $scope.address = act.address
        $scope.planner = act.planner
        $scope.images = act.images
        $scope.time = act.time
        $scope.status = act.status
        $scope.fee = act.fee
        $scope.items = act.items
        return

    $scope.members = GrapesServ.getActivityMembers act: $routeParams.act_id

    refreshMessages = ()->
      $scope.messages = GrapesDBServ.getActivityMessage
        act: $routeParams.act_id
        count: 10
        start: 0

    refreshMessages()

    $scope.comment = text: ''

    $scope.addMessage = ->
      GrapesDBServ.addActivityMessage
        act: $routeParams.act_id
        user: $rootScope.currentUser
        msg: $scope.comment.text
        access_token: $rootScope.tokenInfo.access_token
      , refreshMessages

    $scope.join = ->
      GrapesServ.joinActivity
        act: $routeParams.act_id
        user: $rootScope.currentUser
      , (result) ->
        if result.success
          window.alert "Join Success!"
        else
          window.alert "Join Error!"
        return

      return

    $scope.showJoin = ->
      return false  unless $rootScope.currentUser
      return true  if not $rootScope.userActivities or not $rootScope.userActivities.length
      i = 0

      while i < $rootScope.userActivities.length
        activity = $rootScope.userActivities[i]
        return false  if $routeParams.act_id is activity.id
        i++
      true

    $scope.tapAddress = ->
      mapModal = $ '#mapModal'
      self = $scope

      maploaded = ->
        coords = 
          longitude: 121.4683
          latitude: 31.2186

        position = new AMap.LngLat coords.longitude, coords.latitude

        self.map = new AMap.Map "l-map",
          view: new AMap.View2D
            center:position
            zoom:14
            rotation:0
          lang:"zh_cn"

        self.map.plugin ['AMap.Scale'], ->
          self.map.addControl(new AMap.Scale())

        self.map.plugin ["AMap.ToolBar"], ->
          self.map.addControl new AMap.ToolBar()

        searchPoi()

        return

      setMap = (loc) ->
        self.map.setZoomAndCenter 16, new AMap.LngLat(loc.lng, loc.lat)
        marker = new AMap.Marker map: self.map,
          position: new AMap.LngLat(loc.lng, loc.lat)

      searchPoi = ->
        AMap.service ["AMap.PlaceSearch"], ->
          search = new AMap.PlaceSearch
            pageIndex:1,
            pageSize:10,
            city: "上海"
          search.search self.address, (status, result) ->
            if status is 'complete' and result.info is 'OK'
              setMap result.poiList.pois[0].location
              $scope.transfer_route result.poiList.pois[0].location
            return
          return
        return

      if not AMap?
        $http.jsonp('http://webapi.amap.com/maps?v=1.3&key=bc2d8e1027a1b4baa9d05b421ba7c840&callback=JSON_CALLBACK').
          success(maploaded).
          error(maploaded)
        return

      if not $scope.map?
        maploaded()
        return

      searchPoi()

      return

    $scope.locate = (map) ->
      map.plugin 'AMap.Geolocation', ->
      geolocation = new AMap.Geolocation
        enableHighAccuracy: true,#是否使用高精度定位，默认:true
        timeout: 10000,          #超过10秒后停止定位，默认：无穷大
        maximumAge: 0,           #定位结果缓存0毫秒，默认：0
        convert: true,           #自动偏移坐标，偏移后的坐标为高德坐标，默认：true
        showButton: true,        #显示定位按钮，默认：true
        buttonPosition: 'LB',    #定位按钮停靠位置，默认：'LB'，左下角
        buttonOffset: new AMap.Pixel(10, 20),#定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
        showMarker: true,        #定位成功后在定位到的位置显示点标记，默认：true
        showCircle: true,        #定位成功后用圆圈表示定位精度范围，默认：true
        panToLocation: true,     #定位成功后将定位到的位置作为地图中心点，默认：true
        zoomToAccuracy:true      #定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false

        onComplete = (e) ->
          console.debug 'onLocateComplete', e

        onError = (e) ->
          console.debug 'onLocateError', e

      map.addControl geolocation
      AMap.event.addListener geolocation, 'complete', onComplete #返回定位信息
      AMap.event.addListener geolocation, 'error', onError       #返回定位出错信息

    $scope.transfer_route = (location)->
      navigator.geolocation.getCurrentPosition (position)->
        loc = 
          lat: position.coords.latitude
          lon: position.coords.longitude

        AMap.service ["AMap.Geocoder"], ->     
          MGeocoder = new AMap.Geocoder
            radius:1000

          MGeocoder.getLocation $scope.address, (status, result)->
            if status == 'complete' and result.info == 'OK'and result.geocodes.length > 0
              location = result.geocodes[0].location
              loc2 = 
                lat: location.lat
                lon: location.lng

              AMap.service ["AMap.Transfer"], ->  
                transOptions =
                  city: '上海市',
                  policy: AMap.TransferPolicy.LEAST_TIME

                trans = new AMap.Transfer transOptions

                trans.search new AMap.LngLat(loc.lat, loc.lon), new AMap.LngLat(loc2.lat, loc2.lon), (status, result)->
                  if status == 'complete'
                    console.debug result
                  else
                    alert result
                  return
                return
              return
            return
          return
        return
      return
    return

]