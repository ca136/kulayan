app = angular.module('app')
.controller 'ProductCtrl', ['$scope', 'cart', ($scope, cart) ->
  $scope.cart = cart
  $scope.product = product
  $scope.options = window.options = {}

  $scope.addToBag = ->
    if not $scope.options.color or not $scope.options.size
      alert 'Please select a size and color'
    else
      cartItem = _.extend $scope.options,
        thumbnail: $scope.product.images[0].url
        name: $scope.product.name
        price: $scope.product.price
        quantity: 1

      cart.addItem cartItem
      $scope.$emit 'addToCart'

  $scope.selectOption = (type, value, option) ->
    return if option.inactive

    $scope.options[type] = value
    $scope.cartActive = $scope.options.color and $scope.options.size and true or false
    option.selected = true

    if type is 'color'
      for color in $scope.product.colors
        color.inactive = false
        color.selected = false if color isnt option

      for stock in $scope.product.stock_items
        stock.inactive = true
        for colorItem in stock.color
          stock.inactive = false if colorItem.code is value

    else
      for stock in $scope.product.stock_items
        stock.inactive = false
        stock.selected = false if stock isnt option

      for color in $scope.product.colors
        color.inactive = true
        for stock in $scope.product.stock_items
          if stock.size_value is value
            for stockColor in stock.color
              color.inactive = false if stockColor.code is color.code


  $scope.getImageDims = (image) ->
    containerWidth = angular.element('.product-images-container').width()
    modifier = image.width / containerWidth
    scaledHeight = image.height / modifier
    containerWidth + ', ' + scaledHeight


  jQuery(document).ready ($) ->
    $('#productStory, #productDetails').click (e) ->
      return  if $(e.currentTarget).hasClass('active')
      $('.descTab').toggleClass 'active'
      $('.descContainer').toggleClass 'active'

    $('#mainImage').addimagezoom # single image zoom
      zoomrange: [3]
      magnifiersize: [600, 600]
      magnifierpos: 'right'

    # cursorshade: true
    #largeimage: 'hayden.jpg' //<-- No comma after last option!
    $('[data-share-icon]').click (e) ->
      imgSrcList = $(this).attr('src').split('.')
      newSrc = imgSrcList[0] + '-active.' + imgSrcList[1]
      $(this).attr 'src', newSrc
]