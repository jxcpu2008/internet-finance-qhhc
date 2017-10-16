$(document)
		.ready(
				function() {
					//新标通知会员
					$("#newLoansignNotifyMember").click(
						function() {
							// 获取选中记录
							var selections = $('#myLoansignList').omGrid('getSelections', true);
							// 判断是否选中
							if (selections == null || selections == "" || selections.length < 1) {
								alertMsg.info("请选新标记录！");
							} else if (selections.length > 1) {
								alertMsg.info("请选择一条记录！");
							} else {
								loansignId = selections[0].id;
								var url ='/loanSign/newLoansignNotifyMember?loansignId='+loansignId;
								$.pdialog.open(url,'', '提示' , { width:411,height:178,mask:true,maxable:false });
							}
						});
					
					/** 确认通知 */
					$("#newLoansignMemberNotifyBtn").click(
						function() {
							$.ajax({
								url : '/loanSign/doNewLoansignMemberNotify',
								type : 'post',
								data : $("#newLoansignMemberNotifyForm").serialize(),
								success : function(data) {
									data = JSON.parse(data);
									var code = data.code;
									var msg = data.msg;
									if (code == "0") {
										$.pdialog.closeCurrent();
									}
									alertMsg.info(msg);
								}
							});
						}
					);
					
					// 导出
					$("#loansign-table-to-excel")
							.click(
									function() {

										var messgae = "是否导出所有项目信息到excel？";

										var url = encodeURI("/loanSign/loansign-table-to-excel?"
												+ $("#myloanlistsearchfrom")
														.serialize());
										// 判断用户是否选中数据
										alertMsg.confirm(messgae, {
											okCall : function() {
												window.location.href = url;
												selectIds = [];
												$("#myLoansignList").omGrid(
														"setSelections",
														selectIds);
											}
										});
									});

					// 数据源面板
					$('#myLoansignList').omGrid({
						dataSource : '/loanSign/loanSignList',
						title : '项目众持列表',
						height : 336,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 50,
							align : 'center'
						}, {
							header : '项目名称',
							name : 'xname',
							width : 150,
							align : 'center'
						}, {
							header : '项目类型',
							name : 'type',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if(v==2){
									return "普通众持";
								}else{
									return "短期众持";
								}
							}
						}, {
							header : '借款人',
							name : 'uname',
							align : 'center',
							width : 80
						}, {
							header : '借款金额',
							name : 'issueLoan',
							width : 120,
							align : 'center'
						}, {
							header : '最小借出单位',
							name : 'loanUnit',
							align : 'center',
							width : 100
						}, {
							header : '红包使用总额',
							name : 'redEnvelopeMoney',
							width : 80,
							align : 'center'
						}, {
							header : '借款利率',
							name : 'realRate',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v * 100 + "%";
							}
						}, {
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 120
						},  {
							header : '活动状态',
							name : 'activityStatus',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不参与";
								} else if (v == 1) {
									return "参与";
								}
							}
						},{
							header : '项目状态',
							name : 'status',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "未发布";
								} else if (v == 1) {
									return "进行中";
								} else if (v == 2) {
									return "融资成功";
								}
							}
						},{
							header : '平台服务费费率',
							name : 'companyFee',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						},{
							header : '平台服务费金额',
							name : 'feeMoney',
							align : 'center',
							width : 100
						}  , {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						}],

						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridRecord(id);
						}
					});
					// 搜索面板
					$("#myloanlist-search-panel").omPanel({
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
					$('#myloanlist-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					// 借款金额查询
					$("#issueLoanfind").omCombo({
						width : 120,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '全部',
							value : '0'
						}, {
							text : '100000以内',
							value : '1'
						}, {
							text : '100000~1000000',
							value : '2'
						}, {
							text : '1000000以上',
							value : '3'
						} ]
					});
					$("#typefind").omCombo({
						width : 70,
						editable : false,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : '0'
						}, {
							text : '普通众持',
							value : '2'
						}, {
							text : '短期众持',
							value : '3'
						}

						]
					});

					$("#recommendfind").omCombo({
						width : 70,
						forceSelection : true,
						editable : false,
						dataSource : [ {
							text : '全部',
							value : '2'
						}, {
							text : '不推荐',
							value : '0'
						}, {
							text : '推荐',
							value : '1'
						}

						]
					});
					$("#myloanlist-button-search").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/loanSign/loanSignList?"
										+ $("#myloanlistsearchfrom")
												.serialize());
								$('#myLoansignList').omGrid('setData', url);
							});

				});
