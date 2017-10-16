$(document).ready(
	function() {
		// 数据显示列表相关
		$('#activityMonkeyGrantGride').omGrid({
			dataSource : '/activityMonkey/activityMonkeyGrantInit',
			title : '发放现金奖励',
			height : 550,
			limit : 20,
			singleSelect : false,
			colModel : [{
				header : '获奖id',
				name : 'id',
				align : 'center',
				width : 50
			}, {
				header : '发放状态',
				name : 'status',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "<span style='color:green;'>待发放</span>";
					} else if (v == 1) {
						return "<span style='color:red;'>已发放</span>";
					}else if(v==2){
						return "<span style='color:green;'>宝付已受理</span>";
					}else if(v==-1){
						return "<span style='color:red;'>发放失败</span>";
					}
				}
			},{
				header : '真实用户',
				name : 'name',
				align : 'center',
				width : 80
			}, {
				header : '手机号码',
				name : 'mobilePhone',
				align : 'center',
				width : 100
			}, {
				header : '投资金额',
				name : 'money',
				align : 'center',
				width : 120
			}, {
				header : '奖励类型',
				name : 'type',
				align : 'center',
				width : 160,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "猴声大噪(一鸣惊人)";
					}  else if (v == 2) {
						return "猴声大噪(一锤定音)";
					}else if (v == 3) {
						return "金袍加身(周第一名)";
					}else if (v == 4) {
						return "金袍加身(周第二名)";
					}else if (v == 5) {
						return "金袍加身(周第三名)";
					}else if(v==6){
						return "达人第一名(iPhone 6s)";
					}else if(v==7){
						return "达人第二名(Apple Watch Sport)";
					}else if(v==8){
						return "达人第三名(Kindle 电子书)";
					}else if(v==9){
						return "红筹理财师";
					}else if(v==10){
						return "桃花朵朵开";
					}else if(v==11){
						return "翻牌抽奖";
					}else if(v==12){
						return "一鸣惊人";
					}else if(v==13){
						return "一锤定音";
					} else if (v == 14) {
						return "5月首投活动";
					} else if (v == 15) {
						return "5月榜单统计";
					}
				}
			},{
				header : '奖品/奖金',
				name : 'rewardMoney',
				align : 'center',
				width : 100
			}, {
				header : '项目名称',
				name : 'loanName',
				align : 'center',
				width : 150
			}, {
				header : '操作人',
				name : 'realname',
				align : 'center',
				width : 120
			}, {
				header : '发放时间',
				name : 'grantTime',
				align : 'center',
				width : 120
			},{
				header : '转账失败原因',
				name : 'failreason',
				align : 'center',
				width : 120
			}]
		});
		
		// 搜索面板
		$("#activityMonkeyG-search-panel").omPanel({
			title : "高级搜索",
			collapsible : true,
			collapsed : true,
			onBeforeCollapse : function(event) {
				$('.om-panel-title').omTooltip({
					html : '可以通过单击，展开高级搜索面板哦'
				});
			},
			onBeforeExpand : function(event) {
				$('.om-panel-title').omTooltip({
					html : '可以通过单击，收缩高级搜索面板哦'
				});
			}
		});

		var dadaDisFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};
		// 获奖时间
		$("#createtime-timeG").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#examineTime-timeG").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#activityMonkeyG-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#activityMonkeyG-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityMonkey/activityMonkeyGrantInit?" + $("#activityMonkeyGSearchForm").serialize());
				$('#activityMonkeyGrantGride').omGrid('setData', url);
			});
});

/***
 * 现金奖励
 */
$("#updateActivityMonkey").click(function() {
	var selections = $('#activityMonkeyGrantGride').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined || selections.length < 1) {
	  	alertMsg.info("请选择一条项目信息数据！");
	  	return false;
	}
	
	if (selections.length > 1) {
		alertMsg.info("请点击批量现金发放按钮！");
	  	return false;
	}
	
	// 只有发放状态为0-待发放，-1-发放失败的记录才允许提交
	if (!(selections[0].status == 0 || selections[0].status == -1)) {
		alertMsg.info("请检查现金发放记录的发放状态，只有待发放或者发放失败的记录才允许提交！");
	  	return false;
	}
	
	  alertMsg.confirm("您确定对此数据进行现金奖励转账吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].status==0){
										    	$.ajax({
													data : 'id='+ selections[i].id,
													url : '/activityMonkey/ipsTransActivtiyMonkey',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付现金奖励已成功,请稍后尝试刷新页面！");
														}else if(msg=="0") {
															alertMsg.info("宝付现金奖励失败,请尝试刷新页面！");
														}else if(msg=="-1"){
															alertMsg.info("现金奖励失败,请联系客服！");
														}else if(msg=="2"){
															alertMsg.info("没有需要转账的现金奖励，不能进行现金奖励转账");
														}else if(msg=="3"){
															alertMsg.info("宝付现金奖励转账返回失败，请尝试刷新页面！");
														}else if(msg=="4"){
															alertMsg.info("无此权限！");
														}else if(msg=="5"){
															alertMsg.info("此用户不存在！");
														}else if(msg=="6"){
															alertMsg.info("此用户未进行宝付授权！");
														}else if(msg=="7"){
															alertMsg.info("后台正在进行中，请勿操作");
														}
														$('#activityMonkeyGrantGride').omGrid('reload');
													}
												});
										}else{
											alertMsg.info("请选择待发放的现金奖励数据！");
											return false;
									}
								}
						}
				});
});


