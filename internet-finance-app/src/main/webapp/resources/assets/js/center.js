$(function() {
	NavCenter.init();
	BaofuModal.init();
	NavCenter.select_index();
	if ($("#msg-list").size() > 0) {
		// 消息箱
		$.ajax({
			type : 'post',
			url : '/member_index/messageList.htm',
			dataType : 'json',
			success : function(jsonObj) {
				var code = jsonObj.code;
				if (code == 0) {
					var msgList = jsonObj.msgList;
					var html = resultProcessing(msgList);
					$("#msg-list").append(html);
					$(".newsBtn").click(function(){   // 标题点击事件
						var $this = $(this);
						var $conObj = $this.parent().find('.content');
						if ($conObj.is(":hidden")) {
							$(".content").hide();
							$conObj.show();
						} else {
							$conObj.hide();
						}
						var _isRead = $this.attr("data-read");
						var _id = $this.attr("data-id");
						if (_isRead == 0 && _id != '') {
							$.ajax({
								type : 'post',
								url : '/member_index/updateReadStatus.htm?m_id='+_id,
								dataType : 'json',
								success : function(jsonObj) {
									if (jsonObj.code == 0) {
										$this.prev().remove();
									} else {
										ymPrompt.alert('消息查看失败，请稍后重试！',380,180,'提示');
									}
								}
							});
						}
					});
				} else {
					ymPrompt.alert('消息获取失败，请重新获取！',380,180,'提示');
				}
			},
			error : function() {
				ymPrompt.alert('消息获取失败，请重新获取！',380,180,'提示');
			}
		});
	}
});
function resultProcessing(list) {
	var html = '',title = '',time = '',isRead = 1;
	for (var i = 0;i < list.length;i++) {
		isRead = list[i].isread;
		html += '<li class="clearfix" style="list-style: none; padding: 18px 35px; border-bottom:1px solid #dddddd;">'+
			((isRead == 0) ? '<span class="pull-left" style="background: url(/resources/assets/images/center/news/red-dot.png) 0 0 no-repeat;'+
			'width:8px;height:8px;margin:5px 10px 5px 0;"></span>' : '') +
			'<a href="javascript:;" data-read="'+isRead+'" data-id="'+list[i].id+'" class="pull-left clearfix newsBtn" style="color: #575757;"><span class=" pull-left">'+list[i].title+'</span></a>'+
			'<span class="pull-right" style="color: #969696;">'+list[i].createTime+'</span>'+
			'<div class="clear"></div>'+
			'<p class="content" style="display:none; margin-top: 20px;color: #999999;font-size: 14px;">'+list[i].content+'</p></li>';
		console.log(list[i].id+',');
	}
	return html;
}
function setupall() {
	ymPrompt.confirmInfo('您确定要标记所有消息为已读吗？', 400, 200, null,
		function(result) {
			if (result == "ok") {
				$.ajax({
					type : 'post',
					url : '/member_index/updateReadStatusAll.htm',
					dataType : 'json',
					success : function(jsonObj) {
						if (jsonObj.code == 0) {
							$("#msg-list li").each(function(i){
								var $this = $(this);
								if ($this.children('span').size() > 1) {
									$this.children('span').eq(0).remove();
								}
							});  // 设置所有消息为已读
						} else {
							ymPrompt.alert('消息箱没有未读消息！',380,180,'提示');
						}
					},
					error : function() {
						ymPrompt.alert('操作失败，请稍后重试！',380,180,'提示');
					}
				});
			}
		}
	);
}
function checkbalance(){
	$.ajax({ 
           type: "post", 
           url: "/member_index/queryMoneyOfUser.htm", 
           dataType: "json", 
           success: function (data) {
        	   if(data.code == 1){
        		   ymPrompt.alert({
						message : "余额更新成功",
						title : "提示",
						handler : function(result) {
							if (result != "close") {
								$("#balance").text($.fmByComma(parseFloat(data.cashBalance).toFixed(2))); // 余额
								$("#cash_balance").text($.fmByComma(parseFloat(data.cashBalance).toFixed(2))); 
								$("#expectMoney").text($.fmByComma(parseFloat(data.expectMoney).toFixed(2))); // 待收本金
								$("#expectIncome").text($.fmByComma(parseFloat(data.expectIncome).toFixed(2)));  // 待收收益
								$("#expectBonus").text($.fmByComma(parseFloat(data.expectBonus).toFixed(2)));  // 待收佣金
								$("#allMoney").text($.fmByComma(parseFloat(data.allMoney).toFixed(2)));  // 账户总资产
							}
						}
					});
        	   } else if (data.code == -1) {
        		   ymPrompt.alert('宝付余额更新失败');
        	   } else{
        		   ymPrompt.alert({
						message : "请登录后操作！",
						title : "提示",
						handler : function(result) {
							if (result != "close") {
								location.href = '/visitor/to-login';
							}
						}
        		   });
        	   }
           }
	});
}