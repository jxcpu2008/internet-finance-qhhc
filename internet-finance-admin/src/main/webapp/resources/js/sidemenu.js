$(function() {

	$('.collapse').children('ul').children('li').children('a').bind('click',function(event) {
		event.preventDefault();
	});
	$('.collapse-list').children('li').children('a').bind('click',function(event) {
		if ($(this).next('ul').length > 0) {
			event.preventDefault();
		}
	});

	/* 侧边菜单 */
	$('.collapse').on('click','a',function(event) {
		//event.preventDefault();
		if ($(this).parent('li').parent('ul').hasClass('collapse-list')) {
			if (!$(this).parent('li').hasClass('active')) {
				$(this).parent('li').addClass('active').siblings('li').each(function() {
					if ($(this).hasClass('active')) {
						$(this).removeClass('active');
						return false;
					}
				});
			}
		} else {
			if (!$(this).parent('li').hasClass('active')) {
				$(this).next().slideDown('400').parent('li').addClass('active').siblings('li').each(function() {
					if ($(this).hasClass('active')) {
						$(this).children('ul').slideUp('400').parent('li').removeClass('active');
						
						return false;
					}
				});
			}
			$(this).prev('i').removeClass('center-icon-down').addClass('center-icon-left');
			$(this).parent('li').siblings('li').each(function() {
				if ($(this).children('i').eq(1).hasClass('center-icon-left')) {
					$(this).children('i').eq(1).removeClass('center-icon-left').addClass('center-icon-down');
					return false;
				}
			});
		}
	});

	$('.collapse-list>li').on({
		'click' : function() {
			$(this).children('ul.collapse-items').fadeIn('fast');
		}/*
			 * , 'mouseleave': function() {
			 * $(this).children('ul.collapse-items').fadeOut('fast'); }
			 */
	});

	/*
	 * $('.collapse-items').on('click', 'a', function(event) {
	 * event.stopImmediatePropagation();
	 * $(this).parents('ul.collapse-items').parent('li').addClass('active').siblings('li').each(function() {
	 * if ($(this).hasClass('active')) {
	 * $(this).removeClass('active').children('li').each(function() {
	 * $(this).removeClass('active'); }); } });
	 * $(this).parents('ul.collapse-items').hide(); });
	 */

	/* 遮罩层 */
	$('.img-list>ul>li').bind({
		'mouseenter' : function() {
			$(this).css('position', 'relative');
			$(this).children('.mark').css('visibility', 'visible');
		},
		'mouseleave' : function() {
			$(this).removeAttr('style');
			$(this).children('.mark').css('visibility', 'hidden');
		}
	}).children('.mark').bind('click', function() {
		$(this).prev('a').find('img').trigger('click');
	});

	/* 信息列表 */
	$('#all').bind('click',function() {
		if ($(this).prop('checked')) {
			$('.env-list').find('input[type="checkbox"]').prop('checked', true);
		} else {
			$('.env-list').find('input[type="checkbox"]').prop('checked', false);
		}
	});
	$('.env-list').find('.check-box>input[type="checkbox"]').bind('click',function() {
		if ($(this).prop('checked')) {
			$('.env-list tbody').find('input[type="checkbox"]').prop('checked', true);
			$('#all').prop('checked', true);
		} else {
			$('.env-list tbody').find('input[type="checkbox"]').prop('checked', false);
			$('#all').prop('checked', false);
		}
	});

	/* 众筹下拉列表列表 */
	$('.dropmenu').on('click', 'a', function(event) {
		event.preventDefault();
		$(this).next().fadeToggle();
	});
	$('.dropmenu-list').on('click', 'a', function() {
		$('.dropmenu-list').fadeToggle();
	});
	$('.dropmenu-list').bind('mouseleave', function() {
		$('.dropmenu-list').fadeOut();
	});

	/* 文件上传 */
	$('.browse, .upload-head').on('click', 'a', function(event) {
		event.preventDefault();
		$('input:file').trigger('click');
	});
	/* 个人中心推荐 */
	$('.cre-tips').tooltip();
	
	/* 自动投标 */
	$('.tendering-form').on('click', 'input:radio', function() {
		if ($(this).parent('label').siblings('input[type=text]').length > 0) {
			$(this).parent('label').siblings('input[type=text]').each(function() {
				if ($(this).prop('disabled')) {
					$(this).prop('disabled', false);
				}
			});
		} else {
			$(this).parents('li').siblings().each(function() {
				if (!$(this).find('input[type=text]').prop('disabled')) {
					$(this).find('input[type=text]').prop('disabled', true);
				}
			});
		}
	});
	function setEmpty() {
		$('#tenderingModal').find('input[type=text]').val('').end().find('input[type=text]:not(:first)').prop('disabled', true).end().find('input[type=radio]:even').prop('checked', true).end().find('input[type=radio]:odd').prop('checked', false).end().find('input[type=checkbox]').prop('checked', false);
		$('#tenderingModal').find('.tip-sm').text('');
	}
	setEmpty();
	$('#tenderingModal').on('hidden', function () {
		setEmpty();
	});
});