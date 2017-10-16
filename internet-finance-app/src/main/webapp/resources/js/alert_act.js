$(function() {
	$('body').append('<div class="act"></div>');
	setTimeout(
			function() {
				var active = '<div class="act-x"></div><a href="/visitor/toOpenActivity.htm" target="_blank"><img src="/resources/images/main/active/ccc_04.png" /></a>';
				$('body').append('<div id="act_bg" style="background:rgb(0, 0, 0);filter:alpha(opacity=50);"></div>');
				$('.act').append(active).fadeIn('slow');
			}, 1000);
	$('body').on('click', '.act-x', function() {
		$('.act').fadeOut('slow', function() {
			$(this).remove();
		});
		$('#act_bg').fadeOut('slow', function() {
			$(this).remove();
		});
	});
	$('.act').on('click', 'a', function() {
		$('.act, #act_bg').remove();
	});
});