app = angular.module("app")
.controller "CartCtrl", ["$scope", "$http", "cart", "$cookies", ($scope, $http, cart, $cookies) ->
  Stripe.setPublishableKey "pk_test_lwpaiANNM16hoACyi0Ukhu00"
  $scope.cartData = {}
  $scope.cartData.cartItems = cart.getItems()
  $scope.checkoutData =
    salesTax: 0
    country: "United States"

  $scope.staticData = countries: COUNTRIES
  $scope.removeItem = (item) ->
    cart.removeItem item

  $scope.getSubTotal = (items) ->
    total = 0
    _.each items, (item) ->
      total += item.price

    total

  $scope.getShipping = (items) ->
    shipping = 0
    _.each items, (item) ->
      shipping += 10

    shipping

  $scope.getTotal = ->
    $scope.getSubTotal() + $scope.getShipping()


  # For checking out the customer
  $scope.submitPayment = (checkoutData) ->

    # NEED TO DISABLE FORM HERE!!!
    Stripe.card.createToken
      number: checkoutData.cc
      cvc: checkoutData.cvc
      exp_month: checkoutData.expM
      exp_year: checkoutData.expY
    , (status, response) ->
      if response.error
        $scope.checkoutData.error = response.error.message
        console.log response.error
      else
        checkoutData.token = response.id
        checkoutData.total = $scope.getSubTotal($scope.cartData.cartItems) + $scope.getShipping($scope.cartData.cartItems)
        console.log checkoutData.total
        checkoutData.csrftoken = $cookies.csrftoken
        window.$cookies = $cookies
        $http(
          method: "POST"
          url: "/checkout/"
          data: checkoutData
        ).success((response) ->
          console.log response
        ).error (response) ->
          console.log response


]

