$(function() {
    Mask.init();
    TranslateWord.init();
    $('#info').find('h3').each(function() {
    	$(this).text($.fmByComma($.trim($(this).text())));
    });
    if ($(window).width() < 1170) {
    	$('.newspub>section').first().css('width', '66%');
    	$('#products').find('.item').first().children().last().clone(true).prependTo('.item:last');
        $('#products').find('.item').first().children().last().remove();
        $('#products').find('.item').last().children().last().remove();
        $('.product-info').css('width', '30%');
    }
});