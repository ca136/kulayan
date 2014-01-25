app = angular.module('app')
.controller 'ShopCtrl', ['$scope', ($scope) ->

  $scope.sizes = [
    name: 'XS'
    active: false
  ,
    name: 'S'
    active: false
  ,
    name: 'M'
    active: false
  ,
    name: 'L'
    active: false
  ,
    name: 'XL'
    active: false
  ]

  $scope.products = []
  _.each products, (product) ->
    $scope.products.push JSON.parse(product)

  $scope.sortOptions = ['publish_date', 'price', 'name']
  $scope.activeSearch =
    sizes: []
    sortBy: ''
    page: ''
    category: document.location.pathname.split('/')[2]

  $scope.filterBySize = (product) ->
    returnVal = false
    # return false if $scope.activeSearch.category isnt product.category.slug
    return true unless $scope.activeSearch.sizes.length

    for stockItem in product.stock_items
      for size in $scope.activeSearch.sizes
        returnVal = true if size.name is stockItem.size_value

    returnVal

  $scope.filterSize = (size) ->
    console.log size
    size.active = not size.active
    sizes = $scope.activeSearch.sizes

    sizes.splice sizes.indexOf(size.name), 1  unless size.active
    sizes.push size if size.active

    $scope.search()

  $scope.search = ->
    $scope.activeSearch.sortBy = $scope.predicate = $scope.sortBy
    console.log $scope.activeSearch

  window.SCOPE = $scope
]