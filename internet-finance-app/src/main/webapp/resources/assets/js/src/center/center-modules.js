var NavCenter = function() {
	var init = function() {
		$('.nav-right').css('min-height', function() {
			return $('.nav-left').height();
		});

		$('a[data-id="vcard"]').popover();
		$('a[data-id="phone"]').popover();
		$('a[data-id="envelope"]').popover();
		$('a[data-id="baofu"]').popover();
		bindEvent('input[data-id="email"]');
		bindEvent('input[data-id="phone"]');
		bindEvent('input[data-id="phone-code"]');
		bindEvent('input[data-id="trade-code"]');
		bindEvent('input[data-id="origin-passwd"]');
		bindEvent('input[data-id="new-passwd"]');
		bindEvent('input[data-id="renew-passwd"]');
		bindEvent('input[data-id="new-trade-passwd"]');
		bindEvent('input[data-id="renew-trade-passwd"]');
		bindEvent('input[data-id="verifyCode"]');

		$('.nav-right div.collapse').on('show.bs.collapse', function(e) {
			$(e.target).children('div.panel-body').css({
				'padding-top' : '30px'
			});
		});
		// 开通宝付模态框
		$('input[data-id="baofu-name"]').popover();
		$('input[data-id="baofu-phone"]').popover();
		$('input[data-id="baofu-id"]').popover();
	}
	var fixPositionByOthers = function(obj) {
		var top = $(obj).parents('.form-group').position().top - $(obj).height() / 4;
		var left = $(obj).parents('.form-group').position().left + $(obj).parents('.form-group').width() * 0.49;
		return {
			'top' : top,
			'left' : left
		}
	}
	var removeX = function(obj) {
		if ($(obj).next().hasClass('glyphicon-remove')) {
			$(obj).next().removeClass('glyphicon-remove');
		}
	}
	// 回调函数，提示错误消息
	var setErrorInfo = function(obj, errorTpl) {
		removeX(obj);
		$(obj).next().addClass('glyphicon-remove');
		$(obj).parents('.form-group').append(function() {
			$(obj).parent().find('div.popover').remove();
			return errorTpl;
		});
	}
	// 提示冒泡模板
	var setPopover = function(pos, error) {
		var errorTpl = '<div class="popover right" role="tooltip" style="top:' + pos.top + 'px;left:' + pos.left + 'px;display:block;"><div class="arrow"></div><div class="popover-content">' + error + '</div></div>'; 
		return errorTpl;
	}
	var getErrorInfo = function(error, n) {
		/*
		 * n=1, 新邮箱地址
		 * n=2, 新手机号码
		 * n=3, 短信验证码
		 * n=4, 交易密码
		 * n=5, 原登录密码
		 * n=6, 新登录密码
		 * n=7, 确认新登录密码
		 * n=8, 新交易密码
		 * n=9, 确认新交易密码
		 * n=10, 短信验证码
		 */
		var obj = '';
		var pos = null;
		switch (n) {
			case 1: 
				obj = 'input[data-id="email"]';
				break;
			case 2: 
				obj = 'input[data-id="phone"]';
				break;
			case 3: 
				obj = 'input[data-id="phone-code"]';
				break;
			case 4: 
				obj = 'input[data-id="trade-code"]';
				break;
			case 5: 
				obj = 'input[data-id="origin-passwd"]';
				break;
			case 6: 
				obj = 'input[data-id="new-passwd"]';
				break;
			case 7: 
				obj = 'input[data-id="renew-passwd"]';
				break;
			case 8: 
				obj = 'input[data-id="new-trade-passwd"]';
				break;
			case 9: 
				obj = 'input[data-id="renew-trade-passwd"]';
				break;
			case 10: 
				obj = 'input[data-id="verifyCode"]';
				break;
		}
		pos = fixPositionByOthers(obj);
		var errorTpl = setPopover(pos, error);
		setErrorInfo(obj, errorTpl);
	}
	// 绑定控件事件
	var focusListener = function(obj) {
		if (!$.trim($(obj).val())) {
			removeX(obj);
			$(obj).parents('.form-group').find('div.popover').remove();
		}
	}
	var keyupListener = function(obj) {
		removeX(obj);
		if ($(obj).parents('.form-group').find('div.popover').length) {
			$(obj).parents('.form-group').find('div.popover').remove();
		}
		
	}
	var blurListener = function(obj) {
		if ($(obj).parents('.form-group').find('div.popover').length) {
			removeX(obj);
			$(obj).parents('.form-group').find('div.popover').remove();
		}
	}
	var bindEvent = function(obj) {
		$(obj).on({
			'focus': function() {
				focusListener(this);
			},
			'keyup': function() {
				keyupListener(this);
			},
			'blur': function() {
				blurListener(this);
			}
		});
	}
	var select_index = function() {
		var vertical_line = '<span class="vertical-line"></span>';
		var queryStr = QueryURI.getQuery();
		if (queryStr) {
			var index_arr = queryStr['index'].split('_');
			$(".nav-left .list-group-item").removeClass("visited").find('.vertical-line').remove();
			$(".nav-left .panel-default").eq(index_arr[0]).find("li").eq(index_arr[1]).addClass("visited").prepend(vertical_line);
			if (index_arr[2] == 1) {   // 跳转到绑定邮箱
				$("#envelope-binding").collapse('show');
				$(window).scrollTop(396);
			} else if (index_arr[2] == 2) {  // 跳转到交易密码
				$("#paypasswd").collapse('show');
				$(window).scrollTop(600);
			} else if (index_arr[2] == 3) {  // 弹出开通宝付alert
				$("#open_bf").trigger('click');
			}
		}
		$(".nav-left .list-group-item").hover(function() {
			if (!$(this).hasClass('visited')) {
				$(this).addClass('visited').prepend(vertical_line);
			}
		}, function() {
			$(this).removeClass("visited").find('.vertical-line').remove();
			$(".nav-left .panel-default").eq(index_arr[0]).find("li").eq(index_arr[1]).addClass("visited").prepend(vertical_line);
		});
	}
	var step_line = function() {
		if (typeof $('.step-line').get(0) === 'undefined') {
			return;
		}
		var first_left = $('.step-line').next().children().first().offset().left;
		var last_left = $('.step-line').next().children().last().offset().left;
		var li_len = $('.step-line').next().children().first().width();
		$('.step-line').css({
			'width': last_left - first_left,
			'margin-left': li_len / 2
		});
	}
	return {
		'init' : init,
		'select_index' : select_index,
		'getErrorInfo': getErrorInfo,
		'step_line': step_line
	};
}();