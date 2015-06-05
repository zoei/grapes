angular.module("grapes.controllers").controller "NewActivityCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  '$http'
  ($scope, $rootScope, GrapesServ, $http) ->
    # window.location.hash = "#/user_login"  unless $rootScope.currentUser
    $scope.setTitle
      title: "Create Activity"
      leftText: "Home"
      rightText: "Save"
      leftAction: ->
        window.location.hash = "#/grapes"
        return

      rightAction: ->

      visible: true

    $scope.activity = 
      planner: $rootScope.currentUser
      title: ''
      category: ''
      time: ''
      address: ''
      fee: ''
      content: ''
      comment: ''
      images: ''
      scope: ''

    $scope.ActivityCategories = [
      '音乐'
      '戏剧'
      '讲座'
      '聚会'
      '电影'
      '展览'
      '运动'
      '公益'
      '旅行'
      '其它'
    ]
    $scope.fees = [
      "AA"
      "免费"
      "请客"
    ]
    $scope.ActivityScopes = [
      {
        text: 'private'
        value: 'private'
        checked: true
      }
      {
        text: 'public',
        value: 'public'
        checked: false
      }
    ]

    $scope.addItem = ->
      $scope.items = $scope.items or []
      $scope.items.push
        act: ""
        title: ""
        category: 0
        place: ""
        lasting: ""
        content: ""
      return

    
    # $scope.addItem();
    $scope.save = ->
      GrapesServ.addActivity
        title: $scope.activity.title
        category: $scope.activity.category
        planner: $rootScope.currentUser ? '匿名'
        time: $scope.activity.time
        address: $scope.activity.address
        fee: $scope.fees[$scope.activity.fee]
        content: $scope.activity.content
        comment: $scope.activity.comment
        image_urls: $scope.activity.images
        scope: $scope.activity.scope
      , (result) ->
        $scope.act = result.act_id
        if $scope.items and $scope.items.length > 0 then $scope.saveItems() else window.location.hash = "#/detail/" + $scope.act
        return

      return

    $scope.saveItems = ->
      return  if not Array.isArray($scope.items) or $scope.items.length <= 0
      items = []
      $scope.items.forEach (item) ->
        items.push
          title: item.title
          category: item.category or 0
          place: item.place or ""
          lasting: item.lasting or ""
          content: item.content or ""
          image_urls: item.image_urls or ""

        return

      GrapesServ.addActivityItems
        act: $scope.act
        items: items
      , (result) ->
        if result.success
          window.location.hash = "#/detail/" + $scope.act
        else
          alert "error"
        return

      return

    $scope.mapSearch = (address) ->
      address = address || $scope.activity.address
      mapModal = $ '#mapModal'
      self = $scope

      maploaded = ->
        self.map = new AMap.Map "l-map",
          view: new AMap.View2D
            zoom:14
            rotation:0
          lang:"zh_cn"

        if !address
          AMap.service ["AMap.CitySearch"], ->
            citysearch = new AMap.CitySearch()
            citysearch.getLocalCity (status, result) ->
              if status == 'complete' and result.info == 'OK'
                if result and result.city and result.bounds
                  self.map.setBounds result.bounds

        self.map.plugin ['AMap.Scale'], ->
          self.map.addControl new AMap.Scale()

        self.map.plugin ["AMap.ToolBar"], ->
          self.map.addControl new AMap.ToolBar()

        $('#mapModal input').on 'keyup', self.autoComplete
        $('#mapModal input').on 'blur', ->
          self.tips = []

        searchPoi()

        return

      setMap = (loc) ->
        self.map.clearMap()
        point = new AMap.LngLat loc.lng, loc.lat
        self.map.setZoomAndCenter 16, point
        marker = new AMap.Marker
          map: self.map,
          position: point

      searchPoi = ->
        AMap.service ["AMap.PlaceSearch"], ->
          search = new AMap.PlaceSearch
            pageIndex:1,
            pageSize:10,
            city: "上海"
          search.search address, (status, result) ->
            if status is 'complete' and result.info is 'OK'
              setMap result.poiList.pois[0].location
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

    $scope.tips = []

    $scope.autoComplete = ->
      keywords = $('#mapModal input').val()
      $scope.map.plugin ["AMap.Autocomplete"], ->
        auto = new AMap.Autocomplete city: ''

        if keywords.length > 0
          AMap.event.addListener auto, 'complete', (result) ->
            $scope.tips = result.tips
          auto.search keywords
          return
        return
      return

    # $scope.$watch 'activity.address', $scope.autoComplete
    $scope.tapTip = (tip) ->
      $('#mapModal input').blur()
      $scope.activity.address = tip.name
      $scope.tips = []
      $scope.mapSearch(tip.name)

    return
]