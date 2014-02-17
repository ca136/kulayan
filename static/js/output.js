(function() {
  var app;

  app = angular.module('app', ['LocalStorageModule', 'ngCookies']);

  app.config(function($interpolateProvider, $httpProvider) {
    $interpolateProvider.startSymbol('((');
    $interpolateProvider.endSymbol('))');
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    return $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
  });

}).call(this);

(function() {
  var echeck, validate_contact;

  echeck = function(str) {
    var at, dot, lat, ldot, lstr;
    at = "@";
    dot = ".";
    lat = str.indexof(at);
    lstr = str.length;
    ldot = str.indexof(dot);
    if (str.indexof(at) === -1) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.indexOf(at) === -1 || str.indexOf(at) === 0 || str.indexOf(at) === lstr) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.indexOf(dot) === -1 || str.indexOf(dot) === 0 || str.indexOf(dot) === lstr) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.indexOf(at, lat + 1) !== -1) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.substring(lat - 1, lat) === dot || str.substring(lat + 1, lat + 2) === dot) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.indexOf(dot, lat + 2) === -1) {
      alert("Invalid E-mail Address");
      return false;
    }
    if (str.indexOf(" ") !== -1) {
      alert("Invalid E-mail Address");
      return false;
    }
  };

  validate_contact = function(form1) {
    var field, field1;
    if ((!(document.form1.email.value != null)) || (document.form1.email.value === "")) {
      alert("Please enter email");
      document.form1.email.focus();
      return false;
    }
    if (echeck(document.form1.email.value) === false) {
      document.form1.email.value = "";
      document.form1.email.focus();
      return false;
    }
    field = document.form1.number.value;
    field1 = document.form1.number1.value;
    if (field === "") {
      alert("please enter security code");
      document.form1.number.focus();
      return false;
    }
    if (field !== field1) {
      alert("Invalid security code");
      document.form1.number.focus();
      return false;
    }
  };

}).call(this);

