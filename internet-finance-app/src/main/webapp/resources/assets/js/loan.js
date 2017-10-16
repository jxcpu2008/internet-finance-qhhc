$(function() {
	ProcessCircle.drawProcess('.autox110');
	$('span[data-id="fm"]').each(function() {
    	$(this).text($.fmByComma($.trim($(this).text())));
    });
	if ($(window).width() < 1170) {
		$('.theme').css({
			'width': '45%',
			'margin-bottom': '10px'
		}).last().removeClass('text-right');
	}
});