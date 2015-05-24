angular.module("grapes.controllers").controller "NewActivityCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
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
]