(function() {
  var COUNTRIES, app;

  app = angular.module("app").controller("CartCtrl", [
    "$scope", "$http", "cart", "$cookies", function($scope, $http, cart, $cookies) {
      Stripe.setPublishableKey("pk_test_lwpaiANNM16hoACyi0Ukhu00");
      $scope.cartData = {};
      $scope.cartData.cartItems = cart.getItems();
      $scope.checkoutData = {
        salesTax: 0,
        country: {
          name: "United States"
        }
      };
      $scope.staticData = {
        countries: COUNTRIES
      };
      $scope.removeItem = function(item) {
        return cart.removeItem(item);
      };
      $scope.getSubTotal = function(items) {
        var total;
        total = 0;
        _.each(items, function(item) {
          return total += item.price;
        });
        return total;
      };
      $scope.getShipping = function(items) {
        var shipping;
        shipping = 0;
        _.each(items, function(item) {
          return shipping += 10;
        });
        return shipping;
      };
      $scope.getTotal = function() {
        return $scope.getSubTotal() + $scope.getShipping();
      };
      return $scope.submitPayment = function(checkoutData) {
        return Stripe.card.createToken({
          number: checkoutData.cc,
          cvc: checkoutData.cvc,
          exp_month: checkoutData.expM,
          exp_year: checkoutData.expY
        }, function(status, response) {
          if (response.error) {
            $scope.checkoutData.error = response.error.message;
            return console.log(response.error);
          } else {
            checkoutData.token = response.id;
            checkoutData.total = $scope.getSubTotal($scope.cartData.cartItems) + $scope.getShipping($scope.cartData.cartItems);
            console.log(checkoutData.total);
            checkoutData.csrftoken = $cookies.csrftoken;
            window.$cookies = $cookies;
            return $http({
              method: "POST",
              url: "/checkout/",
              data: checkoutData
            }).success(function(response) {
              return console.log(response);
            }).error(function(response) {
              return console.log(response);
            });
          }
        });
      };
    }
  ]);

  COUNTRIES = [
    {
      name: "Australia"
    }, {
      name: "Canada"
    }, {
      name: "France"
    }, {
      name: "Germany"
    }, {
      name: "Greece"
    }, {
      name: "Ireland"
    }, {
      name: "Italy"
    }, {
      name: "New Zealand"
    }, {
      name: "Portugal"
    }, {
      name: "Russia"
    }, {
      name: "Spain"
    }, {
      name: "The Netherlands"
    }, {
      name: "United Kingdom"
    }, {
      name: "Afghanistan",
      other: "-----"
    }, {
      name: "Albania",
      other: "-----"
    }, {
      name: "Algeria",
      other: "-----"
    }, {
      name: "American Samoa",
      other: "-----"
    }, {
      name: "Andorra",
      other: "-----"
    }, {
      name: "Angola",
      other: "-----"
    }, {
      name: "Anguilla",
      other: "-----"
    }, {
      name: "Antigua and Barbuda",
      other: "-----"
    }, {
      name: "Argentina",
      other: "-----"
    }, {
      name: "Armenia",
      other: "-----"
    }, {
      name: "Aruba",
      other: "-----"
    }, {
      name: "Australia",
      other: "-----"
    }, {
      name: "Austria",
      other: "-----"
    }, {
      name: "Azerbaijan",
      other: "-----"
    }, {
      name: "Bahamas",
      other: "-----"
    }, {
      name: "Bahrain",
      other: "-----"
    }, {
      name: "Bangladesh",
      other: "-----"
    }, {
      name: "Barbados",
      other: "-----"
    }, {
      name: "Belarus",
      other: "-----"
    }, {
      name: "Belgium",
      other: "-----"
    }, {
      name: "Belize",
      other: "-----"
    }, {
      name: "Benin",
      other: "-----"
    }, {
      name: "Bermuda",
      other: "-----"
    }, {
      name: "Bhutan",
      other: "-----"
    }, {
      name: "Bolivia",
      other: "-----"
    }, {
      name: "Bosnia and Herzegovina",
      other: "-----"
    }, {
      name: "Botswana",
      other: "-----"
    }, {
      name: "Bouvet Island",
      other: "-----"
    }, {
      name: "Brazil",
      other: "-----"
    }, {
      name: "British Indian Ocean Territory",
      other: "-----"
    }, {
      name: "British Virgin Islands",
      other: "-----"
    }, {
      name: "Brunei",
      other: "-----"
    }, {
      name: "Bulgaria",
      other: "-----"
    }, {
      name: "Burkina Faso",
      other: "-----"
    }, {
      name: "Burundi",
      other: "-----"
    }, {
      name: "Cambodia",
      other: "-----"
    }, {
      name: "Cameroon",
      other: "-----"
    }, {
      name: "Canada",
      other: "-----"
    }, {
      name: "Cape Verde",
      other: "-----"
    }, {
      name: "Cayman Islands",
      other: "-----"
    }, {
      name: "Central African Republic",
      other: "-----"
    }, {
      name: "Chad",
      other: "-----"
    }, {
      name: "Chile",
      other: "-----"
    }, {
      name: "China",
      other: "-----"
    }, {
      name: "Christmas Island",
      other: "-----"
    }, {
      name: "Cocos (Keeling) Islands",
      other: "-----"
    }, {
      name: "Colombia",
      other: "-----"
    }, {
      name: "Comoros",
      other: "-----"
    }, {
      name: "Congo, Republic of",
      other: "-----"
    }, {
      name: "Cook Islands",
      other: "-----"
    }, {
      name: "Costa Rica",
      other: "-----"
    }, {
      name: "Croatia",
      other: "-----"
    }, {
      name: "Cuba",
      other: "-----"
    }, {
      name: "Cyprus",
      other: "-----"
    }, {
      name: "Czech Republic",
      other: "-----"
    }, {
      name: "Denmark",
      other: "-----"
    }, {
      name: "Djibouti",
      other: "-----"
    }, {
      name: "Dominica",
      other: "-----"
    }, {
      name: "Dominican Republic",
      other: "-----"
    }, {
      name: "Ecuador",
      other: "-----"
    }, {
      name: "Egypt",
      other: "-----"
    }, {
      name: "El Salvador",
      other: "-----"
    }, {
      name: "Equatorial Guinea",
      other: "-----"
    }, {
      name: "Eritrea",
      other: "-----"
    }, {
      name: "Estonia",
      other: "-----"
    }, {
      name: "Ethiopia",
      other: "-----"
    }, {
      name: "Falkland Islands (Malvinas)",
      other: "-----"
    }, {
      name: "Faroe Islands",
      other: "-----"
    }, {
      name: "Fiji",
      other: "-----"
    }, {
      name: "Finland",
      other: "-----"
    }, {
      name: "France",
      other: "-----"
    }, {
      name: "French Guiana",
      other: "-----"
    }, {
      name: "French Polynesia",
      other: "-----"
    }, {
      name: "French Southern Territories",
      other: "-----"
    }, {
      name: "Gabon",
      other: "-----"
    }, {
      name: "Gambia",
      other: "-----"
    }, {
      name: "Georgia",
      other: "-----"
    }, {
      name: "Germany",
      other: "-----"
    }, {
      name: "Ghana",
      other: "-----"
    }, {
      name: "Gibraltar",
      other: "-----"
    }, {
      name: "Greece",
      other: "-----"
    }, {
      name: "Greenland",
      other: "-----"
    }, {
      name: "Grenada",
      other: "-----"
    }, {
      name: "Guadeloupe",
      other: "-----"
    }, {
      name: "Guam",
      other: "-----"
    }, {
      name: "Guatemala",
      other: "-----"
    }, {
      name: "Guinea",
      other: "-----"
    }, {
      name: "Guinea-Bissau",
      other: "-----"
    }, {
      name: "Guyana",
      other: "-----"
    }, {
      name: "Haiti",
      other: "-----"
    }, {
      name: "Heard Island and McDonald Islands",
      other: "-----"
    }, {
      name: "Holy See (Vatican City State)",
      other: "-----"
    }, {
      name: "Honduras",
      other: "-----"
    }, {
      name: "Hong Kong",
      other: "-----"
    }, {
      name: "Hungary",
      other: "-----"
    }, {
      name: "Iceland",
      other: "-----"
    }, {
      name: "India",
      other: "-----"
    }, {
      name: "Indonesia",
      other: "-----"
    }, {
      name: "Iran",
      other: "-----"
    }, {
      name: "Iraq",
      other: "-----"
    }, {
      name: "Ireland",
      other: "-----"
    }, {
      name: "Isle of Man",
      other: "-----"
    }, {
      name: "Israel",
      other: "-----"
    }, {
      name: "Italy",
      other: "-----"
    }, {
      name: "Ivory Coast",
      other: "-----"
    }, {
      name: "Jamaica",
      other: "-----"
    }, {
      name: "Japan",
      other: "-----"
    }, {
      name: "Jordan",
      other: "-----"
    }, {
      name: "Kazakhstan",
      other: "-----"
    }, {
      name: "Kenya",
      other: "-----"
    }, {
      name: "Kiribati",
      other: "-----"
    }, {
      name: "Kosovo",
      other: "-----"
    }, {
      name: "Kuwait",
      other: "-----"
    }, {
      name: "Kyrgyzstan",
      other: "-----"
    }, {
      name: "Laos",
      other: "-----"
    }, {
      name: "Latvia",
      other: "-----"
    }, {
      name: "Lebanon",
      other: "-----"
    }, {
      name: "Lesotho",
      other: "-----"
    }, {
      name: "Liberia",
      other: "-----"
    }, {
      name: "Libya",
      other: "-----"
    }, {
      name: "Liechtenstein",
      other: "-----"
    }, {
      name: "Lithuania",
      other: "-----"
    }, {
      name: "Luxembourg",
      other: "-----"
    }, {
      name: "Macao",
      other: "-----"
    }, {
      name: "Macedonia",
      other: "-----"
    }, {
      name: "Madagascar",
      other: "-----"
    }, {
      name: "Malawi",
      other: "-----"
    }, {
      name: "Malaysia",
      other: "-----"
    }, {
      name: "Maldives",
      other: "-----"
    }, {
      name: "Mali",
      other: "-----"
    }, {
      name: "Malta",
      other: "-----"
    }, {
      name: "Marshall Islands",
      other: "-----"
    }, {
      name: "Martinique",
      other: "-----"
    }, {
      name: "Mauritania",
      other: "-----"
    }, {
      name: "Mauritius",
      other: "-----"
    }, {
      name: "Mayotte",
      other: "-----"
    }, {
      name: "Mexico",
      other: "-----"
    }, {
      name: "Micronesia, Federated States of",
      other: "-----"
    }, {
      name: "Moldova",
      other: "-----"
    }, {
      name: "Monaco",
      other: "-----"
    }, {
      name: "Mongolia",
      other: "-----"
    }, {
      name: "Montenegro",
      other: "-----"
    }, {
      name: "Montserrat",
      other: "-----"
    }, {
      name: "Morocco",
      other: "-----"
    }, {
      name: "Mozambique",
      other: "-----"
    }, {
      name: "Myanmar (Burma)",
      other: "-----"
    }, {
      name: "Namibia",
      other: "-----"
    }, {
      name: "Nauru",
      other: "-----"
    }, {
      name: "Nepal",
      other: "-----"
    }, {
      name: "Netherlands Antilles",
      other: "-----"
    }, {
      name: "New Caledonia",
      other: "-----"
    }, {
      name: "New Zealand",
      other: "-----"
    }, {
      name: "Nicaragua",
      other: "-----"
    }, {
      name: "Niger",
      other: "-----"
    }, {
      name: "Nigeria",
      other: "-----"
    }, {
      name: "Niue",
      other: "-----"
    }, {
      name: "Norfolk Island",
      other: "-----"
    }, {
      name: "Northern Mariana Islands",
      other: "-----"
    }, {
      name: "North Korea",
      other: "-----"
    }, {
      name: "Norway",
      other: "-----"
    }, {
      name: "Oman",
      other: "-----"
    }, {
      name: "Pakistan",
      other: "-----"
    }, {
      name: "Palau",
      other: "-----"
    }, {
      name: "Palestinian Territory, Occupied",
      other: "-----"
    }, {
      name: "Panama",
      other: "-----"
    }, {
      name: "Papua New Guinea",
      other: "-----"
    }, {
      name: "Paraguay",
      other: "-----"
    }, {
      name: "Peru",
      other: "-----"
    }, {
      name: "Philippines",
      other: "-----"
    }, {
      name: "Poland",
      other: "-----"
    }, {
      name: "Portugal",
      other: "-----"
    }, {
      name: "Puerto Rico",
      other: "-----"
    }, {
      name: "Qatar",
      other: "-----"
    }, {
      name: "Reunion",
      other: "-----"
    }, {
      name: "Romania",
      other: "-----"
    }, {
      name: "Russia",
      other: "-----"
    }, {
      name: "Rwanda",
      other: "-----"
    }, {
      name: "Saint Helena",
      other: "-----"
    }, {
      name: "Saint Kitts and Nevis",
      other: "-----"
    }, {
      name: "Saint Lucia",
      other: "-----"
    }, {
      name: "Saint Martin (French part)",
      other: "-----"
    }, {
      name: "Saint Pierre and Miquelon",
      other: "-----"
    }, {
      name: "Saint Vincent and the Grenadines",
      other: "-----"
    }, {
      name: "Samoa",
      other: "-----"
    }, {
      name: "San Marino",
      other: "-----"
    }, {
      name: "Sao Tome and Principe",
      other: "-----"
    }, {
      name: "Saudi Arabia",
      other: "-----"
    }, {
      name: "Senegal",
      other: "-----"
    }, {
      name: "Serbia",
      other: "-----"
    }, {
      name: "Seychelles",
      other: "-----"
    }, {
      name: "Sierra Leone",
      other: "-----"
    }, {
      name: "Singapore",
      other: "-----"
    }, {
      name: "Slovakia",
      other: "-----"
    }, {
      name: "Slovenia",
      other: "-----"
    }, {
      name: "Solomon Islands",
      other: "-----"
    }, {
      name: "Somalia",
      other: "-----"
    }, {
      name: "South Africa",
      other: "-----"
    }, {
      name: "South Georgia and the South Sandwich Islands",
      other: "-----"
    }, {
      name: "South Korea",
      other: "-----"
    }, {
      name: "Spain",
      other: "-----"
    }, {
      name: "Sri Lanka",
      other: "-----"
    }, {
      name: "Sudan",
      other: "-----"
    }, {
      name: "Suriname",
      other: "-----"
    }, {
      name: "Svalbard and Jan Mayen",
      other: "-----"
    }, {
      name: "Swaziland",
      other: "-----"
    }, {
      name: "Sweden",
      other: "-----"
    }, {
      name: "Switzerland",
      other: "-----"
    }, {
      name: "Syria",
      other: "-----"
    }, {
      name: "Taiwan",
      other: "-----"
    }, {
      name: "Tajikistan",
      other: "-----"
    }, {
      name: "Tanzania",
      other: "-----"
    }, {
      name: "Thailand",
      other: "-----"
    }, {
      name: "The Netherlands",
      other: "-----"
    }, {
      name: "Timor-Leste",
      other: "-----"
    }, {
      name: "Togo",
      other: "-----"
    }, {
      name: "Tokelau",
      other: "-----"
    }, {
      name: "Tonga",
      other: "-----"
    }, {
      name: "Trinidad",
      other: "-----"
    }, {
      name: "Tunisia",
      other: "-----"
    }, {
      name: "Turkey",
      other: "-----"
    }, {
      name: "Turkmenistan",
      other: "-----"
    }, {
      name: "Turks and Caicos Islands",
      other: "-----"
    }, {
      name: "Tuvalu",
      other: "-----"
    }, {
      name: "Uganda",
      other: "-----"
    }, {
      name: "Ukraine",
      other: "-----"
    }, {
      name: "United Arab Emirates",
      other: "-----"
    }, {
      name: "United Kingdom",
      other: "-----"
    }, {
      name: "United States",
      other: "-----"
    }, {
      name: "United States Minor Outlying Islands",
      other: "-----"
    }, {
      name: "Uruguay",
      other: "-----"
    }, {
      name: "U.S. Virgin Islands",
      other: "-----"
    }, {
      name: "Uzbekistan",
      other: "-----"
    }, {
      name: "Vanuatu",
      other: "-----"
    }, {
      name: "Venezuela",
      other: "-----"
    }, {
      name: "Vietnam",
      other: "-----"
    }, {
      name: "Wallis and Futuna",
      other: "-----"
    }, {
      name: "Western Sahara",
      other: "-----"
    }, {
      name: "Yemen",
      other: "-----"
    }, {
      name: "Zaire (Democratic Republic of Congo)",
      other: "-----"
    }, {
      name: "Zambia",
      other: "-----"
    }, {
      name: "Zimbabwe",
      other: "-----"
    }
  ];

}).call(this);