/**** 导出excel***/
function activityMonkeyGrantCashFile() {
	var messgae = "是否导出发放现金奖励明细到excel？";
	var url = encodeURI("/activityMonkey/outPutGrantExcel?" + $("#activityMonkeyGSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

//发放状态查询
$("#getLoanActivityMonkey").click(
	function() {
		var ids = "";
		var selections = $('#activityMonkeyGrantGride').omGrid('getSelections',true);
		if (selections == null || selections == ""|| selections == undefined || selections.length < 1) {
			alertMsg.info("请选择要进行查询现金发放状态的记录！");
			return false;
		}
		
		alertMsg.confirm("您确定要对此数据进行现金发放状态查询吗？", {
			okCall : function() {
				for ( var i in selections) {
					if (selections[i].status ==2) {
						$.ajax({
							data : 'id='+selections[i].id,
							url : '/activityMonkey/ipsActivtiyMonkeyInfo.htm',
							type : 'post',
							success : function(msg) {
								if (msg == "1") {
									alertMsg.info("宝付待确认查询现金发放信息请求,请稍后尝试刷新页面！");
								} else if (msg == "2") {
									alertMsg.info("宝付现金发放信息查询失败,请尝试刷新页面！");
								} else if (msg == "3") {
									alertMsg.info("非宝付现金发放信息查询返回数据,请尝试刷新页面！");
								} else if (msg == "4") {
									alertMsg.info("宝付现金发放信息查询处理失败,请尝试刷新页面！");
								} else if (msg == "-1") {
									alertMsg.info("宝付处理失败，请尝试刷新页面！");
								} else if (msg == "5") {
									alertMsg.info("刚投标未超过10分钟不允许进行宝付查询");
								}
								$('#activityMonkeyGrantGride').omGrid('reload');
							}
						});
					} else {
						alertMsg.info("请选择状态为宝付已受理的现金发放信息！");
						return false;
					}
				}
			}
		});
	});

/***
 * 批量现金奖励
 */
$("#updateBatchActivtiyMonkey").click(function() {
	
	var selectedIndexs = $('#activityMonkeyGrantGride').omGrid('getSelections');
	var selections = $('#activityMonkeyGrantGride').omGrid('getSelections', true);	
	
	if (selectedIndexs.length == 0) {
		alertMsg.info("请选择一条项目信息数据！");
		return false;
	}
	
	if (selectedIndexs.length == 1) {
		alertMsg.info("请点击现金发放按钮！");
	  	return false;
	}
	
	// 只有发放状态为0-待发放，-1-发放失败的记录才允许提交
	var forbidCommitIndexs = [];	// 禁止提交的记录索引
	var recordIds = [];	// 提交的现金发放记录id列表
	for (var i = 0; i < selections.length; i++) {
		if (!(selections[i].status == 0 || selections[i].status == -1)) {
			forbidCommitIndexs.push(i);	// 收集禁止提交的记录索引
		} else {
			recordIds.push(selections[i].id);	// 收集提交的现金发放记录id
		}
	}
	if (forbidCommitIndexs.length > 0) {	// 存在禁止提交的记录，提示用户，高亮显示禁止提交的记录所在行
		alertMsg.info("请检查现金发放记录的发放状态，只有待发放或者发放失败的记录才允许提交！");
		$('#activityMonkeyGrantGride').omGrid('setSelections', forbidCommitIndexs);	
		return false;
	}
	
	alertMsg.confirm("您确定要进行批量现金奖励转账吗！",{
		okCall : function() {
			$.ajax({
				data : 'recordIds=' + recordIds.join(','),
				url : '/activityMonkey/ipsTransBatchActivtiyMonkey',
				type : 'post',
				success : function(msg) {
									
					if(msg=="1") {		
						 alertMsg.info("宝付现金奖励已成功,请稍后尝试刷新页面！");
					}else if(msg=="0") {
						alertMsg.info("宝付现金奖励失败,请尝试刷新页面！");
					}else if(msg=="-1"){
						alertMsg.info("现金奖励失败,请联系客服！");
					}else if(msg=="2"){
						alertMsg.info("没有需要转账的现金奖励，不能进行现金奖励转账");
					}else if(msg=="3"){
						alertMsg.info("宝付现金奖励转账返回失败，请尝试刷新页面！");
					}else if(msg=="4"){
						alertMsg.info("无此权限！");
					}else if(msg=="5"){
						alertMsg.info("此用户不存在！");
					}else if(msg=="6"){
						alertMsg.info("此用户未进行宝付授权！");
					}else if(msg=="7"){
						alertMsg.info("后台正在进行中，请勿操作");
					}
					$('#activityMonkeyGrantGride').omGrid('reload');
//					$('#activityMonkeyGrantGride').omGrid('setSelections', selectedIndexs);
				}
			});
		}
	});
});

$("#sumActivityMonkey").click(function() {
    var  begincreditTime=$("#createtime-timeG").val();
    var endcreditTime=$("#examineTime-timeG").val();
	  $.pdialog.open('/activityMonkey/sumActivityMonkey?begincreditTime='+begincreditTime+'&endcreditTime='+endcreditTime, 'sumActivityMonkey', '统计总额' , { width:400,height:160});
})