/** **************数据源************* */
// 加载出借记录列表
var myGridRecord = function(id) {
	$("#myGridRecord").omGrid({
		dataSource : "/loanSign/loanrecordList?id=" + id,
		title : '出借记录',
		height : 320,
		limit : 10,
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
			align : 'center'
			
		}, {
			header : '特权会员',
			name : 'isPrivilege',
			align : 'center',
			width : 150
		}, {
			header : '投资类型',
			name : 'subType',
			align : 'center',
			width : 150
		}, {
			header : '红包金额',
			name : 'redEnvelope',
			align : 'center',
			width : 150
		} ]
	})
};

// 删除当前标
function delConfirmMsg() {
	var selections = $('#myLoansignList').omGrid('getSelections', true);
	if (selections.length == 0) {
		alertMsg.info("请选择删除的记录！");
		return;
	} else {

		var toDeleteRecordID = selections[0].id;
		alertMsg.confirm("您确定要删除当前记录？", {
			okCall : function() {
				$.ajax({
					data : 'id=' + toDeleteRecordID,
					url : '/baseLoanSign/deleteAll',
					type : 'post',
					success : function(msg) {
						if (msg == 1) {
							$('#myLoansignList').omGrid('reload');// 刷新当前页数据
							alertMsg.correct("删除数据成功");
						} else if (msg == 2) {
							$('#myLoansignList').omGrid('reload');// 刷新当前页数据
							alertMsg.info("只能删除未发布的借款标");
						} else {
							alertMsg.info("删除数据失败");
						}
					}
				});
			}
		});
	}
}

/*******************************************************************************
 * 流标
 */
$("#flowLoansign")
		.click(
				function() {
					var ids = "";
					var selections = $('#myLoansignList').omGrid(
							'getSelections', true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("您没有选择要进行流标的项目！");
					} else {
						alertMsg
								.confirm(
										"您确定要对此项目进行流标吗？",
										{
											okCall : function() {
												for ( var i in selections) {
													if (selections[i].status == 1) {
														ids += selections[i].id;
														$
																.ajax({
																	data : 'id='
																			+ ids,
																	url : '/loanSign/ipsLoanFlow',
																	type : 'post',
																	success : function(
																			msg) {
																		if (msg == "loanSign/central.htm") {
																			window
																					.open(msg);
																			alertMsg
																					.info("宝付已经受理流标请求,请稍后尝试刷新页面！");
																		} else if (msg == "1") {
																			alertMsg
																					.info("流标融资中有未支付或宝付已受理的数据！");
																		} else if (msg == "2") {
																			alertMsg
																					.info("项目流标成功，此项目无融资数据！");
																		} else {
																			alertMsg
																					.info(msg);
																			alertMsg
																					.info("流标失败,请尝试刷新页面！");
																		}
																		$(
																				'#myLoansignList')
																				.omGrid(
																						'reload');
																		$(
																				'#myGridRecord')
																				.omGrid(
																						'reload');
																	}
																});
													} else {
														alertMsg
																.info("只有未融资成功的项目才可以进行流标！");
														return false;
													}
												}
											}
										});
					}
				});

