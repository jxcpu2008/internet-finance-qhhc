$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#customerRecharge-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerRechargeList-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#customerRecharge').omGrid('reload');
						return true;
					};

					$("#customerRecharge")
							.omGrid(
									{
										dataSource : '/customerRecharge/customerRechargeList',
										title : '客服充值流水查询',
										height : 550,
										limit : 20,
										colModel : [
												{
													header : '用户ID',
													name : 'uid',
													width : 35,
													align : 'center'
												},
												{
													header : '充值ID',
													name : 'id',
													width : 35,
													align : 'center'
												},
												{
													header : '状态',
													name : 'status',
													width : 100,
													align : 'center',
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 0) {
															return "<span style='color:green;'>待确认</span> ";
														} else if (v == 1) {
															return "充值成功";
														} else if (v == -1) {
															return "<span style='color:red;'>充值失败</span>";
														}
													}
												},
												{
													header : '真实用户名',
													name : 'name',
													width : 100,
													align : 'center'
												},
												{
													header : '登录用户名',
													name : 'userName',
													width : 100,
													align : 'center'
												},
												{
													header : '充值金额',
													name : 'rechargeAmount',
													align : 'center',
													width : 120
												},
												{
													header : '实际到账金额',
													name : 'reAccount',
													align : 'center',
													width : 120
												},
												{
													header : '宝付收取手续费',
													name : 'fee',
													width : 100,
													align : 'center'
												},
												{
													header : '商户收取手续费',
													name : 'merfee',
													width : 100,
													align : 'center'
												},
												{
													header : '费用承担方',
													name : 'feetakenon',
													width : 100,
													align : 'center',
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 1) {
															return "平台支付";
														} else if (v == 2) {
															return "用户支付";
														}
													}
												}, {
													header : '充值时间',
													name : 'time',
													align : 'center',
													width : 150
												}, {
													header : '宝付充值成功时间',
													name : 'succ_time',
													width : 150,
													align : 'center'
												}, {
													header : '充值流水号',
													name : 'orderNum',
													width : 150,
													align : 'center'
												},{
													header : '渠道',
													name : 'fromSrc',
													width : 150,
													align : 'center',
													renderer : function(v,rowData, rowIndex){
														if (v == 8) {
															return "Android";
														} else if (v == 9) {
															return "IOS";
														}else if (v == 6){
															return "WAP";
														}else{
															return "PC";
														}
													}
												} ],
										// 选中事件
										onRowSelect : function(index, rowData,
												event) {
											// 取到该行id值
											var id = rowData["uid"];
											if (id) {
												$('#acoumtRecharge').omGrid(
														'setData',
														'/admin_account/query_by_user?ids='
																+ rowData.uid);
											}
										}
									});

					// 搜索面板
					$("#customerRecharge-search-panel").omPanel({
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

					// 是否是借款人
					$("#rechargeStatus").omCombo({
						width : 70,
						forceSelection : true,
						dataSource : [ {
							text : '不限',
							value : ''
						}, {
							text : '待确认',
							value : '0'
						}, {
							text : '充值成功',
							value : '1'
						}, {
							text : '充值失败',
							value : '-1'
						} ]
					});

					// 鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
						html : '可以通过单击，展开高级搜索面板哦'
					});
					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					$("#startTime").omCalendar({
						disabledFn : disFn
					});
					$("#endTime").omCalendar({
						disabledFn : disFn
					});

					$("#customerRechargeList-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/customerRecharge/customerRechargeList?"+ $("#customerRechargeListSearchFrom").serialize());
										$('#customerRecharge').omGrid(
												'setData', url);
									});
				});

// 导出
$("#rech-table-to-excel").click(function() {

	var messgae = "是否导出充值记录到excel？";
	
	var userName = $("#userName").val();
	var name = encodeURI($("#name").val());
	var rechargeStatus = $("#rechargeStatus").val();
	var startTime =  $("#startTime").val();
	var endTime =  $("#endTime").val();
	
	var param = new Object();
	param.userName = userName;
	param.name = name;
	param.rechargeStatus = rechargeStatus;
	param.startTime = startTime;
	param.endTime = endTime;

	var json = JSON.stringify(param);
	var url = "/customerRecharge/rechange-table-to-excel?paramJsonStr="+json;
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;

		}
	});
});

$('#acoumtRecharge').omGrid({
	// width:'fit',
	height : 340,
	dataSource : '/admin_account/query_by_user',
	limit : 10,
	title : '资金流水记录',
	autoFit : true,
	emptyMsg : '暂时还没有数据',
	colModel : [ {
		header : '日期',
		name : 'time',
		width : 80,
		align : 'center'
	}, {
		header : '类型',
		name : 'type',
		width : 100,
		align : 'center'
	}, {
		header : '支出',
		name : 'expenditure',
		align : 'center',
		width : 80
	}, {
		header : '收入',
		name : 'income',
		align : 'center',
		width : 80
	},{
		header : '订单号',
		name : 'ipsNumber',
		align : 'center',
		width : 100
	}, {
		header : '备注',
		name : 'explan',
		align : 'center',
		width : 100
	} ]
});

/*******************************************************************************
 * 查询充值信息
 */
$("#selCustomerRecharge")
		.click(
				function() {
					var ids = "";
					var selections = $('#customerRecharge').omGrid(
							'getSelections', true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择待确认充值的信息！");
						return false;
					}
					alertMsg
							.confirm(
									"您确定对此条数据进行充值查询吗！",
									{
										okCall : function() {
											for ( var i in selections) {
												if (selections[i].status == 0) {
													ids += selections[i].id;
													$
															.ajax({
																data : 'rId='
																		+ ids,
																url : '/customerRecharge/ipsCustomerRechargeNum.htm',
																type : 'post',
																success : function(msg) {
																	if (msg == "1") {
																		alertMsg
																				.info("宝付已受理查询充值请求,请稍后尝试刷新页面！");
																	} else if (msg == "-1") {
																		alertMsg
																				.info("宝付充值处理失败，请尝试刷新页面!");
																	} else if (msg == "2") {
																		alertMsg
																				.info("刚充值未超过10分钟不允许进行宝付查询");
																	}
																	$(
																			'#customerRecharge')
																			.omGrid(
																					'reload');
																}
															});
												} else {
													alertMsg
															.info("请选择状态为待确认的进行充值查询！");
													return false;
												}
											}
										}
									});
				});
