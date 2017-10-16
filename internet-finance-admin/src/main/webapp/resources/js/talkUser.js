$(function(){
	var tophtml='<a class="chat icon-chat chat-qq" href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODAwODY4MV8yMzgxNDhfNDAwODAyODk5OV8yXw" target="_blank"></a>' +
					'<div class="chat icon-chat chat-wechat">' +
						'<div class="ewm-wrap"><div class="ewm"></div><p>扫描二维码 关注前海红筹</p></div>' +
					'</div>' +
					'<a class="chat icon-chat chat-help" href="/helper/toHelper.htm" target="_blank"></a>' +
					'<a class="chat icon-chat chat-calculate" role="button" data-toggle="modal" href="#calculateModal"></a>' +
					'<div class="chat icon-chat chat-top"></div>';
	$('#top').html(tophtml);
	$('.chat-wechat').hover(function() {
		$(this).find(".ewm-wrap").stop();
		$(this).find(".ewm-wrap").fadeIn("fast");
	}, function() {
		$(this).find(".ewm-wrap").stop();
		$(this).find(".ewm-wrap").fadeOut("fast");
	});
	/* 计算器  */
	$('.chat-calculate').bind('click', function(event) {
		event.preventDefault();
	});
	
	$.data(document.body, 'loanType', '2');
	$('#calculateModal').on('click', 'input[type=radio]', function() {
		$.data(document.body, 'loanType', $(this).val()); // 投标类型
		switch($.data(document.body, 'loanType')) {
			case '1':	// 短期
				$('.date').text('天');
				break;
			case '2':	// 普通
				$('.date').text('个月');
				break;
		}
	});
	$('#calculateModal').on('hidden', function () {
		$(this).find('input[type=text]').val('').end().find('input[type=radio]').first().prop('checked', true);
		$('.date').text('个月');
		$('.all-money').text('0');
		$('p.tip').find('small').text('');
	});
	
	$('.calculate-form input[type=text]').bind({
		'keyup': function() {
			var num = $.trim($(this).val());
			var name = $(this).prop('name');
			
			if (!isNaN(num)) {		// 数字
				switch (name) {
					case 'loan-1':
						var n_prefix = /^[+-\.]./g;
						if (n_prefix.test(num)) {		// 数字前面不能带有"+","-","."等字符
							$(this).parent().children('p.tip').find('small').text('数字前面不要带有" + ", " - ", " . "等字符, 如: .123');
							return;
						}
						break;
					case 'loan-2':
						if (Number(num) < 0 || Number(num) > 100) {
							$(this).parent().children('p.tip').find('small').text('请正确输入0 ~ 100之间的数值');
							return;
						}
						break;
					case 'loan-3':
						var isfloatReg = /.\../g;
						if (Number(num) < 1) {
							$(this).parent().children('p.tip').find('small').text('请正确输入大于1的正整数');
							return;
						}
						if (isfloatReg.test(num)) {
							$(this).parent().children('p.tip').find('small').text('请正确输入大于1的正整数');
							return;
						}
						break;
				}
				
				$(this).parent().children('p.tip').find('small').text('');
			} else {
				// 不合法数字
				$(this).parent().children('p.tip').find('small').text('请输入正确数字');
			}
		},
		'blur': function() {
			var num = $.trim($(this).val());
			var name = $(this).prop('name');
			var n_suffix = /.\.$/g;   
			if (!isNaN(num)) {		// 数字 
				if (n_suffix.test(num)) {		// 数字带有"."的后缀
					$(this).parent().children('p.tip').find('small').text('数字后面不能带有" . "的字符, 如: 123.');
					return;
				}
			}
		}
	});
	$('.calculate').bind('click', function() {
		var loan_1 = Number($.trim($('input[name=loan-1]').val())); 	// 投标金额
		var loan_2 = Number($.trim($('input[name=loan-2]').val())) / 100; 	// 年化收益
		var loan_3 = Number($.trim($('input[name=loan-3]').val())); 	// 投资期限
		//var loanType = $.trim($('input[name=LoanType]').val()); // 投标类型
		var res = 0;
		
		switch($.data(document.body, 'loanType')) {
			case '1':	// 短期
				res = loan_1 + loan_1 * loan_2 / 360 * loan_3;
				break;
			case '2':	// 普通
				res = loan_1 + loan_1 * loan_2 / 12 * loan_3;
				break;
		}
		$('.all-money').text(function() {
			res = isNaN(res) ? '0' : res;
			return res;
		});
	});
	/* 计算器  end */
	$('.chat-top').click(function(){
		$("html, body").animate({
			"scroll-top":0
		},"slow");
	});
	var lastRmenuStatus=false;
	$(window).scroll(function(){//bug
		var _top=$(window).scrollTop();
		if(_top>330){
			$("#top").data("expanded",true);
		}else{
			$("#top").data("expanded",false);
		}
		if($("#top").data("expanded")!=lastRmenuStatus){
			lastRmenuStatus=$("#top").data("expanded");
			if(lastRmenuStatus){
				$("#top .chat-top").slideDown('slow');
			}else{
				$("#top .chat-top").slideUp('slow');
			}
		}
	});
});