angular.module("grapes.directives").directive "businessModal", ->
  restrict: 'EA'
  scope: true
  templateUrl: './partials/directives/business_modal.html'
  replace: true
  requires: ['BusinessServ']
  link: (scope, element, attrs)->

    return
  controller: ['$scope', 'BusinessServ', ($scope, BusinessServ)->

    $scope.city = '上海'
    $scope.region = district_name: ''
    $scope.category = category_name: ''
    $scope.subCategory = category_name: ''

    $scope.getBusiness = ->
      params = {}
      params.city = $scope.city if $scope.city
      params.region = $scope.region.district_name if $scope.region.district_name
      params.category = $scope.category.category_name if $scope.category.category_name

      $scope.businesses = BusinessServ.getBusiness params

    $scope.regionChanged = (region)->
      $scope.region = region
      $scope.getBusiness()

    $scope.categoryChanged = (category)->
      $scope.category = category
      $scope.subcategories = $scope.category.subcategories;
      $scope.subCategory = $scope.subcategories[0]
      $scope.getBusiness()

    $scope.subCategoryChanged = (subCategory)->
      $scope.subCategory = subCategory
      $scope.getBusiness()


    $scope.regions = BusinessServ.getRegions city: $scope.city

    $scope.categories = BusinessServ.getCategories city: $scope.city, (categories)->
      $scope.category = categories[0]
      $scope.subcategories = $scope.category_name
      $scope.subCategory = category_name: ''

    $scope.getBusiness()

  ]