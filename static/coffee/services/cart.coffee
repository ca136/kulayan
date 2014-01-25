app = angular.module("app")
app.factory "cart", ["localStorageService", (localStorageService) ->
  cartItems = localStorageService.get("cartItems") or bag and bag.cartItems or []
  data = items: cartItems
  getItems: ->
    data.items

  addItem: (item) ->
    data.items.push item
    localStorageService.add "cartItems", data.items

  removeItem: (item) ->
    data.items.splice data.items.indexOf(item), 1
    localStorageService.add "cartItems", data.items

  clearCart: ->
    data.items = []
    localStorageService.remove "cartItems"
]