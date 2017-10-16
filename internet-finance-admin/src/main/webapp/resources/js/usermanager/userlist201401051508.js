$(document)
		.ready(
				function() {

					// 用户选择要导出的会员
					var selectIds = [];

					// 数据源面板
					$('#user_show_list').omGrid(
							{
								// width:'fit',
								height : 485,
								dataSource : '/userinfo/querypage',
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
									var i = $.inArray(data.id, selectIds);
									selectIds.splice(i, 1);
								},
								// 还原过去选中的记录
								onRefresh : function(nowpage, records) {
									var len = selectIds.length;
									var indexs = [];
									for (var i = 0; i < len; i++) {
										$.each(records, function(n, item) {
											if (item.id === selectIds[i]) {
												indexs.push(n);
											}
										});
									}
									$("#user_show_list").omGrid(
											"setSelections", indexs);
								},
								colModel : [ {
									header : '序号',
									name : 'id',
									width : 50,
									align : 'center'
								}, {
									header : '用户名',
									name : 'username',
									width : 120,
									align : 'center'
								}, {
									header : '真实姓名',
									name : 'realname',
									align : 'center',
									width : 100
								}, {
									header : '用户类别',
									name : 'user_type',
									align : 'center',
									width : 80,
									renderer : function(v, rowData, rowIndex) {
										if (v == 1) {
											return "会员";
										} else if (v == 2) {
											return "员工";
										} else if (v == 3) {
											return "企业";
										}else if(v==4){
											return "居间人";
										}else if(v==6){
											return "理财师";
										}
									}
								}, {
									header : '员工工号',
									name : 'staff_no',
									align : 'center',
									width : 100
								}, {
									header : '注册时间',
									name : 'createTime',
									align : 'center',
									width : 120
								}, {
									header : '宝付注册状态',
									name : 'hasIpsAccount',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v == 0) {
											return "待确认";
										} else if (v == 1) {
											return "成功";
										} else if (v == 2) {
											return "注销";
										} else if (v == -1) {
											return "失败";
										}else{
											return "未注册";
										}
									}
								}, {
									header : '宝付授权状态',
									name : 'isAuthIps',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v == 0) {
											return "待确认";
										} else if (v == 1) {
											return "成功";
										} else if (v == -1) {
											return "失败";
										}else{
											return "未授权";
										}
									}
								}, {
									header : '宝付注册单号',
									name : 'orderSn',
									align : 'center',
									width : 120
								}, {
									header : '宝付ID',
									name : 'pMerBillNo',
									align : 'center',
									width : 120
								}, {
									header : '是否为机构投资人',
									name : 'isorgperson',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v ==1) {
											return "是";
										} else if (v == 0) {
											return "否";
										} else if (v == 2) {
											return "待确认";
										} else if (v == 3) {
											return "不通过";
										}
									}
								}, {
									header : '是否为众持融资人',
									name : 'iscrowdhold',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v ==1 ) {
											return "是";
										} else {
											return "否";
										}
									}
								}, {
									header : '推荐人',
									name : 'genUserName',
									align : 'center',
									width : 100
								}, {
									header : '推荐人部门',
									name : 'department',
									align : 'center',
									width : 100,
									renderer : function(v, rowData, rowIndex) {
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
										}else if(v==15){
											return "离职员工";
										} else {
											return "暂无";
										}
									}
								}, {
									header : '累计收益',
									name : 'earnings',
									align : 'center',
									width : 100
								}, {
									header : '累计投资金额',
									name : 'loanmoney',
									align : 'center',
									width : 100
								}, {
									header : '会员等级',
									name : 'vipendtime',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (null != v && v != "") {
											return "特权会员";
										} else {
											return "普通会员";
										}
									}
								}, {
									header : '会员期限',
									name : 'vipendtime',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (null != v && v != "") {
											return v;
										} else {
											return "永久";
										}
									}
								}, {
									header : '登录次数',
									name : 'logincount',
									align : 'center',
									width : 100
								}, {
									header : '积分',
									name : 'userintegral',
									align : 'center',
									width : 100
								}, {
									header : '状态',
									name : 'isLock',
									align : 'center',
									width : 100
								}, {
									header : '客服',
									name : 'adminname',
									align : 'center',
									width : 100
								} ]
							});

					// 搜索面板
					$("#user-search-panel").omPanel({
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

					// 特权会员下拉框
					$("#search-type").omCombo({
						width : 70,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '不限',
							value : ''
						}, {
							text : '特权会员',
							value : '1'
						}, {
							text : '普通会员',
							value : '0'
						} ]
					});

					// 是否是借款人
					$("#search-brow").omCombo({
						width : 70,
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
						}]
					});

					$("#search-loan").omCombo({
						width : 70,
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
						}, {
							text : '待确认',
							value : '2'
						}, {
							text : '不通过',
							value : '3'
						} ]
					});
					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					// 注册时间
					$("#start-time").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#end-time").omCalendar({
						editable : false,
						disabledFn : disFn
					});

					$("#search-admin").omCombo({
						width : 70,
						dataSource : '/adminuser/getadminsuer_by_meneber'
					});

					// 搜索按钮
					$('span#user-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					// 搜索按钮单击事件
					$("#user-button-search").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/userinfo/querypage?"
										+ $("#searchfrom").serialize());
								$('#user_show_list').omGrid('setData', url);
							});

					// 禁用
					$("#dis_user").click(
							function() {
								var ids = "";
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
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
								var selectedRecords = $('#user_show_list')
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

					// 修改会员期限
					$("#update_user_time").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									$.pdialog.open(
											'/userinfo/update_user_date?ids='
													+ selectedRecords[0].id,
											'update_user_date_page', '修改会员时间',
											{
												width : 380,
												height : 300,
												mask : true,
												maxable : false
											});
								} else {
									alertMsg.warn("您没有选择要修改期限的会员");
								}
							});
					// 修改会员信息
					$("#update_user_info").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length == 1) {
									$.pdialog.open(
											'/userinfo/query_relation?ids='
													+ selectedRecords[0].id,
											'update_user_relation', '修改会员信息', {
												width : 500,
												height : 340,
												mask : true,
												maxable : false
											});
								} else {
									alertMsg.warn("请选择你要修改的一个会员");
								}
							});
					// 资金统计
					$("#statistics").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length == 1) {
									$.pdialog.open(
											'/userinfo/get_user_money?ids='
													+ selectedRecords[0].id,
											'user_money', '资金统计', {
												width : 440,
												height : 430,
												mask : true,
												maxable : false
											});
								} else {
									alertMsg.warn("请选择你要查看的一个会员");
								}
							});
					// 分配客服
					$("#recordborr")
							.click(
									function() {
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_list').omGrid(
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
					// 修改会员等级
					$("#updateisvip").click(
							function() {
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									$.pdialog.open('/userinfo/openisvip?id='
											+ selectedRecords[0].id
											+ '&username='
											+ selectedRecords[0].username,
											'purchase_list', '修改会员等级', {
												width : 420,
												height : 280,
												mask : true,
												maxable : false,
												resizable : false
											});
								} else {
									alertMsg.warn("您没有选择要修改会员等级的会员");
								}
							});
					// 借出记录
					$("#browinfo").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									$.pdialog.open(
											'/userinfo/openuserrecord?id='
													+ selectedRecords[0].id,
											'usertorecord_list', '借出记录', {
												width : 800,
												height : 460,
												mask : true,
												maxable : false,
												resizable : false
											});
								} else {
									alertMsg.warn("您没有选择要查看借出记录的会员");
								}
							});
					// 借入记录
					$("#browtoRecordinfo")
							.click(
									function() {
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_list').omGrid(
												'getSelections', true);
										// 判断用户是否选中数据
										if (selectedRecords.length == 1) {
											if (selectedRecords[0].isborr == 1) {
												$.pdialog
														.open(
																'/userinfo/openbborrowrecord?bid='
																		+ selectedRecords[0].id,
																'browtoRecord_list',
																'借入记录',
																{
																	width : 800,
																	height : 460,
																	mask : true,
																	maxable : false,
																	resizable : false
																});
											} else {
												alertMsg.warn("只有借款人才有借出记录");
											}
										} else {
											alertMsg.warn("请选择你要查看借入记录的一个会员");
										}
									});
					// 导出
					$("#user-table-excel").click(
							function() {

								var messgae = "是否导出所有会员信息到excel？";
								var url = encodeURI("/userinfo/table-to-excel?"
										+ $("#searchfrom").serialize());


								// 判断用户是否选中数据
								alertMsg.confirm(messgae, {
									okCall : function() {
										window.location.href = url;
										selectIds = [];
										$("#user_show_list").omGrid(
												"setSelections", selectIds);
									}
								});
							});

					// 推广信息
					$("#generinfo").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length > 0) {
									$.pdialog.open(
											'/generalizemoney/jume?url=generalizelist&ids='
													+ selectedRecords[0].id,
											'user_generalize_page', '会员推广信息', {
												width : 600,
												height : 460,
												mask : true,
												maxable : false,
												resizable : false
											});
								} else {
									alertMsg.warn("您没有选择要查看推广信息的会员");
								}
							});

					/***********************************************************
					 * 查询放款信息
					 */
					$("#selState")
							.click(
									function() {
										var ids = "";
										var selections = $('#user_show_list')
												.omGrid('getSelections', true);
										if (selections == null
												|| selections == ""
												|| selections == undefined
												|| selections.length < 1) {
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
																			|| selections[i].orderSn != ""
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
																								'#user_show_list')
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

					// 修改会员信息
					$("#update_authorization").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length == 1) {
									$.pdialog.open(
											'/userinfo/queryByAuthorization?id='
													+ selectedRecords[0].id,
											'update_authorization', '授权会员信息', {
												width : 600,
												height : 200,
												mask : true,
												maxable : false
											});
								} else {
									alertMsg.warn("请选择你要授权的会员信息");
								}
							});

					
					// 修改为借款人
					$("#updata_isCreditor").click(
							function() {
								// 获取选中行数据
								var selectedRecords = $('#user_show_list')
										.omGrid('getSelections', true);
								// 判断用户是否选中数据
								if (selectedRecords.length == 1) {
									$.pdialog.open(
											'/userinfo/queryByIsCreditor?id='
													+ selectedRecords[0].id,
											'updata_isCreditor', '修改为借款人信息', {
												width : 400,
												height : 200,
												mask : true,
												maxable : false
											});
								} else {
									alertMsg.warn("请选择你要是否修改为借款人的会员信息");
								}
							});
					
					
					// 修改会员信息
					$("#selTimeState").click(
							function() {
								$.pdialog.open('/userinfo/queryByTimeState',
										'update_timeState', '查询会员ID信息', {
											width : 400,
											height : 200,
											mask : true,
											maxable : false
										});
							});

					// 分配工号
					$("#update_userType")
							.click(
									function() {
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_list').omGrid(
												'getSelections', true);
										// 判断用户是否选中数据
										if (selectedRecords.length == 1) {
												$.pdialog
														.open(
																'/userinfo/queryByUserType?id='
																		+ selectedRecords[0].id,
																'update_userType',
																'分配工号信息',
																{
																	width : 400,
																	height : 150,
																	mask : true,
																	maxable : false
																});
										} else {
											alertMsg.warn("请选择你要分配工号的会员信息");
										}
									});

					
					// 分配企业编号信息
					$("#update_companyNo")
							.click(
									function() {
										// 获取选中行数据
										var selectedRecords = $(
												'#user_show_list').omGrid(
												'getSelections', true);
										// 判断用户是否选中数据
										if (selectedRecords.length == 1) {
											if (selectedRecords[0].user_type == 1) {
												$.pdialog
														.open(
																'/userinfo/queryByCompanyNo?id='
																		+ selectedRecords[0].id,
																'update_companyNo',
																'分配企业编号信息',
																{
																	width : 400,
																	height : 150,
																	mask : true,
																	maxable : false
																});
											} else {
												alertMsg.warn("已分配工号或企业编号！");
											}
										} else {
											alertMsg.warn("请选择你要分配编号的企业信息");
										}
									});
				});