app = angular.module("app")
.controller "ProductCtrl", ["$scope", "cart", ($scope, cart) ->
  window.SCOPE = $scope
  SCOPE.cart = cart
  $scope.product = product
  $scope.options = window.options = {}
  $scope.addToBag = ->
    if not $scope.options.color or not $scope.options.size
      alert "Please select a size and color"
    else
      item = _.extend($scope.options,
        thumbnail: $scope.product.images[0].url
        name: $scope.product.name
        price: $scope.product.price
        quantity: 1
      )
      cart.addItem item
      $scope.$emit "addToCart"

  $scope.selectOption = (type, value) ->
    $scope.options[type] = value
    $scope.cartActive = true  if $scope.options.color and $scope.options.size

  $scope.getImageDims = (image) ->
    containerWidth = angular.element(".product-images-container").width()
    modifier = image.width / containerWidth
    scaledHeight = image.height / modifier
    containerWidth + ", " + scaledHeight

  jQuery(document).ready ($) ->
    $("#productStory, #productDetails").click (e) ->
      return  if $(e.currentTarget).hasClass("active")
      $(".descTab").toggleClass "active"
      $(".descContainer").toggleClass "active"

    $(".color-option").click (e) ->
      $(".color-option").removeClass "active"
      $(e.currentTarget).addClass "active"

    $(".size-option").click (e) ->
      $(".size-option").removeClass "active"
      $(e.currentTarget).addClass "active"

    $("#mainImage").addimagezoom # single image zoom
      zoomrange: [3]
      magnifiersize: [600, 600]
      magnifierpos: "right"


    # cursorshade: true
    #largeimage: 'hayden.jpg' //<-- No comma after last option!
    $("[data-share-icon]").click (e) ->
      imgSrcList = $(this).attr("src").split(".")
      newSrc = imgSrcList[0] + "-active." + imgSrcList[1]
      $(this).attr "src", newSrc
]