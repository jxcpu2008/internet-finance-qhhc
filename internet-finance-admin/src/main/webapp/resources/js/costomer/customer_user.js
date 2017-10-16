$(document)
		.ready(
				function() {

					// 用户选择要导出的会员
					var selectIds = [];
					$.data(document.body, 'userid', '');
					// 数据源面板
					$('#user_show_cust_list')
							.omGrid(
									{
										// width:'fit',
										height : 368,
										dataSource : '/userinfo/querypageCustomer',
										limit : 20,
										// autoFit:true,
										method : 'POST',
										showIndex : false,
										emptyMsg : '暂时还没有您想要的数据',
										singleSelect : true,
										onRowSelect : function(index, data) {
											if ($.inArray(data.id, selectIds) == -1)
												selectIds.push(data.id);
										},
										onRowDeselect : function(index, data) {
											var i = $.inArray(data.id,
													selectIds);
											selectIds.splice(i, 1);
										},
										// 还原过去选中的记录
										onRefresh : function(nowpage, records) {
											var len = selectIds.length;
											var indexs = [];
											for (var i = 0; i < len; i++) {
												$
														.each(
																records,
																function(n,
																		item) {
																	if (item.id === selectIds[i]) {
																		indexs
																				.push(n);
																	}
																});
											}
											$("#user_show_cust_list").omGrid(
													"setSelections", indexs);
										},
										colModel : [
												{
													header : '序号',
													name : 'id',
													width : 50,
													align : 'center'
												},
												{
													header : '用户名',
													name : 'username',
													width : 120,
													align : 'center'
												},
												{
													header : '真实姓名',
													name : 'realname',
													align : 'center',
													width : 100
												},
												{
													header : '用户类型',
													name : 'user_type',
													align : 'center',
													width : 100,
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 1) {
															return "会员";
														} else if (v == 2) {
															return "员工";
														} else if (v == 3) {
															return "企业";
														}else if (v == 4) {
															return "居间人";
														}
													}
												},
												{
													header : '手机号码',
													name : 'phone',
													align : 'center',
													width : 100
												},
												{
													header : '用户余额',
													name : 'cashBalance',
													align : 'center',
													width : 100
												},
												{
													header : '注册时间',
													name : 'createTime',
													align : 'center',
													width : 120
												},
												{
													header : '宝付授权状态',
													name : 'isAuthIps',
													align : 'center',
													width : 120,
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 0) {
															return "待确认";
														} else if (v == 1) {
															return "成功";
														} else if (v == -1) {
															return "失败";
														}
													}
												},
												{
													header : '推荐人用户名',
													name : 'genUserName',
													align : 'center',
													width : 100
												},
												{
													header : '推荐人真实姓名',
													name : 'genName',
													align : 'center',
													width : 100
												},
												{
													header : '推荐人部门',
													name : 'department',
													align : 'center',
													width : 100,
													renderer : function(v,
															rowData, rowIndex) {
														if (v == 1) {
															return "总裁办";
														} else if (v == 2) {
															return "财务部";
														} else if (v == 3) {
															return "行政部";
														} else if (v == 4) {
															return "副总办";
														} else if (v == 5) {
															return "运营中心";
														} else if (v == 6) {
															return "培训部";
														} else if (v == 7) {
															return "风控部";
														} else if (v == 8) {
															return "IT部";
														} else if (v == 9) {
															return "摄影部";
														} else if (v == 10) {
															return "推广部";
														} else if (v == 11) {
															return "项目部";
														} else if (v == 12) {
															return "客服部";
														} else if (v == 13) {
															return "事业一部";
														} else if (v == 14) {
															return "事业二部";
														} else if (v == 15) {
															return "离职员工";
														} else {
															return "暂无";
														}
													}
												},
												{
													header : '渠道来源',
													name : 'channelName',
													align : 'center',
													width : 120
												},
												{
													header : '认购金额',
													name : 'sumTenderMoney',
													align : 'center',
													width : 120
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
											// 取到该行id值
											var id = rowData["id"];
											$.data(document.body, 'userid', id);
											if (id) {
												acoumtUser(id);
											}

										}
									}).on(
									'click',
									'a',
									function(event) {
										event.stopPropagation();
										$.pdialog.open(
												'/userinfo/seeCutUserDetailes?id='
														+ $.data(document.body,
																'userid'),
												'seeUserDetailes', '查看会员详情', {
													width : 700,
													height : 500,
													mask : true,
													maxable : false
												});
									});

					// 搜索面板
					$("#user-search-cust").omPanel({
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

					// 是否是借款人
					$("#search-cus-brow").omCombo({
						width : 80,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '不限',
							value : ''
						}, {
							text : '是',
							value : '1'
						}, {
							text : '否',
							value : '0'
						} ]
					});

					$("#search-cus-loan").omCombo({
						width : 80,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '全部',
							value : ''
						}, {
							text : '是',
							value : '1'
						}, {
							text : '否',
							value : '0'
						} ]
					});
					
					//是否购买
					$("#search-isPurchase").omCombo({
						width : 80,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '全部',
							value : ''
						}, {
							text : '是',
							value : '1'
						}, {
							text : '否',
							value : '2'
						} ]
					});
					
					//推荐人
					$("#search-isRecommend").omCombo({
						width : 80,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '全部',
							value : ''
						}, {
							text : '有',
							value : '1'
						}, {
							text : '无',
							value : '2'
						} ]
					});
					
					// 用户类型
					$("#search-employee").omCombo({
						width : 80,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '不限',
							value : ''
						}, {
							text : '会员',
							value : '1'
						}, {
							text : '员工',
							value : '2'
						}, {
							text : '融资人',
							value : '3'
						} , {
							text : '居间人',
							value : '4'
						}  ]
					});

					$("#search-cust-service").omCombo({
						width : 70,
						dataSource : '/adminuser/getadminsuer_by_meneber'
					});

					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					// 注册时间
					$("#start-time-cust").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#end-time-cust").omCalendar({
						editable : false,
						disabledFn : disFn
					});

					$("#search-admin").omCombo({
						width : 70,
						dataSource : '/adminuser/getadminsuer_by_meneber'
					});

					// 搜索按钮
					$('span#search-cust')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					// 搜索按钮单击事件
					$("#search-cust").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/userinfo/querypageCustomer?"
										+ $("#searchfrom-cust").serialize());
								$('#user_show_cust_list')
										.omGrid('setData', url);
							});

					// 禁用
					$("#dis_user").click(
							function() {
								var ids = "";
								// 获取选中行数据
								var selectedRecords = $('#user_show_cust_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									alertMsg.confirm("是否禁止选中的会员登录?", {
										okCall : function() {
											for ( var i in selectedRecords) {
												ids += selectedRecords[i].id
														+ ",";
											}
											ajaxTodo("/userinfo/disuser?ids="
													+ ids);
											// 防止打开链接
											event.preventDefault();
										}
									});
								} else {
									alertMsg.warn("没有选择要禁止登录的会员");
								}
							});

					// 启用
					$("#en_user").click(
							function() {

								var ids = "";
								// 获取选中行数据
								var selectedRecords = $('#user_show_cust_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									alertMsg.confirm("是否允许选中的会员登录?", {
										okCall : function() {
											for ( var i in selectedRecords) {
												ids += selectedRecords[i].id
														+ ",";
											}
											ajaxTodo("/userinfo/enuser?ids="
													+ ids);
											// 防止打开链接
											event.preventDefault();
										}
									});
								} else {
									alertMsg.warn("没有选择允许登录的会员");
								}
							});

					// 用户解锁
					$("#unlock")
							.click(
									function() {
										var ids = "";
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_cust_list').omGrid(
												'getSelections', true);
										// 判断用户是否选中数据
										if (selectedRecords.length > 0) {
											alertMsg
													.confirm(
															"是否解锁选中的会员?",
															{
																okCall : function() {
																	for ( var i in selectedRecords) {
																		ids += selectedRecords[i].id
																				+ ",";
																	}
																	ajaxTodo("/userinfo/unlockUser?ids="
																			+ ids);
																	// 防止打开链接
																	event
																			.preventDefault();
																}
															});
										} else {
											alertMsg.warn("没有选择要解锁的会员");
										}
									});

					// 分配客服
					$("#recordborr")
							.click(
									function() {
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_cust_list').omGrid(
												'getSelections', true);
										// 判断用户是否选中数据
										if (selectedRecords.length > 0) {
											$.pdialog
													.open(
															'/userinfo/open_customer?ids='
																	+ selectedRecords[0].id
																	+ '&username='
																	+ selectedRecords[0].username,
															'purchase_list',
															'分配客服',
															{
																width : 420,
																height : 200,
																mask : true,
																maxable : false,
																resizable : false
															});
										} else {
											alertMsg.warn("您没有选择要分配客服的会员");
										}
									});

					// 分配员工编号
					$("#companyNum").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_cust_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length == 1) {
									// if (selectedRecords[0].user_type == 1) {
									$.pdialog.open(
											'/userinfo/queryByUserType?id='
													+ selectedRecords[0].id
													+ '&type=1',
											'update_userType', '会员类型信息', {
												width : 400,
												height : 150,
												mask : true,
												maxable : false
											});

								} else {
									alertMsg.warn("请选择你要分配工号的会员信息");
								}
							});

					// 导出
					$("#dataToExcelCustomer").click(
							function() {

								var messgae = "是否导出所有会员信息到excel？";

								var url = encodeURI("/userinfo/dataToExcelCustomer?"
										+ $("#searchfrom-cust").serialize());
								// 判断用户是否选中数据
								alertMsg.confirm(messgae, {
									okCall : function() {
										window.location.href = url;
										selectIds = [];
										$("#user_show_cust_list").omGrid(
												"setSelections", selectIds);
									}
								});
							});

				});

