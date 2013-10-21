function ProductCtrl($scope) {
  $scope.product = product;
  $scope.bag = bag || {};
  $scope.options = window.options = {};

  $scope.addToBag = function() {
    if (!$scope.options.color || !$scope.options.size)
      alert('Please select a size and color');
    $scope.bag.cart_items.push($scope.options);
  };

  // $scope.remaining = function() {
  //   var count = 0;
  //   angular.forEach($scope.todos, function(todo) {
  //     count += todo.done ? 0 : 1;
  //   });
  //   return count;
  // };

  // $scope.archive = function() {
  //   var oldTodos = $scope.todos;
  //   $scope.todos = [];
  //   angular.forEach(oldTodos, function(todo) {
  //     if (!todo.done) $scope.todos.push(todo);
  //   });
  // };

  jQuery(document).ready(function($){

    $('#productStory, #productDetails').click( function (e) {
    if ( $(e.currentTarget).hasClass('active') )
  			return;
  		$('.descTab').toggleClass('active');
  		$('.descContainer').toggleClass('active');
    });

    $('.color-option').click( function (e) {
  		$('.color-option').removeClass('active');
  		$(e.currentTarget).addClass('active');
    });

    $('.size-option').click( function (e) {
  		$('.size-option').removeClass('active');
  		$(e.currentTarget).addClass('active');
    });

    // $('.product-thumbnail').click( function (e) {
  		// var $target = $(e.currentTarget)
  		// 	, $mainImage = $('#main-image')
  		// 	, targetSrc = $target.attr('src')
  		// 	, mainSrc = $target.attr('src');

  		// $mainImage.attr('src', $target.attr('src'));
    // });

    $('#main-image').addimagezoom({ // single image zoom
  		zoomrange: [3],
  		magnifiersize: [600,600],
  		magnifierpos: 'right',
  		// cursorshade: true
  		//largeimage: 'hayden.jpg' //<-- No comma after last option!
  	});

  	$('[data-share-icon]').click( function (e) {
  		var imgSrcList = $(this).attr('src').split('.');
  		var newSrc = imgSrcList[0] + '-active.' + imgSrcList[1];
  		$(this).attr('src', newSrc);
  	})

  });

}


