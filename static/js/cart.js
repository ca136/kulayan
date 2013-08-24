$(document).ready({

	var cart = window.data.cart || {};
	cart.cartItems = cart.cartItems || {};
	var cartFields = ['cartItems', 'user', 'expiration'];

	$('[data-add-to-cart]').click( function (e) {
		var $target = $(e.currentTarget);
		cartItem = cart.cartItems[$target.attr('data-id')];
		cartItem =  cartItem ? cartItem + 1 : 1;
	});

	$('[data-checkout]').click( function (e) {
		var $target = $(e.currentTarget);
	});

});