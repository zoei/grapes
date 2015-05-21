angular.module("grapes.controllers").controller "NewActivityCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    # window.location.hash = "#/grapes_user_login"  unless $rootScope.currentUser
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
      title: ''
      category: ''
      time: ''
      address: ''
      fee: ''
      content: ''
      comment: ''
      image_urls: ''
      scope: ''

    $scope.ActivityCategories = [
      "美食"
      "娱乐"
      "运动"
      "美容"
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
    $scope.categoryChange = ->
      console.debug $scope.activityCategory, $scope.ActivityCategories[$scope.activityCategory]
      return

    $scope.feeChange = ->
      console.debug $scope.fee, $scope.fees[$scope.fee]
      return

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
        planner: $rootScope.currentUser
        time: $scope.activity.time
        address: $scope.activity.address
        fee: $scope.fees[$scope.activity.fee]
        content: $scope.activity.content
        comment: $scope.activity.comment
        image_urls: $scope.activity.image_urls
        scope: $scope.activity.scope
      , (result) ->
        $scope.act = result.act_id
        $scope.saveItems()
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
          window.location.hash = "#/grapes_detail/" + $scope.act
        else
          alert "error"
        return

      return
]