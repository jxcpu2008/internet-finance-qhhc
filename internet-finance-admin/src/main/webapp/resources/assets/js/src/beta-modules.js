/* 产品列表 bugs */
var ProductsCarousel = function() {
	var obj = null;
	// 初始化为一行4个展品
	var cloneProducts = function(obj) {
		if ($(obj).find('.item').length < 5) {
			return;
		}
		$(obj).find('.item').each(function (index) {
	        var next = $(this).next();
	        if (!next.length) {
	            next = $(this).siblings(':first');
	        }
	        next.children(':first-child').clone(true, true).appendTo($(this));
	        if (!next.next().length) {
	            next = $(this).siblings(':first');
	            next.children(':first-child').clone(true, true).appendTo($(this));
	        } 
	        next.next().children(':first-child').clone(true, true).appendTo($(this));
	        
	        if (index != 5) {
	            if (next.next().next().length > 0) {
	                next.next().next().children(':first-child').clone(true, true).appendTo($(this));
	            }
	            else {
	                $(this).siblings(':first').children(':first-child').clone(true, true).appendTo($(this));
	            }
	        }
	    });
	}
	return {
		'cloneProducts': cloneProducts
	};
} ();