// 查询宝付
$("#selIpsState")
		.click(
				function() {
					var ids = "";
					var selections = $('#user_show_cust_list').omGrid(
							'getSelections', true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择待确认的会员！");
						return false;
					}
					alertMsg
							.confirm(
									"您确定对此会员进行查询吗！",
									{
										okCall : function() {
											for ( var i in selections) {
												if (selections[i].pMerBillNo != ""
														&& selections[i].hasIpsAccount != 1) {
													ids += selections[i].id;
													$
															.ajax({
																data : 'id='
																		+ ids,
																url : '/userinfo/ipsSelUser.htm',
																type : 'post',
																success : function(
																		msg) {
																	if (msg == "1") {
																		alertMsg
																				.info("宝付已受理查询用户查询请求,请稍后尝试刷新页面！");
																	} else if (msg == "2") {
																		alertMsg
																				.info("宝付用户未授权,请授权！");
																	} else if (msg == "3") {
																		alertMsg
																				.info("宝付用户已注销，请稍后尝试刷新页面！");
																	} else if (msg == "4") {
																		alertMsg
																				.info("宝付处理失败，请重新进行查询！");
																	} else if (msg == "5") {
																		alertMsg
																				.info("非宝付返回数据，请稍后尝试刷新页面重试！");
																	} else if (msg == "6") {
																		alertMsg
																				.info("此会员信息未注册宝付，请稍后尝试刷新页面！");
																	} else {
																		alertMsg
																				.info("平台处理失败，请重新进行查询！");
																	}
																	$(
																			'#user_show_cust_list')
																			.omGrid(
																					'reload');
																}
															});
												} else {
													alertMsg
															.info("请选择状态为待确定的会员信息进行查询！");
													return false;
												}
											}
										}
									});
				});

