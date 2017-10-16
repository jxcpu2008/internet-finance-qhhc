$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#FundsAccount-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#FundsAccount-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#myGridFundsAccount').omGrid('reload');
						return true;
					};
					// 店铺列表
					$("#myGridFundsAccount")
							.omGrid(
									{
										dataSource : '/FundsAccount/querList',
										height : 330,
										limit : 10,
										autoFit : true,
										onRowClick : function(rowIndex,
												rowData, event) {
											if (rowData.id) {
												$('#user_money_list').omGrid(
														'setData',
														'/admin_account/query_by_user?ids='
																+ rowData.id);
												$('#myGridFundsRecord').omGrid(
														'setData',
														'/FundsAccount/loanrecordList?id='
																+ rowData.id);
											}
										},
										colModel : [
												{
													header : '用户ID',
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
													width : 120
												},
												{
													header : '宝付账户',
													name : 'pMerBillNo',
													align : 'center',
													width : 120
												},
												{
													header : '会员等级',
													name : 'vipendtime',
													align : 'center',
													width : 120,
													renderer : function(v,
															rowData, rowIndex) {
														if (null != v
																&& v != "") {
															return "特权会员";
														} else {
															return "普通会员";
														}
													}
												},
												{
													header : '会员期限',
													name : 'vipendtime',
													align : 'center',
													width : 190,
													renderer : function(v,
															rowData, rowIndex) {
														if (null != v
																&& v != "") {
															return v;
														} else {
															return "永久";
														}
													}
												},
												{
													header : '是否为融资人',
													name : 'isborr',
													align : 'center',
													width : 120,
													renderer : function(v,
															rowData, rowIndex) {
														if (v > 0) {
															return "是";
														} else {
															return "否";
														}
													}
												}, {
													header : '手机号码',
													name : 'phone',
													align : 'center',
													width : 120
												}, {
													header : '状态',
													name : 'isLock',
													align : 'center',
													width : 120
												}, {
													header : '客服',
													name : 'adminname',
													align : 'center',
													width : 120
												} ]
									});

					$('#user_money_list').omGrid({
						// width:'fit',
						height : 340,
						dataSource : '/admin_account/query_by_user',
						limit : 10,
						title : '资金明细账',
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
							header : '费用',
							name : 'fee',
							align : 'center',
							width : 80
						}, {
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

					/** **************数据源************* */
					// 加载出借记录列表
					$("#myGridFundsRecord").omGrid({
						dataSource : "/FundsAccount/loanrecordList?id=0",
						title : '投资记录',
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
							header : '订单号',
							name : 'orderId',
							align : 'center',
							width : 200
						}, {
							header : '投资类型',
							name : 'subType',
							align : 'center',
							width : 150
						} ]
					});

					// 特权会员下拉框
					$("#search-type").omCombo({
						width : 70,
						forceSelection : true,
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

					// 搜索面板
					$("#FundsAccount-search-panel").omPanel({
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

					$("#FundsAccount-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/FundsAccount/querList?"
												+ $("#searchFundsAccountForm")
														.serialize());
										$('#myGridFundsAccount').omGrid(
												'setData', url);
									});
				});

// 控制时间控件可选择的范围
var disFn = function disFn(date) {
	var nowMiddle = new Date();
	if (date > nowMiddle) {
		return false;
	}
}
// 申请开始时间
$("#selTimebegin").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 申请结束时间
$("#selTimeEnd").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 查询余额
function selFundsAccount() {
	var ids = "";
	// 获取选中行数据
	var selections = $('#myGridFundsAccount').omGrid('getSelections', true);
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
// 查询银行卡信息
function selBankCard() {
	var ids = "";
	// 获取选中行数据
	var selections = $('#myGridFundsAccount').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要查询银行账户的会员信息！");
	} else {
		alertMsg.confirm("是否对选中的会员信息进行银行卡查询?", {
			okCall : function() {
				for ( var i in selections) {
					if (selections[i].pMerBillNo != ""
							&& selections[i].pMerBillNo != null) {
						ids += selections[i].id;
					} else {
						alertMsg.info("只有注册过宝付账户的会员才能进行银行账户信息查询！");
						return false;
					}
				}
				$.pdialog.open('/FundsAccount/ipsSelUserBank?userId=' + ids,
						'selFundsAccount', '个人银行账户信息', {
							width : 720,
							height : 320
						});
			}
		});
	}
}

// 导出出借记录
function FundsLoanRecord() {
	// 获取选中记录
	var selections = $('#myGridFundsAccount').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("请选择要导出的记录！");
	} else {
		// 得到选中的第一条记录
		var dataRow = selections[0];
		// 得到id
		var id = dataRow.id;
		window.location.href = "/FundsAccount/FundsLoanRecordExcel?id=" + id
				+ "&" + $("#searchFundsAccountForm").serialize();
	}
};

// 一键导出所有出借记录
function FundsLoanRecordAll() {
	window.location.href =  encodeURI("/FundsAccount/FundsLoanAllRecordExcel?"+ $("#searchFundsAccountForm").serialize());
};
// 导出资金明细
function FundsAccountinfo() {
	// 获取选中记录
	var selections = $('#myGridFundsAccount').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("请选择要导出的记录！");
	} else {
		// 得到选中的第一条记录
		var dataRow = selections[0];
		// 得到id
		var id = dataRow.id;
		window.location.href = encodeURI( "/FundsAccount/FundsAccountinfoExcel?id=" + id+ "&" + $("#searchFundsAccountForm").serialize());
	}
};

//一键导出所有资金明细
function FundsAccountinfoAll() {
	window.location.href = encodeURI( "/FundsAccount/FundsAccountinfoAllExcel?"+ $("#searchFundsAccountForm").serialize());
};

