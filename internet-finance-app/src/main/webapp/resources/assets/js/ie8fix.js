$(function() {
	/* 取消圆环 */
    $('img').each(function() {
        if ($(this).hasClass('img-circle')) {
            $(this).removeClass('img-thumbnail');
        }
    });
    /* 绘画投标类型小图标 */
    InvestIcon.initIconForIE8();
    /* 小图标完全展现 */
	$('.priority, .sandwich, .inferior').children('div').css({
		'overflow': 'visible',
		'display': 'inline-block',
		'margin-right': '4px',
		'top': '3px'
	});
	/* 可视区域小于1200时，ie8正确换行显示 */
	/*RespondForIE8.respondView();
	$(window).resize(function() {
		RespondForIE8.respondView();
	});*/
	/* 详情页Tab */
	$('.proj-desc>ul>li').find('a').hover(function() {
		if (!$(this).parent().hasClass('active')) {
			$(this).css({
				'background-color': '#d9534f',
				'color': '#fff'
			});
		}
	}, function() {
		$(this).css({
			'background-color': '#fff',
			'color': '#333'
		});
	});
	// 注册
	$('a[data-name="invited-code"]').bind('click', function() {
		//$(this).parents('.form-group').prev().find('div').css('width', '19%');
	});
}); 