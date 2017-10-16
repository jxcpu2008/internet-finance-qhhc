var red_id = '';   // 保存初始红包id
var redenve_check = $(".redenvelope .checkbox").html(); // 记录初始化显示红包的信息
var interest_id = '';   // 保存初始加息券id
var interest_check = $(".interest .checkbox").html(); // 记录初始化显示加息券的信息
/* 详情页图片窗 */
var LoanImages = function() {
	var triangleRight = '<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>';
	var e = {
		relatedTarget : null, // 上次邻近激活对象
		target : null
	// 当前激活对象
	};
	var resObj = { // 获取提示信息
		'result' : false,
		'alertInfo' : ''
	};
	var zcObj = []; // 投标类型
	var init = function() {
		$('#details').find('.nav-stacked').find('li:first').addClass('active')
				.append(triangleRight);
		$('#details').find('.pre-img').children('div:first').addClass(
				'in active').find('.item').first().addClass('active');
		$('#details').find('.pre-img').children('div:first').siblings().each(
				function() {
					$(this).find('.item').first().addClass('active');
				});
		// 弹出模态框
		$('#zcModal').on(
				'show.bs.modal',
				function() {
					zcObj = [];
					$('.get-involved').find('input[type="text"]').each(
							function() {
								var key = $(this).prop('name');
								var value = $(this).val();
								zcObj[key] = value;
							});

					var all = 0;
					for ( var k in zcObj) {
						switch (k) {
						case 'priority':
							if (zcObj[k]) {
								$(this).find('.modal-body li').eq(0)
										.removeClass('sr-only').find(
												'span[data-type="priority"]')
										.text(function() {
											return zcObj[k];
										}).parents('.col-sm-6').next().find(
												'span').text(
												$('#pincome').find('span')
														.text());
								$("#priorityh").val(zcObj[k]);
							}
							break;
						case 'sandwich':
							if (zcObj[k]) {
								$(this).find('.modal-body li').eq(1)
										.removeClass('sr-only').find(
												'span[data-type="sandwich"]')
										.text(function() {
											return zcObj[k];
										}).parents('.col-sm-6').next().find(
												'span').text(
												$('#mincome').find('span')
														.text());
								;
								$("#middleh").val(zcObj[k]);
							}
							break;
						case 'inferior':
							if (zcObj[k]) {
								$(this).find('.modal-body li').eq(2)
										.removeClass('sr-only').find(
												'span[data-type="inferior"]')
										.text(function() {
											return zcObj[k];
										});
								$("#afterh").val(zcObj[k]);
							}
							break;
						}
						/*$(this).find('.modal-body li').eq(3).removeClass(
						'sr-only');*/
						$(this).find('.modal-body li').eq(3).removeClass(
								'sr-only').find('span[data-type="all"]').text(
								function() {
									return all += Number(zcObj[k]);
								});
					}
					$('#zcModal').find('.modal-footer input:password').bind(
							'keyup', submitHandler);
					$('#zcModal').find('.modal-footer input:text').bind(
							'keyup', submitHandler);
					$('#zcModal').find('.modal-footer input:checkbox').bind(
							'click', submitHandler).prop('checked', true);
					$('#zcModal').find('button').eq(1).bind('click',
							function() {
								clearInvoled();
							});
				});
		// 隐藏模态框
		$('#zcModal').on(
				'hide.bs.modal',
				function() {
					$(this).find('.modal-body li').each(
							function() {
								$(this).find('span[data-type]').text('').end()
										.addClass('sr-only');
							});
					$(this).find('.modal-footer input').val('');
					$(this).find('.modal-footer input:checkbox').prop(
							'checked', false);
					$(this).find('button').eq(1).prop('disabled', true);
				});
		tabListener();
		eachCarousel();
		showTitle();
		checkListenerOnKeyup('.get-involved');
		clearInvoled();
		clearzcModal();
		$('input[data-id="feed-priority"]').popover();
		$('input[data-id="feed-sandwich"]').popover();
		$('input[data-id="feed-inferior"]').popover();
		
		// 红包列表模态框
		$('#packetsModal').on('show.bs.modal', function() {
			
		});
		$('#packetsModal').on('hidden.bs.modal', function() {
			
		});
	}
	var clearzcModal = function() {
		$('#zcModal').find('.modal-footer input').val('');
		$('#zcModal').find('.modal-footer input:checkbox').prop('checked',
				false);
		$('#zcModal').find('button').eq(1).prop('disabled', true);
	}
	var clearInvoled = function() {
		$('.get-involved').find('input[type="text"]').each(function() {
			$(this).val('');
			if ($(this).next().hasClass('glyphicon-remove')) {
				$(this).next().removeClass('glyphicon-remove');
			}
			if ($(this).next().hasClass('glyphicon-ok')) {
				$(this).next().removeClass('glyphicon-ok');
			}
		});
		$('.get-involved').find('button').prop('disabled', true);
	}
	var submitHandler = function() {
		if ($('#zcModal').find('.modal-footer input[type="password"]').val()
				&& $('#zcModal').find('.modal-footer input[type="text"]').val()
				&& $('#zcModal').find('.modal-footer input:checkbox').prop(
						'checked')) {
			$('#zcModal').find('button').eq(1).prop('disabled', false);
		} else {
			$('#zcModal').find('button').eq(1).prop('disabled', true);
		}
	}
	// 判断输入合法性
	var checkHandler = function(value, dom) {
		/*
		 * value为input对象的值, 类型为string 对象resObj两个属性(见以上定义)： 1. result:
		 * 返回value值的合法性，类型为boolean, 缺省为false 2. alertInfo ：返回提示信息，类型为string,
		 * 缺省为'输入正确的数字'
		 */
		if (!isNaN(value)) {
			var reg = /^(([1-9]+\.[0-9]*[1-9][0-9]*)|([1-9]*[1-9][0-9]*\.[0-9]+)|([1-9]*[1-9][0-9]*))$/;// 正数
			if (!reg.test(value)) {
				// 正数
				resObj.result = false;
				resObj.alertInfo = '只接受正数';
				$(dom).next().next().find('span').text("0");
			} else {
				var loanUnit = $("#loanUnit").val();
				var rate = $("#prioRate").val();// 优先加奖励
				var remonth = $("#remonth").val();// 借款期限
				if (Number(value) % Number(loanUnit) != 0) {
					resObj.result = false;
					resObj.alertInfo = loanUnit + '起投，倍数递增';
				} else {
					resObj.result = true;
					resObj.alertInfo = '正确';
					
					if ($(dom).prop('name') == 'priority') {
						// 添加红包信息
						$.ajax({
							url : '/loaninfo/redenvelope.htm',
							type : 'post',
							data : {
								proMoney : $("#priority").val()
							},
							success : function(data) {
								data = JSON.parse(data);
								//alert(data.packet + '--' + data.interest);
								// 红包
								$(".redenvelope").show();
								$(".redenvelope .checkbox").html(redenve_check);
								if (data.packet != '') {
									$("#changeRe").click(function(){
										$.ajax({
											url : '/loaninfo/changeCoupon.htm',
											type : 'post',
											data : {
												priority : $("#priority").val(),
												type : 1
											},
											success : function(data) {
												$("#redenve_list").html(data);
												$('#packetsModal').modal('show');
											}
										});
									}); // 绑定更换红包事件
									var str = data.packet.split(',');
									red_id = str[0];  // 设置红包id，避免关闭后id置空
									$("#redenve_id").val(red_id);  // 设置红包id
									$(".how-much").text(str[1]);   // 设置红包金额
									$("#isuse_redenve").attr("checked","checked");
								} else {
									$("#redenve_id").val('');  // 设置红包id为空
									$(".redenvelope").hide();
								}
								// 加息券
								$(".interest").show();
								$(".interest .checkbox").html(interest_check);
								if (data.interest != '') {
									$("#change_interest").click(function(){
										$.ajax({
											url : '/loaninfo/changeCoupon.htm',
											type : 'post',
											data : {
												priority : $("#priority").val(),
												type : 2
											},
											success : function(data) {
												$("#interest_list").html(data);
												$('#interestModal').modal('show');
											}
										});
									});// 绑定更换加息券事件
									var str = data.interest.split(',');
									interest_id = str[0];  // 设置红包id，避免关闭后id置空
									$("#interest_id").val(interest_id);  // 设置红包id
									$(".interest_rate").text(str[1]);   // 设置红包金额
									
									var isuse_redenve = $("#isuse_redenve");
									var isuse_interest = $("#isuse_interest");
									isuse_redenve.click(function(){
										if (isuse_redenve.is(":checked")) {
											isuse_interest.removeAttr("checked");
										}
									});
									isuse_interest.click(function(){
										if (isuse_interest.is(":checked")) {
											isuse_redenve.removeAttr("checked");
										}
									});
								} else {
									$("#interest_id").val('');  // 设置红包id为空
									$(".interest").hide();
								}
							}
						});
						$(dom).next().next().find('span').text(countGain(Number(value),rate, remonth));
					} else if ($(dom).prop('name') == 'sandwich') {
						$(dom).next().next().find('span').text( '0 ~ ' + countGain(Number(value),0.23, remonth));
					}
				}
			}

		} else {
			// 不合法的数字
			resObj.result = false;
			resObj.alertInfo = '不是合法的数字';
			$(dom).next().next().find('span').text("0");
		}
	}
	var alertPopover = function(obj) {
		if (resObj.result) {
			if ($(obj).next().hasClass('glyphicon-remove')) {
				$(obj).next().removeClass('glyphicon-remove');
			}
			$(obj).next().addClass('glyphicon-ok');
		} else {
			if ($(obj).next().hasClass('glyphicon-ok')) {
				$(obj).next().removeClass('glyphicon-ok');
			}
			$(obj).next().addClass('glyphicon-remove');
		}
		$('div[id^="popover"]').children('.popover-content').text(function() {
			return resObj.alertInfo;
		});
	}
	// 是否激活button
	var buttonToggle = function() {
		$('.get-involved').find('input[type="text"]').each(function() {
			if ($(this).next().hasClass('glyphicon-ok')) {
				$('.get-involved').find('button').prop('disabled', false);
			} else if ($(this).next().hasClass('glyphicon-remove')) {
				$('.get-involved').find('button').prop('disabled', true);
				return false;
			}
		});
		if (!$('.get-involved').find('span.glyphicon-ok').length
				&& !$('.get-involved').find('span.glyphicon-remove').length) {
			$('.get-involved').find('button').prop('disabled', true);
		}
	}
	// 绑定input键盘事件
	var checkListenerOnKeyup = function(obj) {
		var status = $('.get-involved').children('div:first').find('h4').attr(
				'data-status');
		if (status == 'offline') {
			return;
		}
		$(obj).find('input[type="text"]').bind('keyup', function() {
			if ($.trim($(this).val()) != '') {
				checkHandler($.trim($(this).val()), this);
				alertPopover(this);
			} else {
				if ($(this).next().hasClass('glyphicon-remove')) {
					$(this).next().removeClass('glyphicon-remove');
				}
				if ($(this).next().hasClass('glyphicon-ok')) {
					$(this).next().removeClass('glyphicon-ok');
				}
			}
			buttonToggle();
		});
		// 获取焦点
		/*
		 * $(obj).find('input[type="text"]').bind('blur', function() { if
		 * ($.trim($(this).val()) != '') { checkHandler($.trim($(this).val()),
		 * this); alertPopover(this); } });
		 */
	}
	/* 侧边Tab选项 */
	var eachTab = function(obj) {
		e.target = obj;
		$(obj).parent().siblings().each(function() {
			if ($(this).hasClass('active')) {
				e.relatedTarget = $(this).children().get(0);
				return false;
			}
		});
	}
	var tabListener = function() {
		$('#details').find('.nav-stacked').find('a[data-toggle="tab"]').bind(
				'click', function() {
					eachTab(this);
					$(e.relatedTarget).next().remove();
					if (!$(e.target).next('span').length) {
						if ($(window).width() < 1170) {
							$(e.target).parent().append(triangleRight).find('span').css('left', '95px');
					    } else {
					    	$(e.target).parent().append(triangleRight);
					    }
					}
				});
	}
	var eachCarousel = function() {
		$('#details').children('ul').find('li')
				.each(
						function() {
							var id = String($(this).find('a').prop('href'))
									.split('#')[1];
							var items = $('#' + id).children('div').carousel({
								interval : false
							}).find('.item');
							if (items.length < 4) {
								$('#' + id).children('div').children(
										'a.carousel-control').prop('disabled',
										true).click(function(event) {
									event.preventDefault();
								});
							}
							cloneItems(items);
						});
	}
	/* 显示图片主题 */
	var showTitle = function() {
		$('.pre-img').on('click', 'a:not(.carousel-control)', function(event) {
			event.preventDefault();
		});
		$('.pre-img').find('a:not(.carousel-control)').hover(function() {
			$(this).find('span').stop(true).slideDown('fast');
		}, function() {
			$(this).find('span').stop(true).slideUp('fast');
		});
		$('.preview').on(
				'show.bs.modal',
				function(e) {
					var imgUrl = $(e.relatedTarget).find('img').prop('src');
					var title = $(e.relatedTarget).find('span').text();
					$(e.target).find('.modal-body').children('img').prop('src',
							imgUrl);
					$(e.target).find('.modal-title').text(function() {
						return title;
					})
				});
	}
	/* 克隆图片 */
	var cloneItems = function(obj) {
		if (obj.length == 0 || obj.length == 1) {
			return;
		} else {
			$(obj).each(
					function() {
						var next = $(this).next();
						if (!next.length) {
							next = $(this).siblings(':first');
						}
						next.children(':first-child').clone(true, true)
								.appendTo($(this));
						if (obj.length == 2) {
							return false;
						}
						if (next.next().length > 0) {
							next.next().children(':first-child').clone(true,
									true).appendTo($(this));
						}
						if (obj.length == 3) {
							return false;
						}
						if (!next.next().length) {
							$(this).siblings(':first').children(':first-child')
									.clone(true, true).appendTo($(this));
						}
					});
		}
	}
	return {
		'init' : init
	};
}();
/* 项目历程时间轴 */
var Timeline = function() {
	var firstLiTop = $('#history').find('li').first().offset();
	var lastLiTop = $('#history').find('li').last().offset();
	var timelineLenght = 0;
	if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
		timelineLenght = lastLiTop.top - firstLiTop.top - 150;
	} else {
		timelineLenght = lastLiTop.top - firstLiTop.top;
	}
	var onTimeline = function() {
		$('.time-vline').css({
			'height' : function() {
				return timelineLenght;
			}
		});
		$('#history').removeClass('active');
	}
	return {
		'onTimeline' : onTimeline
	}
}();

// 计算收益
function countGain(loanMoeny, rate, remonth) {
	var loanType = $("#loanType").val();
	var result = null;
	if (loanType == 2) {
		result = ((parseInt(loanMoeny) * rate) / 12) * remonth;// 普通众持
	} else {
		result = ((parseInt(loanMoeny) * rate) / 360) * remonth;// 天标众持
	}
	return result.toFixed(2);
}