// 查询宝付id
$("#selIpsTimeState").click(
		function() {
			$.pdialog.open('/userinfo/queryByTimeState', 'update_timeState',
					'查询会员ID信息', {
						width : 400,
						height : 200,
						mask : true,
						maxable : false
					});
		});

var acoumtUser = function(id) {
	$('#acoumtUser').omGrid({
		height : 280,
		dataSource : '/admin_account/query_by_user?ids=' + id,
		limit : 10,
		title : '资金流水记录',
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
		},  {
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
}

//查询余额
function selUserAccount() {
	var ids = "";
	// 获取选中行数据
	var selections = $('#user_show_cust_list').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要查询余额的会员信息！");
	} else {
		alertMsg.confirm("是否对选中的会员信息进行余额查询?", {
			okCall : function() {
				for ( var i in selections) {
					if (selections[i].pMerBillNo != ""
							&& selections[i].pMerBillNo != null) {
						ids += selections[i].id;
					} else {
						alertMsg.info("只有注册过宝付账户的会员才能进行余额查询！");
						return false;
					}
				}
				$.pdialog.open(
						'/FundsAccount/ipsSelFundsAccount?status=1&userId=' + ids,
						'selFundsAccount', '余额显示', {
							width : 450,
							height : 200
						});
			}
		});
	}
}