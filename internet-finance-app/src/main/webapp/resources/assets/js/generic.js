$(function() {
	var queryStr = QueryURI.getQuery();
	if (queryStr) {
		$('nav').find('li').eq(Number(queryStr['nav']) - 1).addClass('active');
	}
	Home.init();
	$('span[data-id="fm"]').each(function() {
    	$(this).text($.fmByComma($.trim($(this).text())));
    });
	$('a[data-id="modifyDot"], h3[data-id="modifyDot"], li[data-id="modifyDot"]').each(function() {
		$(this).html($.trim($(this).text()).replace(' ﹒', ' &bull; '));
	});
	// 站长统计
	$('a[title=站长统计]')
			.html(
					'<img style="position:absolute;left:50%;margin-top:-32px;margin-left:-411px;" src="https://icon.cnzz.com/img/pic1.gif">');

});
