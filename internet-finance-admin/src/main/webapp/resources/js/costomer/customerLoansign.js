$(document)
		.ready(
				function() {
					var id = 0;
					$.data(document.body, 'lrid', '');
					// 查询面板初始化
					$("#customerLoansign-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerLoansignList-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#customerLoansign').omGrid('reload');
						return true;
					};

					$("#customerLoansign")
							.omGrid(
									{
										dataSource : '/customerLoansign/customerLoansignList',
										title : '客服项目众持投资流水查询',
										height : 550,
										limit : 20,
										colModel : [
												{
													header : '记录ID',
													name : 'id',
													width : 55,
													align : 'center'
												},
												{
													header : '购买是否成功',
													name : 'isSucceed',
													width : 100,
													align : 'center',
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 0) {
															return "<span style='color:red;'>待支付</span>";
														} else if (v == 1) {
															return "成功";
														} else if (v == -1) {
															return "<span style='color:red;'>失败</span>";
														}
													}
												},
												{
													header : '项目名称',
													name : 'loansignName',
													width : 170,
													align : 'center'
												},
												{
													header : '投资者真实用户名',
													name : 'userName',
													width : 100,
													align : 'center'
												},{
													header : '投资者手机号码',
													name : 'phone',
													width : 100,
													align : 'center'
												},
												{
													header : '购买金额',
													name : 'tenderMoney',
													width : 120,
													align : 'center'
												},
												{
													header : '订单号',
													name : 'order_id',
													width : 200,
													align : 'center'
												},
												{
													header : '购买时间',
													name : 'tenderTime',
													align : 'center',
													width : 130
												},
												{
													header : '用户注册时间',
													name : 'createTime',
													align : 'center',
													width : 130
												},
												{
													header : '投资类型',
													name : 'subType',
													align : 'center',
													width : 80,
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 1) {
															return "优先";
														} else if (v == 2) {
															return "夹层";
														} else if (v == 3) {
															return "劣后";
														}

													}
												},
												{
													header : '放款时间',
													name : 'creaitTime',
													align : 'center',
													width : 150
												},
												{
													header : '标的状态',
													name : 'status',
													align : 'center',
													width : 100,
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 1) {
															return "融资中";
														} else if (v == 2
																|| v == 3
																|| v == 4
																|| v == 5) {
															return "融资成功";
														} else if (v == 6) {
															return "已放款";
														} else if (v == 7) {
															return "还款中";
														} else if (v == 8) {
															return "已完成";
														} else if (v == 9) {
															return "已流标";
														}

													}
												},
												{
													header : '产品期限',
													name : 'remonth',
													align : 'center',
													width : 100
												},{
													header : '渠道来源',
													name : 'regUserName',
													align : 'center',
													width : 100
												},
												{
													header : '操作',
													align : 'center',
													width : 80,
													name : '',
													renderer : function() {
														return "<a title='查看详情' class='seeDetailes' style='color:blue' href='javascript:;'>查看详情</a>";
													}
												} ],// 选中事件
										onRowSelect : function(index, rowData,
												event) {
											var id = rowData["id"];
											$.data(document.body, 'lrid', id);

										}
									}).on(
									'click',
									'a',
									function(event) {
										event.stopPropagation();
										// alert($.data(document.body, 'lrid'));
										$.pdialog.open(
												'/customerLoansign/seeLoanDetailes?lrId='
														+ $.data(document.body,
																'lrid'),
												'seeLoanDetailes', '查看客户投资详情',
												{
													width : 700,
													height : 400,
													mask : true,
													maxable : false
												});
									});

					// 搜索面板
					$("#customerLoansign-search-panel").omPanel({
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

					$("#search-loansign").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '未支付',
							value : '0'
						}, {
							text : '成功',
							value : '1'
						}, {
							text : '失败',
							value : '-1'
						} ]
					});

					$("#search-remonth").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : ''
						}, {
							text : '1个月',
							value : '1'
						}, {
							text : '3个月',
							value : '3'
						}, {
							text : '6个月',
							value : '6'
						}, {
							text : '9个月',
							value : '9'
						}, {
							text : '12个月',
							value : '12'
						} ]
					});

					$("#search-loanstatus").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : ''
						}, {
							text : '融资中',
							value : '1'
						}, {
							text : '已满标',
							value : '2'
						}, {
							text : '还款中',
							value : '3'
						}, {
							text : '已完成',
							value : '4'
						}, {
							text : '已流标',
							value : '5'
						} ]
					});

					$("#search-repay").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '募集中',
							value : '10'
						}, {
							text : '还款中',
							value : '6'
						}, {
							text : '正常还款',
							value : '7'
						}, {
							text : '已清盘',
							value : '-1'
						} ]
					});

					$("#search-state").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '优先',
							value : '1'
						}, {
							text : '夹层',
							value : '2'
						}, {
							text : '劣后',
							value : '3'
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
					// 注册时间
					$("#start-time-loan").omCalendar({
						disabledFn : disFn
					});
					$("#end-time-loan").omCalendar({
						disabledFn : disFn
					});

					$("#customerLoansignList-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/customerLoansign/customerLoansignList?"
												+ $(
														"#customerLoansignListSearchFrom")
														.serialize());
										$('#customerLoansign').omGrid(
												'setData', url);
									});
				});

// 导出
$("#outLoanRecord").click(
		function() {

			var messgae = "是否导出投资记录到excel？";

			var url = "/customerLoansign/table-to-excel?"
					+ encodeURI($("#customerLoansignListSearchFrom").serialize());
			// 判断用户是否选中数据
			alertMsg.confirm(messgae, {
				okCall : function() {
					window.location.href = url;
					selectIds = [];
					$("#customerLoansign").omGrid("setSelections", selectIds);
				}
			});
		});

/*******************************************************************************
 * 查询投资信息
 */
$("#selCustomerLoansign")
		.click(
				function() {
					var ids = "";
					var selections = $('#customerLoansign').omGrid(
							'getSelections', true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择宝付已受理的项目众持投资信息！");
						return false;
					}
					alertMsg
							.confirm(
									"您确定对此条数据进行投资查询吗！",
									{
										okCall : function() {
											for ( var i in selections) {
												if (selections[i].isSucceed == 0) {
													ids += selections[i].id;
													$
															.ajax({
																data : 'id='
																		+ ids,
																url : '/plank/ipsLoanInfo.htm',
																type : 'post',
																success : function(
																		msg) {
																	if (msg == "1") {
																		alertMsg
																				.info("宝付未支付查询投资信息请求,请稍后尝试刷新页面！");
																	} else if (msg == "2") {
																		alertMsg
																				.info("宝付投资信息查询失败,请尝试刷新页面！");
																	} else if (msg == "3") {
																		alertMsg
																				.info("非宝付投资信息查询返回数据,请尝试刷新页面！");
																	} else if (msg == "4") {
																		alertMsg
																				.info("宝付投资信息查询处理失败,请尝试刷新页面！");
																	} else if (msg == "-1") {
																		alertMsg
																				.info("宝付处理失败，请尝试刷新页面！");
																	} else if (msg == "5") {
																		alertMsg
																				.info("刚投标未超过10分钟不允许进行宝付查询！");
																	}
																	$(
																			'#customerLoansign')
																			.omGrid(
																					'reload');
																}
															});
												} else {
													alertMsg
															.info("请选择状态为待支付的进行投资查询！");
													return false;
												}
											}
										}
									});
				});
