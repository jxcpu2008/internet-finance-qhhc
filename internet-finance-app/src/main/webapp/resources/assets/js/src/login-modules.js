var Login = function() {
	var init = function() {
		$('input[data-id="login-man"]').popover();
		$('input[data-id="login-passwd"]').popover();
		getUser();
		setPasswd();
		setVercode();
	}
	var alertError = function(error, top, left) {
		return '<div class="popover right" role="tooltip" style="top:'
				+ top
				+ 'px;left:'
				+ left
				+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">'
				+ error + '</div></div>';
	}
	/**
	 * ********************************* 用户校验 start
	 * ********************************************
	 */
	var user_exist = function(value) {
		/**
		 * error 类型缺省为字符串 1.错误，返回错误提示信息 2.正确， 返回空字符串
		 */

		var error = checkOnly(value) == '[null,true]' ? '用户不存在' : '';
		return error;
	}

	var checkOnly = function(value) {

		return $.ajax({
			url : '/registration/checkOnly_username',
			data : {
				fieldValue : value
			},
			type : 'post',
			async : false
		}).responseText;

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
	var fixPosition = function(obj) {
		var top = $(obj).offset().top + $(obj).height() / 2;
		var left = $(obj).offset().left + $(obj).width();
		return {
			'top' : top,
			'left' : left
		}
	}
	var getUser = function() {
		var error = '';
		$('input[data-id="login-man"]').on(
				{
					'focus' : function() {
						if ($.trim($(this).val())) {
							$(this).popover('destroy');
						} else {
							$(this).parents('.login').find('div.popover').remove();
							removeX(this);
						}
					},
					'keyup' : function() {
						if ($.trim($(this).val())) {
							$(this).popover('destroy');
						} else {
							$(this).popover('show');
							removeOK(this);
							removeX(this);
							$(this).parents('.login').find('div.popover').remove();
						}
					},
					'blur' : function() {
						if (!$.trim($(this).val())) {
							removeOK(this);
							removeX(this);
							return;
						} else {
							error = user_exist($.trim($(this).val()));
							var pos = fixPosition(this);
							if (!error) {
								removeX(this);
								$(this).next().addClass('glyphicon-ok').css({
									'top' : '100px',
									'right' : '15px'
								});
								$(this).parents('.login').find('div.popover').remove();
								return;
							} else {
								removeOK(this);
								$(this).next().addClass('glyphicon-remove')
										.css({
											'top' : '100px',
											'right' : '15px'
										});
								$(this).parents('.login')
										.append(
												function() {
													$(this).parents('.login').find(
															'div.popover')
															.remove();
													return alertError(error,
															pos.top - 13 + $(this).parents('.panel-default').height() / 2,
															pos.left + 26 + $(this).parents('.panel-default').width());
												});
							}
						}
					}
				});
	}
	/**
	 * *********************************** 用户校验 end
	 * ******************************************
	 */
	/**
	 * *********************************** 密码校验 star
	 * ******************************************
	 */
	var setPasswd = function() {
		$('input[data-id="login-passwd"]').on({
			'keyup' : function() {
				if ($.trim($(this).val())) {
					$(this).popover('destroy');
					$(this).parents('.login').find('div.popover').remove();
				} else {
					$(this).popover('show');
				}
				removeX(this);
			},
			'focus' : function() {
				if ($.trim($(this).val())) {
					$(this).popover('destroy');
				} else {
					$(this).parents('.login').find('div.popover').remove();
					removeX(this);
					$(this).popover('show');
				}
			}
		});
	}
	// 回调函数，提示错误消息
	var getErrorInfo = function(error, n) {
		/*
		 * n=0 用户名为空，n=1, 密码错误 n=2, 验证码错误
		 */
		if (!error) {
			return;
		}
		var pos = null;
		switch (n) {
		case 0:
			removeX('input[data-id="login-man"]');
			pos = fixPosition('input[data-id="login-man"]');
			$('input[data-id="login-man"]').next().addClass('glyphicon-remove')
					.css({
						'top' : '100px',
						'right' : '15px'
					});
			$('input[data-id="login-man"]').parents('.login').append(
					function() {
						$('input[data-id="login-man"]').parents('.login').find(
								'div.popover').remove();
						return alertError(error, pos.top - 13, pos.left + 26);
						//return alertError(error, pos.top, pos.left);
					});
			break;
		case 1:
			removeX(':password');
			pos = fixPosition(':password');
			$(':password').next().addClass('glyphicon-remove').css({
				'top' : '176px',
				'right' : '15px'
			});
			$(':password').parents('.login').append(function() {
				$(':password').parents('.login').find('div.popover').remove();
				return alertError(error, pos.top - 13, pos.left + 26);
				//return alertError(error, pos.top, pos.left);
			});
			break;
		case 2:
			removeX('.vercode');
			pos = fixPosition('.vercode');
			$('.vercode').next().addClass('glyphicon-remove').css({
				'top' : '248px',
				'right' : '192px'
			});
			$('.vercode').parents('.login')
					.append(
							function() {
								$('.vercode').parents('.login').find('div.popover')
										.remove();
								return '<div class="popover right" role="tooltip" style="top:'
										+ (pos.top - 13)
										+ 'px;left:'
										+ (pos.left + 26 + 65)
										+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">'
										+ error + '</div></div>';
								/*return '<div class="popover right" role="tooltip" style="top:'
								+ pos.top
								+ 'px;left:'
								+ pos.left
								+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">'
								+ error + '</div></div>';*/
							});
			break;
		}

	}
	/**
	 * *********************************** 密码校验 end
	 * ******************************************
	 */
	/**
	 * *********************************** 验证码校验 start
	 * ******************************************
	 */
	var setVercode = function() {
		var pos = fixPosition($('input[data-id="login-vercode"]'));
		var codeTpl = '<div class="popover right" role="tooltip" style="top:'
				+ (pos.top - 13)
				+ 'px;left:'
				+ (pos.left + 26 + 65)
				+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">请输入验证码</div></div>';

		$('input[data-id="login-vercode"]').on({
			'keyup' : function() {
				if (!$.trim($(this).val())) {
					$(this).parents('.login').children('div.popover').remove();
					$(this).parents('.login').append(codeTpl);
				} else {
					if ($(this).parents('.login').children('div.popover').length > 0) {
						$(this).parents('.login').children('div.popover').remove();
					}
				}
				removeX(this);
			},
			'focus' : function() {
				if (!$.trim($(this).val())) {
					if ($(this).parents('.login').children('div.popover').length > 0) {
						$(this).parents('.login').children('div.popover').remove();
					}
					$(this).parents('.login').append(codeTpl);
				}
				
			},
			'blur' : function() {
				$(this).parents('.login').children('div.popover').remove();
			}
		});
	}
	/**
	 * *********************************** 验证码校验 end
	 * ******************************************
	 */
	return {
		'init' : init,
		'getErrorInfo' : getErrorInfo
	};
}();