(function() {
  var app;

  app = angular.module("app").controller("MainCtrl", [
    "$scope", "cart", function($scope, cart) {
      $scope.mainData = {
        cartOpen: false,
        checkoutActive: false,
        cartItems: cart.getItems()
      };
      $scope.openCart = function() {
        return $scope.mainData.cartOpen = true;
      };
      $scope.closeCart = function() {
        $scope.mainData.cartOpen = false;
        return $scope.mainData.checkoutActive = false;
      };
      $scope.stopProp = function($event) {
        return $event.stopPropagation();
      };
      $scope.clickCheckout = function() {
        return $scope.mainData.checkoutActive = true;
      };
      $scope.backToCart = function() {
        return $scope.mainData.checkoutActive = false;
      };
      return $scope.$on("addToCart", function() {
        return $scope.openCart();
      });
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module('app').controller('ProductCtrl', [
    '$scope', 'cart', function($scope, cart) {
      $scope.cart = cart;
      $scope.product = product;
      $scope.options = window.options = {};
      $scope.addToBag = function() {
        var cartItem;
        if (!$scope.options.color || !$scope.options.size) {
          return alert('Please select a size and color');
        } else {
          cartItem = _.extend($scope.options, {
            thumbnail: $scope.product.images[0].url,
            name: $scope.product.name,
            price: $scope.product.price,
            quantity: 1
          });
          cart.addItem(cartItem);
          return $scope.$emit('addToCart');
        }
      };
      $scope.selectOption = function(type, value, option) {
        var color, colorItem, stock, stockColor, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _results, _results1;
        if (option.inactive) {
          return;
        }
        $scope.options[type] = value;
        $scope.cartActive = $scope.options.color && $scope.options.size && true || false;
        option.selected = true;
        if (type === 'color') {
          _ref = $scope.product.colors;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            color = _ref[_i];
            color.inactive = false;
            if (color !== option) {
              color.selected = false;
            }
          }
          _ref1 = $scope.product.stock_items;
          _results = [];
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            stock = _ref1[_j];
            stock.inactive = true;
            _results.push((function() {
              var _k, _len2, _ref2, _results1;
              _ref2 = stock.color;
              _results1 = [];
              for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
                colorItem = _ref2[_k];
                if (colorItem.code === value) {
                  _results1.push(stock.inactive = false);
                } else {
                  _results1.push(void 0);
                }
              }
              return _results1;
            })());
          }
          return _results;
        } else {
          _ref2 = $scope.product.stock_items;
          for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
            stock = _ref2[_k];
            stock.inactive = false;
            if (stock !== option) {
              stock.selected = false;
            }
          }
          _ref3 = $scope.product.colors;
          _results1 = [];
          for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
            color = _ref3[_l];
            color.inactive = true;
            _results1.push((function() {
              var _len4, _m, _ref4, _results2;
              _ref4 = $scope.product.stock_items;
              _results2 = [];
              for (_m = 0, _len4 = _ref4.length; _m < _len4; _m++) {
                stock = _ref4[_m];
                if (stock.size_value === value) {
                  _results2.push((function() {
                    var _len5, _n, _ref5, _results3;
                    _ref5 = stock.color;
                    _results3 = [];
                    for (_n = 0, _len5 = _ref5.length; _n < _len5; _n++) {
                      stockColor = _ref5[_n];
                      if (stockColor.code === color.code) {
                        _results3.push(color.inactive = false);
                      } else {
                        _results3.push(void 0);
                      }
                    }
                    return _results3;
                  })());
                } else {
                  _results2.push(void 0);
                }
              }
              return _results2;
            })());
          }
          return _results1;
        }
      };
      $scope.getImageDims = function(image) {
        var containerWidth, modifier, scaledHeight;
        containerWidth = angular.element('.product-images-container').width();
        modifier = image.width / containerWidth;
        scaledHeight = image.height / modifier;
        return containerWidth + ', ' + scaledHeight;
      };
      return jQuery(document).ready(function($) {
        $('#productStory, #productDetails').click(function(e) {
          if ($(e.currentTarget).hasClass('active')) {
            return;
          }
          $('.descTab').toggleClass('active');
          return $('.descContainer').toggleClass('active');
        });
        $('#mainImage').addimagezoom({
          zoomrange: [3],
          magnifiersize: [600, 600],
          magnifierpos: 'right'
        });
        return $('[data-share-icon]').click(function(e) {
          var imgSrcList, newSrc;
          imgSrcList = $(this).attr('src').split('.');
          newSrc = imgSrcList[0] + '-active.' + imgSrcList[1];
          return $(this).attr('src', newSrc);
        });
      });
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module('app').controller('ShopCtrl', [
    '$scope', function($scope) {
      $scope.sizes = [
        {
          name: 'XS',
          active: false
        }, {
          name: 'S',
          active: false
        }, {
          name: 'M',
          active: false
        }, {
          name: 'L',
          active: false
        }, {
          name: 'XL',
          active: false
        }
      ];
      $scope.products = [];
      _.each(products, function(product) {
        return $scope.products.push(JSON.parse(product));
      });
      $scope.sortOptions = ['publish date', 'price', 'name'];
      $scope.sortBy = 'publish date';
      $scope.activeSearch = {
        sizes: [],
        sortBy: '',
        page: '',
        category: document.location.pathname.split('/')[2]
      };
      $scope.filterBySize = function(product) {
        var returnVal, size, stockItem, _i, _j, _len, _len1, _ref, _ref1;
        returnVal = false;
        if (!$scope.activeSearch.sizes.length) {
          return true;
        }
        _ref = product.stock_items;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          stockItem = _ref[_i];
          _ref1 = $scope.activeSearch.sizes;
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            size = _ref1[_j];
            if (size.name === stockItem.size_value) {
              returnVal = true;
            }
          }
        }
        return returnVal;
      };
      $scope.filterSize = function(size) {
        var sizes;
        size.active = !size.active;
        sizes = $scope.activeSearch.sizes;
        if (!size.active) {
          sizes.splice(sizes.indexOf(size.name), 1);
        }
        if (size.active) {
          sizes.push(size);
        }
        return $scope.search();
      };
      return $scope.search = function() {
        return $scope.activeSearch.sortBy = $scope.predicate = $scope.sortBy.split(' ').join('_');
      };
    }
  ]);

}).call(this);

(function() {
  var app;

  app = angular.module("app");

  app.factory("cart", [
    "localStorageService", function(localStorageService) {
      var cartItems, data;
      cartItems = localStorageService.get("cartItems") || bag && bag.cartItems || [];
      data = {
        items: cartItems
      };
      return {
        getItems: function() {
          return data.items;
        },
        addItem: function(item) {
          data.items.push(item);
          return localStorageService.add("cartItems", data.items);
        },
        removeItem: function(item) {
          data.items.splice(data.items.indexOf(item), 1);
          return localStorageService.add("cartItems", data.items);
        },
        clearCart: function() {
          data.items = [];
          return localStorageService.remove("cartItems");
        }
      };
    }
  ]);

}).call(this);
