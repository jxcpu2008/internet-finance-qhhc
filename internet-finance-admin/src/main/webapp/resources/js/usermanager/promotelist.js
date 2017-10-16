$(document)
		.ready(
				function() {
					$("#promotelist_show_list").omGrid({
						dataSource : "/userinfo/queryGenlizeUserPage",
						title : '会员列表',
						height : 380,
						limit : 10,
						method : 'POST',
						emptyMsg : '暂时还没有您想要的数据',
						colModel : [ {
							header : '编号',
							name : 'id',
							width : 120,
							align : 'center'
						}, {
							header : '会员名称',
							name : 'username',
							align : 'center',
							width : 120
						}, {
							header : '真实姓名',
							name : 'realname',
							width : 150,
							align : 'center'
						}, {
							header : '员工编号',
							name : 'staff_no',
							width : 120,
							align : 'center'
						}, {
							header : '积分',
							name : 'userintegral',
							width : 120,
							align : 'center'
						}, {
							header : '推荐人数',
							name : 'gencount',
							width : 120,
							align : 'center'
						}, {
							header : '推荐人认购金额',
							name : 'genAcoumt',
							width : 120,
							align : 'center'
						}, {
							header : '是否禁用',
							name : 'islock',
							width : 120,
							align : 'center'
						}, {
							header : '注册时间',
							name : 'createTime',
							width : 120,
							align : 'center'
						} ],
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							genlizeList(id);
						}
					});

					// 搜索面板
					$("#userPro-search-panel").omPanel({
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

					// 搜索按钮
					$('span#userPro-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					// 搜索按钮单击事件
					$("#userPro-button-search")
							.click(
									function() {

										if ($("#genUserRecordList").find('tr').length == 0) {
											alertMsg.info("请先选择推荐人！");
										} else {
											var ajaxbg = $("#background,#progressBar");
											ajaxbg.show();
											var selections = $(
													'#userGenlizeList').omGrid(
													'getSelections', true);
											var url = encodeURI("/userinfo/queryGenlizeRecord?"
													+ $("#searchPromotefrom")
															.serialize()
													+ "&id=" + selections[0].id);
											$('#genUserRecordList').omGrid(
													'setData', url);
										}

									});
					// 第一个
					$("#userPromote-search-panel").omPanel({
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

					// 搜索按钮
					$('span#userPromote-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					// 搜索按钮单击事件
					$("#userPromote-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/userinfo/queryGenlizeUserPage?"
												+ $("#searchProListfrom")
														.serialize());
										$('#promotelist_show_list').omGrid(
												'setData', url);

									});
					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					// 注册时间
					$("#start-time-pro").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#end-time-pro").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#startTime1").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#endTime1").omCalendar({
						editable : false,
						disabledFn : disFn
					});

					// 导出推广记录
					$("#promoteOut")
							.click(
									function() {
										// 获取选中记录
										var selections = $(
												'#promotelist_show_list')
												.omGrid('getSelections', true);

										// 判断是否选中
										if (selections == null
												|| selections == ""
												|| selections == undefined
												|| selections.length < 1) {
											alertMsg.info("请选择要导出的记录！");
										} else {
											if ($("#userGenlizeList")
													.find('tr').length == 0) {
												alertMsg.info("无数据！");
											} else {
												window.location.href = "/userinfo/GeneralizeExcel?id="
														+ selections[0].id;
											}

										}
									})
				});

$("#userPromoteRecordOut")
		.click(
				function() {
					var selectionsOne = $('#promotelist_show_list').omGrid(
							'getSelections', true);

					if (selectionsOne == null || selectionsOne == ""
							|| selectionsOne == undefined
							|| selectionsOne.length < 1) {
						alertMsg.info("请选择要导出的会员的投资记录！");
					} else {
						// 获取选中记录
						var selections = $('#userGenlizeList').omGrid('getSelections', true);
						// 判断是否选中
						if (selections == null || selections == ""
								|| selections == undefined
								|| selections.length < 1) {
							alertMsg.info("请选择要导出的记录！");
						} else {
							if ($("#genUserRecordList").find('tr').length == 0) {
								alertMsg.info("无数据！");
							} else {
								// 得到选中的第一条记录
								var dataRow = selections[0];
								// 得到id
								var id = dataRow.id;
								// alert(id);
								window.location.href = "/userinfo/outLoanrecordExcel?id="
										+ id;
							}

						}
					}

				});

// 加载推广记录列表
var genlizeList = function(id) {
	$("#userGenlizeList").omGrid({
		dataSource : "/userinfo/queryGenlizeList?id=" + id,
		title : '推广记录',
		height : 320,
		limit : 10,
		colModel : [ {
			header : '编号',
			name : 'id',
			width : 120,
			align : 'center'
		}, {
			header : '被推广人用户名',
			name : 'uanme',
			width : 150,
			align : 'center'
		}, {
			header : '推广人真实姓名',
			name : 'name',
			width : 120,
			align : 'center'
		}, {
			header : '推广时间',
			name : 'adddate',
			width : 150,
			align : 'center'
		}, {
			header : '被推广人状态',
			name : 'state',
			align : 'center',
			width : 150,
			renderer : function(v, rowData, rowIndex) {
				if (v == 1) {
					return "初始注册";
				} else if (v == 2) {
					return "已注册宝付";
				}
			}
		} ],
		onRowSelect : function(index, rowData, event) {
			// 取到该行id值
			var id = rowData["id"];
			genUserRecordList(id);
		}
	})
};

// 加载出借记录列表
var genUserRecordList = function(id) {
	$("#genUserRecordList").omGrid({
		dataSource : "/userinfo/queryGenlizeRecord?id=" + id,
		title : '出借记录',
		height : 320,
		limit : 10,
		emptyMsg : '暂时还没有您想要的数据',
		colModel : [ {
			header : '记录ID',
			name : 'id',
			width : 120,
			align : 'center'
		}, {
			header : '项目名称',
			name : 'xname',
			width : 120,
			align : 'center'
		}, {
			header : '用户名',
			name : 'uname',
			width : 150,
			align : 'center'
		}, {
			header : '购买金额',
			name : 'tenderMoney',
			width : 150,
			align : 'center'
		}, {
			header : '购买时间',
			name : 'tenderTime',
			align : 'center',
			width : 150
		}, {
			header : '购买是否成功',
			name : 'isSucceed',
			width : 150,
			align : 'center',
			renderer : function(v, rowData, rowIndex) {
				if (v == 0) {
					return "未支付";
				} else if (v == 1) {
					return "成功";
				} else if (v == -1) {
					return "失败";
				} else if (v == 2) {
					return "宝付已受理";
				}
			}
		}, {
			header : '投资类型',
			name : 'subType',
			align : 'center',
			width : 150,
			renderer : function(v, rowData, rowIndex) {
				if (v == 1) {
					return "优先";
				} else if (v == 2) {
					return "夹层";
				} else if (v == 3) {
					return "劣后";
				}

			}
		} ]
	})
};