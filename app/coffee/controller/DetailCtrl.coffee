angular.module("grapes.controllers").controller "DetailCtrl", [
  "$scope"
  "$rootScope"
  "$routeParams"
  "GrapesServ"
  '$http'
  ($scope, $rootScope, $routeParams, GrapesServ, $http) ->
    $scope.setTitle
      title: "Activity Detail"
      leftText: "Home"
      rightText: ""
      leftAction: (e) ->
        window.location.hash = "#/grapes"
        return

      visible: true

    $scope.activities = GrapesServ.getActivityDetail(
      act: $routeParams.act_id
    , (act) ->
      $scope.actTitle = act.title
      $scope.address = act.address
      $scope.planner = act.planner
      $scope.images = act.images
      $scope.time = act.time
      $scope.status = act.status
      $scope.fee = act.fee
      $scope.items = act.items
      return
    )
    $scope.members = GrapesServ.getActivityMembers(act: $routeParams.act_id)
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
      # return unless mapModal.hasClass 'active'

      # $scope.map = if $scope.map? then $scope.map else new BMap.Map 'l-map'
      # $scope.map.addControl new BMap.ZoomControl()
      # $scope.map.addControl new BMap.ScaleControl()
      # navigator.geolocation.getCurrentPosition (location) ->
      #   coords = 
      #     longitude: 121.4683
      #     latitude: 31.2186
      #   $scope.map.centerAndZoom(
      #     new BMap.Point coords.longitude,
      #       coords.latitude,
      #   14)
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

        return

      if not $scope.map? then $http.jsonp('http://webapi.amap.com/maps?v=1.3&key=bc2d8e1027a1b4baa9d05b421ba7c840&callback=JSON_CALLBACK').
        success(maploaded).
        error(maploaded)
      else
        AMap.service ["AMap.PlaceSearch"], ->
          search = new AMap.PlaceSearch
            pageIndex:1,
            pageSize:10,
            city: "上海"
          search.search '东方明珠', (status, result) ->
            if status is 'complete' and result.info is 'OK'
              console.debug result
            return
          return

      return

]