# do something on success...
COUNTRIES = [
  name: "Australia"
,
  name: "Canada"
,
  name: "France"
,
  name: "Germany"
,
  name: "Greece"
,
  name: "Ireland"
,
  name: "Italy"
,
  name: "New Zealand"
,
  name: "Portugal"
,
  name: "Russia"
,
  name: "Spain"
,
  name: "The Netherlands"
,
  name: "United Kingdom"
,
  name: "United States"
,
  name: "Afghanistan"
  other: "-----"
,
  name: "Albania"
  other: "-----"
,
  name: "Algeria"
  other: "-----"
,
  name: "American Samoa"
  other: "-----"
,
  name: "Andorra"
  other: "-----"
,
  name: "Angola"
  other: "-----"
,
  name: "Anguilla"
  other: "-----"
,
  name: "Antigua and Barbuda"
  other: "-----"
,
  name: "Argentina"
  other: "-----"
,
  name: "Armenia"
  other: "-----"
,
  name: "Aruba"
  other: "-----"
,
  name: "Australia"
  other: "-----"
,
  name: "Austria"
  other: "-----"
,
  name: "Azerbaijan"
  other: "-----"
,
  name: "Bahamas"
  other: "-----"
,
  name: "Bahrain"
  other: "-----"
,
  name: "Bangladesh"
  other: "-----"
,
  name: "Barbados"
  other: "-----"
,
  name: "Belarus"
  other: "-----"
,
  name: "Belgium"
  other: "-----"
,
  name: "Belize"
  other: "-----"
,
  name: "Benin"
  other: "-----"
,
  name: "Bermuda"
  other: "-----"
,
  name: "Bhutan"
  other: "-----"
,
  name: "Bolivia"
  other: "-----"
,
  name: "Bosnia and Herzegovina"
  other: "-----"
,
  name: "Botswana"
  other: "-----"
,
  name: "Bouvet Island"
  other: "-----"
,
  name: "Brazil"
  other: "-----"
,
  name: "British Indian Ocean Territory"
  other: "-----"
,
  name: "British Virgin Islands"
  other: "-----"
,
  name: "Brunei"
  other: "-----"
,
  name: "Bulgaria"
  other: "-----"
,
  name: "Burkina Faso"
  other: "-----"
,
  name: "Burundi"
  other: "-----"
,
  name: "Cambodia"
  other: "-----"
,
  name: "Cameroon"
  other: "-----"
,
  name: "Canada"
  other: "-----"
,
  name: "Cape Verde"
  other: "-----"
,
  name: "Cayman Islands"
  other: "-----"
,
  name: "Central African Republic"
  other: "-----"
,
  name: "Chad"
  other: "-----"
,
  name: "Chile"
  other: "-----"
,
  name: "China"
  other: "-----"
,
  name: "Christmas Island"
  other: "-----"
,
  name: "Cocos (Keeling) Islands"
  other: "-----"
,
  name: "Colombia"
  other: "-----"
,
  name: "Comoros"
  other: "-----"
,
  name: "Congo, Republic of"
  other: "-----"
,
  name: "Cook Islands"
  other: "-----"
,
  name: "Costa Rica"
  other: "-----"
,
  name: "Croatia"
  other: "-----"
,
  name: "Cuba"
  other: "-----"
,
  name: "Cyprus"
  other: "-----"
,
  name: "Czech Republic"
  other: "-----"
,
  name: "Denmark"
  other: "-----"
,
  name: "Djibouti"
  other: "-----"
,
  name: "Dominica"
  other: "-----"
,
  name: "Dominican Republic"
  other: "-----"
,
  name: "Ecuador"
  other: "-----"
,
  name: "Egypt"
  other: "-----"
,
  name: "El Salvador"
  other: "-----"
,
  name: "Equatorial Guinea"
  other: "-----"
,
  name: "Eritrea"
  other: "-----"
,
  name: "Estonia"
  other: "-----"
,
  name: "Ethiopia"
  other: "-----"
,
  name: "Falkland Islands (Malvinas)"
  other: "-----"
,
  name: "Faroe Islands"
  other: "-----"
,
  name: "Fiji"
  other: "-----"
,
  name: "Finland"
  other: "-----"
,
  name: "France"
  other: "-----"
,
  name: "French Guiana"
  other: "-----"
,
  name: "French Polynesia"
  other: "-----"
,
  name: "French Southern Territories"
  other: "-----"
,
  name: "Gabon"
  other: "-----"
,
  name: "Gambia"
  other: "-----"
,
  name: "Georgia"
  other: "-----"
,
  name: "Germany"
  other: "-----"
,
  name: "Ghana"
  other: "-----"
,
  name: "Gibraltar"
  other: "-----"
,
  name: "Greece"
  other: "-----"
,
  name: "Greenland"
  other: "-----"
,
  name: "Grenada"
  other: "-----"
,
  name: "Guadeloupe"
  other: "-----"
,
  name: "Guam"
  other: "-----"
,
  name: "Guatemala"
  other: "-----"
,
  name: "Guinea"
  other: "-----"
,
  name: "Guinea-Bissau"
  other: "-----"
,
  name: "Guyana"
  other: "-----"
,
  name: "Haiti"
  other: "-----"
,
  name: "Heard Island and McDonald Islands"
  other: "-----"
,
  name: "Holy See (Vatican City State)"
  other: "-----"
,
  name: "Honduras"
  other: "-----"
,
  name: "Hong Kong"
  other: "-----"
,
  name: "Hungary"
  other: "-----"
,
  name: "Iceland"
  other: "-----"
,
  name: "India"
  other: "-----"
,
  name: "Indonesia"
  other: "-----"
,
  name: "Iran"
  other: "-----"
,
  name: "Iraq"
  other: "-----"
,
  name: "Ireland"
  other: "-----"
,
  name: "Isle of Man"
  other: "-----"
,
  name: "Israel"
  other: "-----"
,
  name: "Italy"
  other: "-----"
,
  name: "Ivory Coast"
  other: "-----"
,
  name: "Jamaica"
  other: "-----"
,
  name: "Japan"
  other: "-----"
,
  name: "Jordan"
  other: "-----"
,
  name: "Kazakhstan"
  other: "-----"
,
  name: "Kenya"
  other: "-----"
,
  name: "Kiribati"
  other: "-----"
,
  name: "Kosovo"
  other: "-----"
,
  name: "Kuwait"
  other: "-----"
,
  name: "Kyrgyzstan"
  other: "-----"
,
  name: "Laos"
  other: "-----"
,
  name: "Latvia"
  other: "-----"
,
  name: "Lebanon"
  other: "-----"
,
  name: "Lesotho"
  other: "-----"
,
  name: "Liberia"
  other: "-----"
,
  name: "Libya"
  other: "-----"
,
  name: "Liechtenstein"
  other: "-----"
,
  name: "Lithuania"
  other: "-----"
,
  name: "Luxembourg"
  other: "-----"
,
  name: "Macao"
  other: "-----"
,
  name: "Macedonia"
  other: "-----"
,
  name: "Madagascar"
  other: "-----"
,
  name: "Malawi"
  other: "-----"
,
  name: "Malaysia"
  other: "-----"
,
  name: "Maldives"
  other: "-----"
,
  name: "Mali"
  other: "-----"
,
  name: "Malta"
  other: "-----"
,
  name: "Marshall Islands"
  other: "-----"
,
  name: "Martinique"
  other: "-----"
,
  name: "Mauritania"
  other: "-----"
,
  name: "Mauritius"
  other: "-----"
,
  name: "Mayotte"
  other: "-----"
,
  name: "Mexico"
  other: "-----"
,
  name: "Micronesia, Federated States of"
  other: "-----"
,
  name: "Moldova"
  other: "-----"
,
  name: "Monaco"
  other: "-----"
,
  name: "Mongolia"
  other: "-----"
,
  name: "Montenegro"
  other: "-----"
,
  name: "Montserrat"
  other: "-----"
,
  name: "Morocco"
  other: "-----"
,
  name: "Mozambique"
  other: "-----"
,
  name: "Myanmar (Burma)"
  other: "-----"
,
  name: "Namibia"
  other: "-----"
,
  name: "Nauru"
  other: "-----"
,
  name: "Nepal"
  other: "-----"
,
  name: "Netherlands Antilles"
  other: "-----"
,
  name: "New Caledonia"
  other: "-----"
,
  name: "New Zealand"
  other: "-----"
,
  name: "Nicaragua"
  other: "-----"
,
  name: "Niger"
  other: "-----"
,
  name: "Nigeria"
  other: "-----"
,
  name: "Niue"
  other: "-----"
,
  name: "Norfolk Island"
  other: "-----"
,
  name: "Northern Mariana Islands"
  other: "-----"
,
  name: "North Korea"
  other: "-----"
,
  name: "Norway"
  other: "-----"
,
  name: "Oman"
  other: "-----"
,
  name: "Pakistan"
  other: "-----"
,
  name: "Palau"
  other: "-----"
,
  name: "Palestinian Territory, Occupied"
  other: "-----"
,
  name: "Panama"
  other: "-----"
,
  name: "Papua New Guinea"
  other: "-----"
,
  name: "Paraguay"
  other: "-----"
,
  name: "Peru"
  other: "-----"
,
  name: "Philippines"
  other: "-----"
,
  name: "Poland"
  other: "-----"
,
  name: "Portugal"
  other: "-----"
,
  name: "Puerto Rico"
  other: "-----"
,
  name: "Qatar"
  other: "-----"
,
  name: "Reunion"
  other: "-----"
,
  name: "Romania"
  other: "-----"
,
  name: "Russia"
  other: "-----"
,
  name: "Rwanda"
  other: "-----"
,
  name: "Saint Helena"
  other: "-----"
,
  name: "Saint Kitts and Nevis"
  other: "-----"
,
  name: "Saint Lucia"
  other: "-----"
,
  name: "Saint Martin (French part)"
  other: "-----"
,
  name: "Saint Pierre and Miquelon"
  other: "-----"
,
  name: "Saint Vincent and the Grenadines"
  other: "-----"
,
  name: "Samoa"
  other: "-----"
,
  name: "San Marino"
  other: "-----"
,
  name: "Sao Tome and Principe"
  other: "-----"
,
  name: "Saudi Arabia"
  other: "-----"
,
  name: "Senegal"
  other: "-----"
,
  name: "Serbia"
  other: "-----"
,
  name: "Seychelles"
  other: "-----"
,
  name: "Sierra Leone"
  other: "-----"
,
  name: "Singapore"
  other: "-----"
,
  name: "Slovakia"
  other: "-----"
,
  name: "Slovenia"
  other: "-----"
,
  name: "Solomon Islands"
  other: "-----"
,
  name: "Somalia"
  other: "-----"
,
  name: "South Africa"
  other: "-----"
,
  name: "South Georgia and the South Sandwich Islands"
  other: "-----"
,
  name: "South Korea"
  other: "-----"
,
  name: "Spain"
  other: "-----"
,
  name: "Sri Lanka"
  other: "-----"
,
  name: "Sudan"
  other: "-----"
,
  name: "Suriname"
  other: "-----"
,
  name: "Svalbard and Jan Mayen"
  other: "-----"
,
  name: "Swaziland"
  other: "-----"
,
  name: "Sweden"
  other: "-----"
,
  name: "Switzerland"
  other: "-----"
,
  name: "Syria"
  other: "-----"
,
  name: "Taiwan"
  other: "-----"
,
  name: "Tajikistan"
  other: "-----"
,
  name: "Tanzania"
  other: "-----"
,
  name: "Thailand"
  other: "-----"
,
  name: "The Netherlands"
  other: "-----"
,
  name: "Timor-Leste"
  other: "-----"
,
  name: "Togo"
  other: "-----"
,
  name: "Tokelau"
  other: "-----"
,
  name: "Tonga"
  other: "-----"
,
  name: "Trinidad"
  other: "-----"
,
  name: "Tunisia"
  other: "-----"
,
  name: "Turkey"
  other: "-----"
,
  name: "Turkmenistan"
  other: "-----"
,
  name: "Turks and Caicos Islands"
  other: "-----"
,
  name: "Tuvalu"
  other: "-----"
,
  name: "Uganda"
  other: "-----"
,
  name: "Ukraine"
  other: "-----"
,
  name: "United Arab Emirates"
  other: "-----"
,
  name: "United Kingdom"
  other: "-----"
,
  name: "United States"
  other: "-----"
,
  name: "United States Minor Outlying Islands"
  other: "-----"
,
  name: "Uruguay"
  other: "-----"
,
  name: "U.S. Virgin Islands"
  other: "-----"
,
  name: "Uzbekistan"
  other: "-----"
,
  name: "Vanuatu"
  other: "-----"
,
  name: "Venezuela"
  other: "-----"
,
  name: "Vietnam"
  other: "-----"
,
  name: "Wallis and Futuna"
  other: "-----"
,
  name: "Western Sahara"
  other: "-----"
,
  name: "Yemen"
  other: "-----"
,
  name: "Zaire (Democratic Republic of Congo)"
  other: "-----"
,
  name: "Zambia"
  other: "-----"
,
  name: "Zimbabwe"
  other: "-----"
]