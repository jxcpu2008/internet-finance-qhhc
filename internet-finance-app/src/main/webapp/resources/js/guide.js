$(function() {
	// 融资人步骤
	var step1_obj = {
		step_no : 3,
		circle : 'sm',
		bg_color : 'white-bg-2',
		text : '同步用户授权',
		words_no : 3,
		btn : 'goon'
	};
	var step3_obj = {
		step_no : 1,
		circle : 'sm',
		bg_color : 'red-bg',
		text : '融资人认证',
		words_no : 1,
		btn : 'quit'
	};
	// 投资人
	var step2_obj = {
		step_no : 2,
		circle : 'lg',
		bg_color : 'white-bg-1',
		text : '实名认证&nbsp;&nbsp;&nbsp;同步注册宝付',
		words_no : 2,
		btn : 'quit'
	};

	var step_func = function(step_obj, guide_id) {
		var tips = '<li class="pull-right" style="color:#fff;margin-top:20px;"><label style="display:inline;"><input type="checkbox" id="isPrompt" style="margin-top:0;margin-right:5px;">不再提示</label></li>';
		tips = step_obj.step_no == 3 ?  '' : tips;
		var step_div = '<div id="step_'
				+ step_obj.step_no
				+ '"><ul class="unstyled"><li class="clearfix"><div class="step-'
				+ step_obj.circle
				+ ' pull-right"></div><div class="step-title '
				+ step_obj.bg_color
				+ '">'
				+ step_obj.text
				+ '</div></li>'
				+ '<li class="step-words"><div class="words-'
				+ step_obj.words_no
				+ '"></div></li><li class="clearfix"><ul class="unstyle inline"><li class="clearfix"><div class="'
				+ step_obj.btn
				+ '"></div></li>' + tips + '</ul></li></ul></div>';
		$(guide_id).html(step_div);
	}
	// 继续
	$('#new_guide').on('click', '.goon', function() {
		if ($('#new_guide').children('div').length > 0) {
			$('#new_guide').children('div').fadeOut('400', function() {
				step_func(step3_obj, '#new_guide');
			});
		}
	});
	// 退出介绍
	$('#new_guide').on('click', '.quit', function() {
		$('#new_guide').children('div').fadeOut('slow', function() {
			$(this).remove();
		}).end().fadeOut('slow', function() {
			$('html').css('overflow-y', 'auto');
		});
		var isPrompt = $("#isPrompt").is(":checked");
		var promptVal = $("#isPromptVal").val();
		if (promptVal != 1 && isPrompt) {
			$.ajax({
				url : '/member_index/isPrompt.htm?isPrompt=1',
				success : function() {
				}
			});
		}
	});

	// step2_obj: 投资人
	// step1_obj: 融资人
	var $isCreditor = $("#isCreditor").val();// 初始类型
	var $isAuthIps = $("#isAuthIps").val();// 同步授权
	var iscrowdhold = $("#iscrowdhold").val();// 是否融资人
	var pMerBillNo = $("#pMerBillNo").val();// 宝付
	var $cardStatus = $("#cardStatus").val();// 实名认证
	var $isPrompt = $("#isPromptVal").val();// 是否提示
	var flag = String(window.location.href).split("&")[1];
	if (flag != undefined) {
		flag = flag.split('=')[0];
	}
	if (flag != "stta" || flag == undefined) {
		if ($isPrompt != 1) {
			if ($isCreditor == 1) {
				if ($cardStatus != 2 || pMerBillNo == "") {
					$('#new_guide').fadeIn('slow', function() {
						$('html').css('overflow-y', 'hidden');
						step_func(step2_obj, '#new_guide');
					});
				} else {
					$('html').css('overflow-y', 'auto');
				}
			} else if ($isCreditor == 2) {
				if ($isAuthIps != 1 || iscrowdhold == 0) {
					$('#new_guide').fadeIn('slow', function() {
						$('html').css('overflow-y', 'hidden');
						step_func(step1_obj, '#new_guide');
					});
				} else {
					$('html').css('overflow-y', 'auto');
				}
			}
		}
	}

});