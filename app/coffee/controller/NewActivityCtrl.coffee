angular.module("grapes.controllers").controller "NewActivityCtrl", [
  "$scope"
  "$rootScope"
  "GrapesServ"
  ($scope, $rootScope, GrapesServ) ->
    window.location.hash = "#/grapes_user_login"  unless $rootScope.currentUser
    $scope.setTitle
      title: "Create Activity"
      leftText: "Home"
      rightText: "Save"
      leftAction: ->
        window.location.hash = "#/grapes"
        return

      rightAction: ->

      visible: true

    window.location.hash = "#/grapes_user_login"  unless $rootScope.currentUser
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
        title: $scope.actTitle
        category: $scope.category
        planner: $rootScope.currentUser
        time: $scope.time
        address: $scope.address
        fee: $scope.fees[$scope.fee]
        content: $scope.content
        comment: $scope.comment
        image_urls: $scope.image_urls
        scope: $scope.scope
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