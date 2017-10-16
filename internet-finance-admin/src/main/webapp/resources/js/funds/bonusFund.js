$(document).ready(
		function() {
			var id = 0;
				$("#myGridBonusFundAlready").omGrid({
					dataSource : '/bonus/queryPageAlready',
					height : 500,
					limit : 20,
					title : '推荐奖励发放记录',
					colModel : [{
						header : '被推荐用户Id',
						name : 'user_id',
						width : 80,
						align : 'center'
					},
					{
						header : '被推荐真实姓名',
						name : 'user_name',
						align : 'center',
						width : 120
					},
					{
						header : '被推荐手机',
						name : 'user_phone',
						align : 'center',
						width : 120
					},
					{
						header : '被推荐发放奖金',
						name : 'user_amount',
						align : 'center',
						width : 120
					},
					{
						header : '被推荐发放状态',
						name : 'user_state',
						align : 'center',
						width : 120,
						renderer : function(v, rowData, rowIndex) {
							if (v == 1) {
								return "已发放";
							}else if (v == 2) {
								return "奖励为0";
							}else if (v == 3) {
								return "无推荐人";
							}else if (v == 0) {
								return "待发放";
							}else if (v == -1) {
								return "发放失败";
							}
						}
					},{
						header : '被推荐发放时间',
						name : 'user_date',
						align : 'center',
						width : 150
					},{
						header : '被推荐发放管理员',
						name : 'user_releaseId',
						align : 'center',
						width : 120
					},
					{
						header : '被推荐首次投资金额',
						name : 'tenderMoney',
						align : 'center',
						width : 170
					},
					{
						header : '被推荐首次投资日期',
						name : 'tenderTime',
						align : 'center',
						width : 170
					},{
						header : '推荐用户Id',
						name : 'genuser_id',
						width : 80,
						align : 'center'
					},
					{
						header : '推荐真实姓名',
						name : 'genuser_name',
						align : 'center',
						width : 120
					}, 
					{
						header : '推荐发放奖金',
						name : 'genuser_amount',
						align : 'center',
						width : 120
					},
					{
						header : '推荐发放状态',
						name : 'genuser_state',
						align : 'center',
						width : 100,
						renderer : function(v, rowData, rowIndex) {
							if (v == 1) {
								return "已发放";
							}else if (v == 2) {
								return "奖励为0";
							}else if (v == 3) {
								return "无推荐人";
							}else if (v == 0) {
								return "待发放";
							}else if (v == -1) {
								return "发放失败";
							}
						}
					},{
						header : '推荐发放时间',
						name : 'genuser_date',
						align : 'center',
						width : 120
					},{
						header : '推荐发放管理员',
						name : 'genuser_releaseId',
						align : 'center',
						width : 120
					}]
				});
				
				
				// 查询面板初始化
				$("#BonusAlreadyList-search-panel").omPanel({
					title : "高级搜索",
					collapsible : true,
					width : 'fit'
				});
				$('span#BonusAlreadyList-button-search').omButton({
									icons : {
										left : '/resources/operamasks-ui/themes/default/images/search.png'
									},
									width : 70
								});
				
				
				// 搜索面板
				$("#BonusAlreadyList-search-panel").omPanel({
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
				$("#userStateCombo").omCombo({
					width : 70,
					forceSelection : true,
					dataSource : [ {
						text : '全部',
						value : ''
					}, {
						text : '待发放',
						value : '0'
					}, {
						text : '已发放',
						value : '1'
					}, {
						text : '奖励为0',
						value : '2'
					}, {
						text : '无推荐人',
						value : '3'
					}, {
						text : '发放失败',
						value : '-1'
					}
					]
				});
				
				$("#genUserStateCombo").omCombo({
					width : 70,
					forceSelection : true,
					dataSource : [ {
						text : '全部',
						value : ''
					}, {
						text : '待发放',
						value : '0'
					}, {
						text : '已发放',
						value : '1'
					}, {
						text : '奖励为0',
						value : '2'
					}, {
						text : '无推荐人',
						value : '3'
					}, {
						text : '发放失败',
						value : '-1'
					}
					]
				});
				
				

				$("#BonusAlreadyList-button-search").click(
								function() {
									var ajaxbg = $("#background,#progressBar");
									ajaxbg.show();
									var url = encodeURI("/bonus/queryPageAlready?"+ $("#BonusAlreadyListSearchFrom").serialize());
									        $('#myGridBonusFundAlready').omGrid('setData', url);
								});
				
				//控制时间控件可选择的范围
				var disFn = function disFn(date) {
				var nowMiddle = new Date();
					if (date > nowMiddle) {
					return false;
					}
				}
				//申请开始时间
				$("#selTimebeginFundAlready").omCalendar({
					editable : false,
					disabledFn : disFn
				});
				//申请结束时间
				$("#selTimeEndFundAlready").omCalendar({
					editable : false,
					disabledFn : disFn
				});
		}
);

//获取被推荐人
$("#selCreditBonusMoneyOne").click(function(){
	var selTimebeginFund=document.getElementById('selTimebeginFundAlready').value;
	var selTimeEndFund=document.getElementById('selTimeEndFundAlready').value;
	if(selTimebeginFund==null||selTimebeginFund==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	if(selTimeEndFund==null||selTimeEndFund==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	alertMsg.confirm("您确定要对此被推荐人的奖励进行奖励转账吗？",{
		   okCall : function() {
					    $.ajax({
								url : '/bonus/releaseBonus.htm?status=1&'+$("#BonusAlreadyListSearchFrom").serialize(),
								type : 'post',
								success : function(msg) {
									if(msg=="1") {		
										 alertMsg.info("操作成功！");
									}else if(msg=="2") {
										alertMsg.info("用户系统消息发送失败");
									}else if(msg=="3"){
										alertMsg.info("无此权限！");
									}else if(msg=="4"){
										alertMsg.info("无数据需要转账！");
									}
									$('#myGridBonusFundAlready').omGrid('reload');
								}
							});
					}
			});
});

//获取推荐人
$("#selCreditBonusMoneyTwo").click(function(){
	var selTimebeginFund=document.getElementById('selTimebeginFundAlready').value;
	var selTimeEndFund=document.getElementById('selTimeEndFundAlready').value;
	if(selTimebeginFund==null||selTimebeginFund==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	if(selTimeEndFund==null||selTimeEndFund==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	alertMsg.confirm("您确定要对此推荐人的奖励进行奖励转账吗？",{
		   okCall : function() {
					    $.ajax({
								url : '/bonus/releaseBonus.htm?status=2&'+$("#BonusAlreadyListSearchFrom").serialize(),
								type : 'post',
								success : function(msg) {
									if(msg=="1") {		
										 alertMsg.info("操作成功！");
									}else if(msg=="2") {
										alertMsg.info("用户系统消息发送失败");
									}else if(msg=="3"){
										alertMsg.info("无此权限！");
									}else if(msg=="4"){
										alertMsg.info("无数据需要转账！");
									}
									$('#myGridBonusFundAlready').omGrid('reload');
								}
							});
					}
			});
});


//导出奖励已发放
$("#outBonusFundAlready").click(function(){
	 var messgae="是否导出所有奖励发放记录到excel？";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				window.location.href = "/bonus/outBonusFundAlready?"+$("#BonusAlreadyListSearchFrom").serialize();
			}
	});
});
			
