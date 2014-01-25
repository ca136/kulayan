app = angular.module('app', ['LocalStorageModule', 'ngCookies'])

app.config ($interpolateProvider, $httpProvider) ->
  $interpolateProvider.startSymbol '(('
  $interpolateProvider.endSymbol '))'
  $httpProvider.defaults.xsrfCookieName = 'csrftoken'
  $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken'
