app = angular.module("app")
.controller "MainCtrl", ["$scope", "cart", ($scope, cart) ->
  $scope.mainData =
    cartOpen: false
    checkoutActive: false
    cartItems: cart.getItems()

  $scope.openCart = ->
    $scope.mainData.cartOpen = true

  $scope.closeCart = ->
    $scope.mainData.cartOpen = false
    $scope.mainData.checkoutActive = false

  $scope.stopProp = ($event) ->

    # $event.preventDefault();
    $event.stopPropagation()

  $scope.clickCheckout = ->
    $scope.mainData.checkoutActive = true

  $scope.backToCart = ->
    $scope.mainData.checkoutActive = false

  $scope.$on "addToCart", ->
    $scope.openCart()

]