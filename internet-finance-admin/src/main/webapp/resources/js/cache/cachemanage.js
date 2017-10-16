/** 登录相关缓存信息更新 */
function updateLoginRelCache() {
	$.ajax({
		url : '/cachemanage/updateLoginRelCache.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 首页导航条相关缓存更新 */
function updateIndexBannerRelCache() {
	$.ajax({
		url : '/cachemanage/updateIndexBannerRelCache.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 累计投资相关缓存更新 */
function updateTotalInvestMoney() {
	$.ajax({
		url : '/cachemanage/updateTotalInvestMoney.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 总注册人数相关缓存更新 */
function updateTotalRegisterNum() {
	$.ajax({
		url : '/cachemanage/updateTotalRegisterNum.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 文章列表相关缓存更新 */
function updateArticleList() {
	$.ajax({
		url : '/cachemanage/updateArticleList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 待回款项目列表相关缓存更新 */
function updateToReturnLoanList() {
	$.ajax({
		url : '/cachemanage/updateToReturnLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 热门推荐列表相关缓存更新 */
function hotIntroduceLoanList() {
	$.ajax({
		url : '/cachemanage/hotIntroduceLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 首页标列表更新 */
function updateIndexLoanList() {
	$.ajax({
		url : '/cachemanage/updateIndexLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 众持页面首页标列表相关缓存更新 */
function updateZhongChiPageLoanList() {
	$.ajax({
		url : '/cachemanage/updateZhongChiPageLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 邮件短信查询数据更新 */
function updateInvestorstasinfo() {
	$.ajax({
		url : '/cachemanage/updateInvestorstasinfo.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 更新标详情缓存信息 */
function updateLoanDetailRelCache() {
	var loanSignId = $("#loanSignId").val();
	$.ajax({
		url : '/cachemanage/updateLoanDetailRelCache.htm',
		type : 'post',
		data : {loanSignId:loanSignId},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 更新所有标详细缓存信息 */
function updateAllLoanDetailRelCache() {
	var loanSignId = $("#loanSignId").val();
	$.ajax({
		url : '/cachemanage/updateAllLoanDetailRelCache.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** H5众持页面首页标列表相关缓存更新 */
function updateH5ZhongChiPageLoanList() {
	$.ajax({
		url : '/cachemanage/updateH5ZhongChiPageLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** H5首页导航条相关缓存更新 */
function updateH5IndexBannerRelCache() {
	$.ajax({
		url : '/cachemanage/updateH5IndexBannerRelCache.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** H5累计收益相关缓存更新 */
function updateH5TotalIncome() {
	$.ajax({
		url : '/cachemanage/updateH5TotalIncome.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** H5热门推荐列表相关缓存更新 */
function updateH5HotIntroduceLoanList() {
	$.ajax({
		url : '/cachemanage/updateH5HotIntroduceLoanList.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 更新猴声大噪缓标存信息 */
function updateActivityMonkeyMax() {
	var monkeyLoanSignId = $("#monkeyLoanSignId").val();
	$.ajax({
		url : '/cachemanage/updateActivityMonkeyMax.htm',
		type : 'post',
		data : {monkeyLoanSignId:monkeyLoanSignId},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 更新猴声大噪周榜到数据库 */
function updateActivityMonkeyWEEK() {
	$.ajax({
		url : '/cachemanage/updateActivityMonkeyWEEK.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 更新理财师现金返利排行榜到数据库 */
function updateActivityFinancial() {
	$.ajax({
		url : '/cachemanage/updateActivityFinancial.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 爬山活动奖励结果一键生成 */
function generateClimbTopResult() {
	$.ajax({
		url : '/cachemanage/generateClimbTopResult.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 2016年5月新手任务相关关注微信根据手机号标注领取 */
function webChatAttentionReceive() {
	var phone = $("#MonthersDayPhone").val();
	$.ajax({
		url : '/cachemanage/webChatAttentionReceive.htm',
		type : 'post',
		data : {phone:phone},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

///** 2016-05参与母亲节发放红包 */
//function monthersDay() {
//	var phone = $("#MonthersDayPhone").val();
//	$.ajax({
//		url : '/cachemanage/MonthersDayHb.htm',
//		type : 'post',
//		data : {phone:phone},
//		success : function(data) {
//			data = JSON.parse(data);
//			alertMsg.info(data.msg);
//		}
//	});
//}
/** 后台手工发送“周周惊喜大放送”活动奖励 */
function weekSurprisePrizeGive() {
	var weekNum = $("#weekNum").val();
	if(weekNum > 0) {
		$.ajax({
			url : '/cachemanage/weekSurprisePrizeGive.htm',
			type : 'post',
			data : {weekNum:weekNum},
			success : function(data) {
				data = JSON.parse(data);
				alertMsg.info(data.msg);
			}
		});
	} else {
		alertMsg.info("请选择需要发放第几周的奖励！");
	}
}

/**app启动画面开关*/
function appStartPictureSwitch(){
    var pictureSwitch=$("#pictureSwitch").val();
    if(pictureSwitch>-1){
	  $.ajax({
		  url : '/cachemanage/appStartPictureSwitch.html',
		  type :'post',
		  data :{pictureSwitch:pictureSwitch},
	      success : function(data){
	    	  data=JSON.parse(data);
	    	  alertMsg.info(data.msg);
	      }		  
	  });	
    }else{	alertMsg.info("请选开关状态！");}
}

/**app启动画面图片地址*/
function updateAppStartImageAddress(){
	var url=$("#imageAddress").val();
	$.ajax({
	url : '/cachemanage/updateAppStartImageAddress.html',
	type : 'post',
	data : {url:url},
	success : function(data){
		data=JSON.parse(data);
		alertMsg.info(data.msg);
	 }
	});
}

/** 投资有奖聚橙网门票发放 */
function juChengTicketInvestAward(){
	var loanId = $("#investAwardLoanId").val();
	$.ajax({
		url : '/cachemanage/juChengTicketInvestAward.htm',
		type : 'post',
		data : {loanId:loanId},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 聚橙网推荐用户门票发放 */
function juChengGenUserTcketAward(){
	$.ajax({
		url : '/cachemanage/juChengGenUserTcketAward.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}

/** 微博活动门票发放 */
function juChengWeiBoTcketAward(){
	var weiBoMobilePhone = $("#weiBoMobilePhone").val();
	$.ajax({
		url : '/cachemanage/juChengWeiBoTcketAward.htm',
		type : 'post',
		data : {phone:weiBoMobilePhone},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}