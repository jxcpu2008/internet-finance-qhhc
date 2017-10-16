var Signup = function() {
	var init = function() {
		$('input[data-id="username"]').popover();
		$('input[data-id="passwd"]').popover();
		$('input[data-id="repasswd"]').popover();
		$('input[data-id="phone"]').popover();
		$('input[data-id="invited-code"]').popover();
		$('input[data-id="img-code"]').popover();
		phoneCode(); // 手机验证码
		imgCode();	 // 验证码
		bindEvent('input[data-id="username"]');
		bindEvent('input[data-id="passwd"]');
		bindEvent('input[data-id="repasswd"]');
		bindEvent('input[data-id="phone"]');
		bindEvent('input[data-id="invited-code"]');
		bindEvent('input[data-id="img-code"]');
	}
	var fixPositionByOthers = function(obj) {
		var top = $(obj).parents('.form-group').position().top
				- $(obj).height() / 4;
		var left = $(obj).parents('.form-group').position().left
				+ $(obj).parents('.form-group').width() * 0.56;
		return {
			'top' : top,
			'left' : left
		}
	}
	var removeOK = function(obj) {
		if ($(obj).next().hasClass('glyphicon-ok')) {
			$(obj).next().removeClass('glyphicon-ok');
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
		var errorTpl = '<div class="popover right" role="tooltip" style="top:'
				+ pos.top
				+ 'px;left:'
				+ pos.left
				+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">'
				+ error + '</div></div>';
		return errorTpl;
	}
	
	var getNameInfo = function(name) {
		var obj = 'input[data-id="invited-code"]';
		pos = fixPositionByOthers(obj);
		var errorTpl = setPopover(pos, name);
		setNameInfo(obj, errorTpl);
	}
	var setNameInfo = function(obj, errorTpl) {
		$(obj).parents('.form-group').append(function() {
			$(obj).parent().find('div.popover').remove();
			return errorTpl;
		});
	}
	var getErrorInfo = function(error, n) {
		/*
		 * n=1, 用户名 n=2, 密码 n=3, 二次密码 n=4, 手机 n=5, 推荐码 n=6, 手机验证码,n=7,图片验证码
		 * error='',信息正确
		 */
		var obj = '';
		var pos = null;
		switch (n) {
		case 1:
			obj = 'input[data-id="username"]';
			break;
		case 2:
			obj = 'input[data-id="passwd"]';
			break;
		case 3:
			obj = 'input[data-id="repasswd"]';
			break;
		case 4:
			obj = 'input[data-id="phone"]';
			break;
		case 5:
			obj = 'input[data-id="invited-code"]';
			$('#invited-code').collapse('show');
			$('#invited-code').on('hide.bs.collapse', function() {
				if ($(this).next('div.popover').length) {
					$(this).next('div.popover').remove();
					$(this).find('span.glyphicon-remove').remove();
				}
			});
			if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
				$(obj).parents('.form-group').find('div.popover.right').css(
						'margin-top', '4px');
			}
			break;
		case 6:
			obj = 'input[data-id="phone-code"]';
			break;
		case 7:
			obj = 'input[data-id="img-code"]';
			break;
		}
		if (error) {
			pos = fixPositionByOthers(obj);
			var errorTpl = setPopover(pos, error);
			setErrorInfo(obj, errorTpl);
		} else {
			removeOK(obj);
			$(obj).next().addClass('glyphicon-ok');
		}
	}
	// 绑定控件事件
	var focusListener = function(obj) {
		if ($.trim($(obj).val())) {
			$(obj).popover('destroy');
		} else {
			removeOK(obj);
			removeX(obj);
			$(obj).parents('.form-group').find('div.popover').remove();
			$(obj).popover('show');
		}
	}
	var keyupListener = function(obj) {
		if ($.trim($(obj).val())) {
			$(obj).popover('destroy');
		} else {
			$(obj).popover('show');
		}
		removeOK(obj);
		removeX(obj);
		$(obj).parents('.form-group').find('div.popover').remove();
	}
	var bindEvent = function(obj) {
		$(obj).on({
			'focus' : function() {
				focusListener(this);
			},
			'keyup' : function() {
				keyupListener(this);
			}
		});
	}
	var phoneCode = function() {
		var pos = fixPositionByOthers('input[data-id="phone-code"]');
		var codeTpl = setPopover(pos, '请输入手机验证码');
		$('input[data-id="phone-code"]').on(
				{
					'focus' : function(event) {
						if (!$.trim($(this).val())) {
							removeOK(this);
							removeX(this);
							$(this).parents('.form-group').find('div.popover')
									.remove();
							$(this).parents('.form-group').append(codeTpl);
						}
					},
					'keyup' : function() {
						if (!$.trim($(this).val())) {
							$(this).parents('.form-group').append(codeTpl);
						} else {
							$(this).parents('.form-group').find('div.popover')
									.remove();
						}

					},
					'blur' : function() {
						$(this).parents('.form-group').find('div.popover')
								.remove();
					}
				});

	}
	var imgCode = function() {
		var pos = fixPositionByOthers('input[data-id="img-code"]');
		var codeTpl = setPopover(pos, '请输入验证码');
		$('input[data-id="img-code"]').on(
				{
					'focus' : function(event) {
						if (!$.trim($(this).val())) {
							removeOK(this);
							removeX(this);
							$(this).parents('.form-group').find('div.popover').remove();
							$(this).parents('.form-group').append(codeTpl);
						}
					},
					'keyup' : function() {
						if (!$.trim($(this).val())) {
							$(this).parents('.form-group').append(codeTpl);
						} else {
							$(this).parents('.form-group').find('div.popover')
									.remove();
						}

					},
					'blur' : function() {
						$(this).parents('.form-group').find('div.popover')
								.remove();
					}
				});

	}
	return {
		'init' : init,
		'getErrorInfo' : getErrorInfo,
		'getNameInfo' : getNameInfo
	}
}();