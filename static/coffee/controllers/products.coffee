app = angular.module("app")
.controller "ShopCtrl", ["$scope", ($scope) ->
  $scope.sizes = [
    name: "XS"
    active: false
  ,
    name: "S"
    active: false
  ,
    name: "M"
    active: false
  ,
    name: "L"
    active: false
  ,
    name: "XL"
    active: false
  ]
  $scope.products = []
  _.each products, (product) ->
    $scope.products.push JSON.parse(product)

  $scope.sortOptions = ["publish_date", "price", "name"]
  $scope.activeSearch =
    sizes: []
    sortyBy: ""
    page: ""

  $scope.filterBySize = (product) ->
    returnVal = undefined
    return true  unless $scope.activeSearch.sizes.length
    _.each product.stock_items, (stockItem) ->
      returnVal = true  unless $scope.activeSearch.sizes.indexOf(stockItem.size_value) is -1

    returnVal or false

  $scope.filterSize = (size) ->
    size.active = (if size.active then false else true)
    sizes = $scope.activeSearch.sizes
    sizes.splice sizes.indexOf(size.name), 1  unless size.active
    $scope.search()

  $scope.search = ->
    $scope.activeSearch.sortBy = $scope.predicate = $scope.sortBy
    console.log $scope.activeSearch

  window.SCOPE = $scope
]