$(function() {
	NavCenter.init();
	BaofuModal.init();
	NavCenter.select_index();
});
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