// 审核通过
$("#examineLoansign")
		.click(
				function() {
					var ids = "";
					var selections = $('#myLoansignList').omGrid(
							'getSelections', true);
					// 判断是否选中
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("您没有选择要申请审批满标的项目！");
					} else {
						alertMsg
								.confirm(
										"是否让选中的项目申请审批满标？",
										{
											okCall : function() {
												for ( var i in selections) {
													if (selections[i].status == 2
															|| selections[i].status == 1) {
														ids += selections[i].id
																+ ",";
														$
																.ajax({
																	url : '/loanSign/auditLoansignCredit',
																	data : 'ids='
																			+ ids,
																	type : 'post',
																	success : function(
																			msg) {
																		if (msg == 1) {
																			alertMsg
																					.correct("项目申请审批满标成功");
																		} else if (msg == 2) {
																			alertMsg
																					.correct("项目申请审批满标成功");
																		} else if (msg == 3) {
																			alertMsg
																					.correct("项目融资中有未支付或宝付已受理的数据！");
																		} else if (msg == 4) {
																			alertMsg
																					.correct("项目未融资成功，申请审批满标失败！");
																		} else {
																			alertMsg
																					.correct("项目申请审批满标失败");
																		}
																		$(
																				'#myLoansignList')
																				.omGrid(
																						'reload');
																		$(
																				'#myGridRecord')
																				.omGrid(
																						'reload');
																	}
																});
													} else {
														alertMsg
																.info("只有已满标的未申请审批的项目才能进行审批满标！");
														return false;
													}
												}
											}
										});
					}
				});

// 导出出借记录
$("#EXPLoanRecord")
		.click(
				function() {
					// 获取选中记录
					var selections = $('#myLoansignList').omGrid(
							'getSelections', true);
					// 判断是否选中
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择要导出的记录！");
					} else {
						// 得到选中的第一条记录
						var dataRow = selections[0];
						// 得到id
						var id = dataRow.id;
						window.location.href = "/loanSign/outLoanrecordExcel?id="
								+ id;
					}
				});

// 获取出借状态
$("#getLoanRecordState")
		.click(
				function() {
					var ids = "";
					var selections = $('#myGridRecord').omGrid('getSelections',
							true);
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择要进行查询投资的记录！");
						return false;
					}
					alertMsg
							.confirm(
									"您确定要对此数据进行投资查询吗？",
									{
										okCall : function() {
											for ( var i in selections) {
												if (selections[i].isSucceed == '待确认') {
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
																				.info("宝付待确认查询投资信息请求,请稍后尝试刷新页面！");
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
																				.info("刚投标未超过10分钟不允许进行宝付查询");
																	}
																	$(
																			'#myLoansignList')
																			.omGrid(
																					'reload');
																	$(
																			'#myGridRecord')
																			.omGrid(
																					'reload');
																}
															});
												} else {
													alertMsg
															.info("请选择状态为宝付已受理的投资记录信息！");
													return false;
												}
											}
										}
									});
				});

function openUserQuickQuery(v){
	if(v!=null){
		// 打开编辑页面属性一次为
		navTab.openTab("queryloanSign","/loanSign/getLoansignInfo?id="+ v, {
					title : "查看详情",
					fresh : true
				});
	}else{
		alertMsg.info("请选择一条信息查看");
	}
};

//参与活动申请
$("#activityLoansign").click(function() {
		var selections = $('#myLoansignList').omGrid('getSelections', true);
		// 判断是否选中
		if (selections == null || selections == ""|| selections == undefined || selections.length < 1) {
			alertMsg.info("您没有选择要申请参与活动的项目！");
		} else {
			alertMsg.confirm("是否让选中的项目申请参与活动？",{
						okCall : function() {
							for ( var i in selections) {
							if (selections[i].status == 1&&selections[i].activityStatus==0) {
									$.ajax({
											url : '/loanSign/activityLoansign',
											data : 'id='+selections[i].id,
											type : 'post',
											success : function(msg) {
												if (msg == 1) {
													alertMsg.correct("项目申请参与活动成功");
												} else if(msg==2) {
													alertMsg.correct("项目已满标或已参与活动");
												}else {
													alertMsg.correct("项目申请参与活动失败");
												}
												$('#myLoansignList').omGrid('reload');
												$('#myGridRecord').omGrid('reload');
											}
										});
								} else {
									alertMsg.info("只有未满标且未参与活动的项目才能申请参与活动！");
									return false;
								}
							}
						}
					});
			}
		});
// 初始化
myGridRecord(0);
