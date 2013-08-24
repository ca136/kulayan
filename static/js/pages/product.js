
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

  $('.product-thumbnail').click( function (e) {
		var $target = $(e.currentTarget)
			, $mainImage = $('#main-image')
			, targetSrc = $target.attr('src')
			, mainSrc = $target.attr('src');

		$mainImage.attr('src', $target.attr('src'));
  });

  $('#main-image').addimagezoom({ // single image zoom
		zoomrange: [3],
		magnifiersize: [600,600],
		magnifierpos: 'right',
		cursorshade: true
		//largeimage: 'hayden.jpg' //<-- No comma after last option!
	});

	$('[data-share-icon]').click( function (e) {
		var imgSrcList = $(this).attr('src').split('.');
		var newSrc = imgSrcList[0] + '-active.' + imgSrcList[1];
		$(this).attr('src', newSrc);
	})

});

