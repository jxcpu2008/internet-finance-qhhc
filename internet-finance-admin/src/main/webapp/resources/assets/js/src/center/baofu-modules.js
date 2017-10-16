var BaofuModal = function() {
	// 项目还款模态框
	var init = function() {
		$('#baofuModal').on('show.bs.modal', function(e) {
			// e.target;
			// e.relatedTarget;
		});
		bindEvent('input[data-id="baofu-phone"]');
		bindEvent('input[data-id="baofu-name"]');
		bindEvent('input[data-id="baofu-id"]');
		
		
		// 关联我的客户
		$("#retrieve").click(function(){
			var realName = /^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
			if (!realName.test($("[name=realName]").val())){
				BaofuModal.getErrorInfo('真实姓名无效',3);
				return;
			}
			var phone = /^1\d{10}$/;
			if (!phone.test($("[name=phone]").val())){
				BaofuModal.getErrorInfo('手机号码无效',1);
				return;
			}
			var idcard = /^((\d{18})|(\d{17}[Xx]))$/;
			if (!idcard.test($("[name=identity]").val())){
				BaofuModal.getErrorInfo('身份证号无效',2);
				return;
			}
			$.ajax({
				url : "/generalize/retrieveReferrer",
				type : "post",
				data : $("#retrieve_form").serialize(),
				success : function(data) {
					if (data=="self") {
						ymPrompt.alert('被推荐人不能是自己！',300,170,null,function(result) {
							if(result=="ok"){
								clear();
							}
						});
					} else if (data=="employee") {
						ymPrompt.alert('被推荐人不能是员工！',327,170 ,null, function(result) {
							if(result=="ok"){
								clear();
							}
						});
					} else if (data=="brokerage") {
						ymPrompt.alert('居间人不能被普通用户或居间人推荐！',327,170 ,null, function(result) {
							if(result=="ok"){
								clear();
							}
						});						
					} else if (data=="exist") {
						ymPrompt.alert('该用户已经被别人关联，操作失败！',327,170 ,null, function(result) {
							if(result=="ok"){
								clear();
							}
						});
					} else if (data=="success"){
						ymPrompt.alert('关联申请提交成功，正在审核',300,170 ,null, function(result) {
							if(result=="ok"){
								window.location.reload();
								clear();
							}
						});
					} else if (data=="mutual"){
						ymPrompt.alert('不能进行相互推荐！',300,170 ,null, function(result) {
							if(result=="ok"){
								clear();
							}
						});
					} else {
						ymPrompt.alert('信息不匹配，申请失败！',300,170 ,null, function(result) {
							if(result=="ok"){
								clear();
							}
						});
					}
				}
			});
		});
		function clear(){
			$("[name=realName]").val('');
			$("[name=phone]").val('');
			$("[name=identity]").val('');
			$('#findmenModal').modal('hide');
		}
		// 绑定宝付授权
		$("#accredit").click(function(){
			if ($("#baofu_no").val() != '' && $("#baofu_no").val() == 1) {
				accredit();
			} else {
				ymPrompt.alert('请先开通宝付再进行授权！', 370,180, '提示');
			}
		});
		
		function Age(sn){
			if(!sn){return false;}
			var bstr = sn.substring(6,14)
			var _now = new Date();
			var _bir = new Date(bstr.substring(0,4),bstr.substring(4,6),bstr.substring(6,8));
			_bir.setFullYear(_bir.getFullYear()+18);
			_bir.setMonth(_bir.getMonth()-1);
			return _now > _bir;
		}
		
		// 绑定宝付注册
		$("#now_open").click(function(){
			var realName = /^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
			if (!realName.test($("#my_realName").val())){
				BaofuModal.getErrorInfo('真实姓名无效',3);
				return;
			}
			var idcard = /^((\d{18})|(\d{17}[Xx]))$/;
			if (!idcard.test($("#my_cardId").val())){
				BaofuModal.getErrorInfo('身份证号无效',2);
				return;
			}
			if(!Age($("#my_cardId").val())){
				BaofuModal.getErrorInfo('未年满18周岁',2);
				return;
			}
			$('body').spinner('正在开通宝付...');
			//宝付注册
			$.ajax({
				url : '/registration/registBaofoo.htm',
				type : 'post',
				data : {
					cardId : $("#my_cardId").val(),
					name : $("#my_realName").val()
				},
				success : function(data) {
					$('body').removerSpinner();
					if (data == 1) {
						ymPrompt.succeedInfo("您的宝付开通成功，窗口关闭后跳转到宝付授权。",400,200,"成功",
								function(result) {
									if (result=="ok") {
										accredit();
									} else {
										accredit();
									}
								});
					} else if (data == 4){
						ymPrompt.errorInfo('参数为空！', 400,200, '失败');
					} else if (data == 6){
						ymPrompt.errorInfo('身份证号无效！', 400,200, '失败');
					} else if (data == 7){
						ymPrompt.errorInfo('未年满18周岁！', 400,200, '失败');
					} else if (data == 3){
						ymPrompt.errorInfo('不是宝付注册返回的数据！', 400,200, '失败');
					} else {
						var flag=data.split('_')[0];
						if(flag=="BD009"){
							//ymPrompt.win('您的宝付账号已经存在，即将引导你进入宝付完成绑定操作。',400,200,'提示',{closeBtn:false});
							ymPrompt.win({message:'您的宝付账号已经存在，即将引导你进入宝付完成绑定操作。',title:'提示',closeBtn:false});
							
							setTimeout(bind,3000); 
						}else{
							ymPrompt.win({message:data.split('_')[1],title:'提示',closeBtn:false});
							setTimeout(bind,3000);
						}
						
						
					}
				}
			});
		});
	}
	// 授权
	var accredit = function () {
		$.ajax({
			url : '/member/ipsInAccreditUser.htm',
			type : 'post',
			success : function(data) {
				if (data != 1) {
					window.location.href = "/member/callcentralInAccredit.htm";
				} else {
					ymPrompt.errorInfo('授权信息获取失败，请联系客服', 400,200, '失败');
				}
			}
		});
	}
	
	//绑定
	var bind = function () {
		$("#ipsForm").submit();
	}
	
	var fixPositionByOthers = function(obj) {
		var top = $(obj).parents('.form-group').position().top - $(obj).height() / 3;
		var left = $(obj).parents('.form-group').position().left + $(obj).parents('.form-group').width() * 0.725;
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
		var errorTpl = '<div class="popover right" role="tooltip" style="top:'
				+ pos.top
				+ 'px;left:'
				+ pos.left
				+ 'px;display:block;"><div class="arrow"></div><div class="popover-content">'
				+ error + '</div></div>';
		return errorTpl;
	}
	var getErrorInfo = function(error, n) {
		/*
		 * n=1, 手机号码  n=2, 身份证号  n=3, 真实姓名
		 * error='',信息正确
		 */
		var obj = '';
		var pos = null;
		switch (n) {
		case 1:
			obj = 'input[data-id="baofu-phone"]';
			break;
		case 2:
			obj = 'input[data-id="baofu-id"]';
			break;
		case 3:
			obj = 'input[data-id="baofu-name"]';
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
	return {
		'init': init,
		'getErrorInfo' : getErrorInfo
	};
} ();