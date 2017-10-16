$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#customerWithdraw-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerWithdrawList-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#finacialWithdraw').omGrid('reload');
						return true;
					};

					$('#finacialWithdraw')
							.omGrid(
									{
										dataSource : '/customerWithdraw/finalWithdrawList',
										title : '财务提现流水查询',
										height : 550,
										limit : 20,
										colModel : [
												{
													header : '提现ID',
													name : 'id',
													width : 35,
													align : 'center'
												},
												{
													header : '状态',
													name : 'state',
													width : 100,
													align : 'center',
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 0) {
															return "<span style='color:green;'>待确认</span>";
														} else if (v == 1) {
															return "提现成功";
														} else if (v == 2) {
															return "<span style='color:green;'>宝付已受理</span>";
														} else if (v == 5) {
															return "转账处理中";
														} else if (v == -1) {
															return "<span style='color:red;'>提现失败</span>";
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
													header : '提现金额',
													name : 'amount',
													align : 'center',
													width : 120
												},
												{
													header : '实际到账金额',
													name : 'withdrawAmount',
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
													name : 'mer_fee',
													width : 100,
													align : 'center'
												},
												{
													header : '费用承担方',
													name : 'fee_taken_on',
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
													header : '提现时间',
													name : 'applytime',
													align : 'center',
													width : 150
												}, {
													header : '宝付提现成功时间',
													name : 'time',
													width : 150,
													align : 'center'
												}, {
													header : '提现流水号',
													name : 'strNum',
													width : 150,
													align : 'center'
												} ]
									});

					// 搜索面板
					$("#customerWithdraw-search-panel").omPanel({
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

					// 鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
						html : '可以通过单击，展开高级搜索面板哦'
					});
					
					var disFnW = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					$("#start-time-rechW").omCalendar({
						disabledFn : disFnW
					});
					$("#end-time-rechW").omCalendar({
						disabledFn : disFnW
					});

					// 是否是借款人
					$("#search-withdraw").omCombo({
						width : 70,
						forceSelection : true,
						dataSource : [ {
							text : '不限',
							value : ''
						}, {
							text : '待确认',
							value : '0'
						}, {
							text : '提现成功',
							value : '1'
						}, {
							text : '宝付已受理',
							value : '2'
						}, {
							text : '转账处理中',
							value : '5'
						}, {
							text : '提现失败',
							value : '-1'
						} ]
					});

					$("#customerWithdrawList-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/customerWithdraw/finalWithdrawList?"
												+ $(
														"#customerWithdrawListSearchFrom")
														.serialize());
										$('#finacialWithdraw').omGrid(
												'setData', url);
									});
				});

// 导出
$("#withdraw-table-to-excel").click(function() {

	var messgae = "是否导出所有提现记录到excel？";

	var url = encodeURI("/customerWithdraw/withdraw-table-to-excel?"+ $("#customerWithdrawListSearchFrom").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
			selectIds = [];
			$('#finacialWithdraw').omGrid("setSelections", selectIds);
		}
	});
});

/*******************************************************************************
 * 查询提现信息
 */
$("#selCustomerWithdraw")
		.click(
				function() {
					var ids = "";
					var selections = $('#finacialWithdraw').omGrid(
							'getSelections', true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择待确认提现的信息！");
						return false;
					}
					alertMsg
							.confirm(
									"您确定对此条数据进行提现查询吗！",
									{
										okCall : function() {
											for ( var i in selections) {
												if (selections[i].state != -1
														|| selections[i].state != 1) {
													ids += selections[i].id;
													$
															.ajax({
																data : 'wId='
																		+ ids,
																url : '/withdraw/ipsCustomerWithdrawNum.htm',
																type : 'post',
																success : function(
																		msg) {
																	if (msg == "1") {
																		alertMsg
																				.info("宝付已受理查询提现请求,请稍后尝试刷新页面！");
																	} else if (msg == "2") {
																		alertMsg
																				.info("宝付提现处理中,请尝试刷新页面！");
																	} else if (msg == "3") {
																		alertMsg
																				.info("非宝付提现查询返回数据,请尝试刷新页面！");
																	} else if (msg == "4") {
																		alertMsg
																				.info("宝付提现提现失败,请重新提现！");
																	} else if (msg == "5") {
																		alertMsg
																				.info("宝付提现查询失败，请尝试刷新页面!");
																	} else if (msg == "-1") {
																		alertMsg
																				.info("宝付提现处理失败，请尝试刷新页面!");
																	}
																	$(
																			'#finacialWithdraw')
																			.omGrid(
																					'reload');
																}
															});
												} else {
													alertMsg
															.info("请选择状态为待确认的进行提现查询！");
													return false;
												}
											}
										}
									});
				});
