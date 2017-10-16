$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#loanCreditInfo-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#loanCreditInfoList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					
					var relaodFileTable = function() {
						$('#myGridLoanCreditInfo').omGrid('reload');
						return true;
					};
					$('#myGridLoanCreditInfo').omGrid({
						dataSource : '/loansignManage/loansignList?status=6',
						title : '项目列表',
						height : 336,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 45,
							align : 'center'
						}, {
							header : '项目名称',
							name : 'xname',
							width : 150,
							align : 'center'
						}, 
						{
							header : '项目类型',
							name : 'type',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if(v==2){
									return "普通众持";
								}else if(v==3){
									return "短期众持";
								}

							}
						},
						{
							header : '借款人',
							name : 'uname',
							align : 'center',
							width : 80
						}, 
						{
							header : '借款金额',
							name : 'issueLoan',
							width : 120,
							align : 'center'
						}, {
							header : '借款利率',
							name : 'realRate',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						}, 
						{
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 120
						},  {
							header : '项目状态',
							name : 'status',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								 if (v == 6) {
										return "已放款";
									}else if (v == 7) {
										return "还款中";
									}else if (v == 8) {
										return "已完成";
									}else if (v == 9) {
										return "已流标";
									}
							}
						},{
							header : '放款时间',
							name : 'creditTime',
							align : 'center',
							width : 120
						}, {
							header : '宝付状态',
							name : 'payState',
							width : 60,
							align : 'center',
							renderer : function(v, rowData, rowIndex) { 
								 if (v == 0) {
									return "待确认";
								}else if (v == 1) {
									return "已成功";
								}
							}
						},  {
							header : '平台服务费费率',
							name : 'companyFee',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						},{
							header : '平台服务费应收金额',
							name : 'feeMoney',
							align : 'center',
							width : 80
						},{
							header : '平台服务费实收金额',
							name : 'fee',
							align : 'center',
							width : 120
						},  {
							header : '推荐首页',
							name : 'recommend',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不推荐";
								} else if (v == 1) {
									return "推荐";
								}
							}
						},{
							header : '宝付账号',
							name : 'pMerBillNo',
							align : 'center',
							width : 100
						} , {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						} ],
						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridRecordCreditInfo(id);
							myGridRepayMentCreditInfo(id);
							myGridRecordMoney(id);
							myGridCompanyList(id);
						}
					});

					//搜索面板
					$("#loanCreditInfo-search-panel").omPanel({
				    	title : "高级搜索",
				    	collapsible:true,
				    	collapsed:true,
				    	onBeforeCollapse:function(event){
							$('.om-panel-title').omTooltip({
						        html : '可以通过单击，展开高级搜索面板哦'
						    });
						},
						onBeforeExpand:function(event){
							$('.om-panel-title').omTooltip({
						        html : '可以通过单击，收缩高级搜索面板哦'
						    });
						}
				    });

					//鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
				        html : '可以通过单击，展开高级搜索面板哦'
				    });
				 //搜索按钮
				 $('#loanCreditInfoList-button-search').omButton({
					 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
				 	});
				 
					//借款金额查询
				 $("#issueLoanfindCreditInfo").omCombo({
					width : 120,
					forceSelection:true,
					editable : false,
				    dataSource : [{text : '全部', value : '0'},
				                {text : '100000以内', value : '1'},
				                 {text : '100000~1000000', value : '2'},
				                 {text : '1000000以上', value : '3'}
				                 ]
				});
				 $("#typefindCreditInfo").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [ {text : '全部', value : '0'},
					                 {text : '普通众持', value : '2'},
					                 {text : '短期众持', value : '3'}
					                 ]
				});
				 
				 $("#recommendfindCreditInfo").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [
					                {text : '全部', value : '2'},
					                {text : '不推荐', value : '0'},
					                 {text : '推荐', value : '1'}
					                 ]
				});
								 
				 $("#loanCreditInfoList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/loansignManage/loansignList?status=6&"+$("#loanCreditInfoListSearchFrom").serialize());
					             $('#myGridLoanCreditInfo').omGrid('setData', url);
				 });																								
				});


//控制时间控件可选择的范围
var disFn = function disFn(date) {
	var nowMiddle = new Date();
	if (date > nowMiddle) {
		return false;
	}
}
// 发布开始时间
$("#beginpublishTime").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 发布结束时间
$("#endpublishTime").omCalendar({
	editable : false,
	disabledFn : disFn
});

//放款开始时间
$("#begincreditTime").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 放款结束时间
$("#endcreditTime").omCalendar({
	editable : false,
	disabledFn : disFn
});

//满标开始时间
$("#beginfullTime").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 满标结束时间
$("#endfullTime").omCalendar({
	editable : false,
	disabledFn : disFn
});


/** **************数据源************* */
// 加载出借记录列表
var myGridRecordCreditInfo = function(id) {
	$("#myGridRecordCreditInfo").omGrid({
						dataSource : "/loanSign/loanrecordList?id="
								+ id,
						title : '出借记录',
						height : 320,
						limit : 10,
						colModel : [{
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
						},  {
							header : '购买是否成功',
							name : 'isSucceed',
							width : 150,
							align : 'center'
						} ,{
							header:'特权会员',
							name:'isPrivilege',
							align:'center',
							width:150
						},{
							header:'投资类型',
							name:'subType',
							align:'center',
							width:150
						}, {
							header : '红包金额',
							name : 'redEnvelope',
							align : 'center',
							width : 150
						}]
					});
};
// 还款记录
var myGridRepayMentCreditInfo = function(id) {
	$("#myGridRepayMentCreditInfo").omGrid({
						dataSource : "/baseLoanSign/repaymentRecordList?id="
								+ id,
						title : '还款记录',
						height : 320,
						limit : 10,
						colModel : [ {
							header : 'ID',
							name : 'id',
							width : 40,
							align : 'center'
						},{
							header : '期数',
							name : 'periods',
							width : 55,
							align : 'center'
						}, {
							header : '预计还款时间',
							name : 'preRepayDate',
							align : 'center',
							width : 120
						}, {
							header : '优先预计还款金额',
							name : 'money',
							width : 120,
							align : 'center'
						},  {
							header : '夹层预计还款金额',
							name : 'middleMoney',
							width : 120,
							align : 'center'
						}, {
							header : '劣后预计还款金额',
							name : 'afterMoney',
							width : 120,
							align : 'center'
						},{
							header : '应收还款金额',
							name : 'sumMoney',
							width : 120,
							align : 'center'
						},{
							header : '应收平台服务费',
							name : 'companyPreFee',
							width : 120,
							align : 'center'
						},{
							header : '还款状态',
							name : 'repayState',
							width : 120,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "待还款";
								} else if (v == 2) {
									return "按时还款";
								}else if (v==3){
									return "逾期未还款";
								}else if (v==4){
									return "逾期已还款";
								}else if (v==5){
									return "提前还款";
								}
							}
						}, {
							header : '实际还款时间',
							name : 'repayTime',
							width : 120,
							align : 'center'
						}, {
							header : '优先实际还款金额',
							name : 'realMoney',
							width : 120,
							align : 'center'
						}, {
							header : '夹层实际还款金额',
							name : 'middleRealMoney',
							width : 120,
							align : 'center'
						}, {
							header : '劣后实际还款金额',
							name : 'afterRealMoney',
							width : 120,
							align : 'center'
						},{
							header : '实收还款金额',
							name : 'sumRealMoney',
							width : 120,
							align : 'center'
						} ,{
							header : '实收平台服务费',
							name : 'companyRealFee',
							width : 120,
							align : 'center'
						} ],
						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridrecordparticularsList(id);
						}
					});
};

/***
 * 还款明细
 */
var myGridrecordparticularsList = function(id) {
	$("#myGridrecordparticularsList").omGrid({
						dataSource : "/baseLoanSign/recordparticularsList?id="
								+ id,
						title : '还款记录',
						height : 320,
						limit : 10,
						colModel : [ {
							header : 'ID',
							name : 'id',
							width : 55,
							align : 'center'
						}, {
							header : '还款用户',
							name : 'userName',
							align : 'center',
							width : 120
						}, {
							header : '优先还款金额',
							name : 'money',
							width : 120,
							align : 'center'
						},  {
							header : '夹层还款金额',
							name : 'middleMoney',
							width : 120,
							align : 'center'
						}, {
							header : '劣后还款金额',
							name : 'afterMoney',
							width : 120,
							align : 'center'
						},{
							header : '还款状态',
							name : 'repState',
							width : 120,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "待还款";
								} else if (v == 1) {
									return "已还款";
								}else if (v==-1){
									return "还款失败";
								}
							}
						}]
					});
};

/** **************数据源************* */
//加载佣金转账记录
var myGridRecordMoney = function(id) {
	$("#myGridRecordMoney").omGrid({
						dataSource : "/generalizemoney/queryPageMoney?id="
								+ id,
						title : '佣金转账记录',
						height : 320,
						limit : 10,
						colModel : [{
							header : '被推荐人',
							name : 'refered_userid',
							width : 80,
							align : 'center'
						}, {
							header : '推荐人id',
							name : 'refer_userid',
							width : 80,
							align : 'center'
						},{
							header : '推荐人',
							name : 'referUseridName',
							width : 80,
							align : 'center'
						}, {
							header : '被推广人投资金额',
							name : 'tender_money',
							width : 120,
							align : 'center'
						}, {
							header : '被推广人投资时间',
							name : 'tender_time',
							width : 120,
							align : 'center'
						}, {
							header : '推广人应得佣金',
							name : 'bonuses',
							align : 'center',
							width : 120
						},  {
							header : '佣金发放状态',
							name : 'release_status',
							width : 120,
							align : 'center'
						} ,{
							header:'佣金发放时间',
							name:'release_time',
							align:'center',
							width:120
						},{
							header:'出借记录Id',
							name:'loanrecord_id',
							align:'center',
							width:120
						},{
							header:'出借订单号',
							name:'order_no',
							align:'center',
							width:150
						},{
							header:'转帐订单号',
							name:'trans_order_no',
							align:'center',
							width:150
						},{
							header:'奖金类型',
							name:'bonu_type',
							align:'center',
							width:120
						},{
							header:'实收佣金',
							name:'paid_bonuses',
							align:'center',
							width:120
						}, {
							header : '支付状态',
							name : 'pay_state',
							width : 120,
							align : 'center'
						} ]
					});
};

//导出出借记录
$("#EXPLoanRecordCreditInfo").click(function(){
	// 获取选中记录
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("请选择要导出的记录！");
	} else {
		// 得到选中的第一条记录
		var dataRow = selections[0];
		// 得到id
		var id = dataRow.id;
		window.location.href="/loanSign/outLoanrecordExcel?id="+id;
	}
});

//取消推荐
$("#loanrecom").click(function() {
			var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
			// 判断是否选中
			if (selections == null|| selections == ""|| selections == undefined|| selections.length < 1) {
				alertMsg.info("请选择要取消推荐的项目！");
			} else {
				// 得到选中的第一条记录
				var dataRow = selections[0];
				// 得到id
				var id = dataRow.id;
				alertMsg.confirm("您确定要取消推荐的项目？",{																																											
						okCall : function() {
							if(dataRow.recommend==0){
								alertMsg.info("项目未推荐！");
								return false;
							}
							$.ajax({
										url : '/loanSign/getRecommendnot',
										data : 'id='+ id,
										type : 'post',
										success : function(msg) {
											$('#myGridLoanCreditInfo').omGrid('reload');// 刷新当前页数据
											if(msg==2){
												alertMsg.correct("取消推荐成功");
											}else{
												alertMsg.info("取消推荐失败!");
											}
										}
								});
						}
					});
			}
});



//修改夹层劣后百分比
function updateLoansignRate() {
	//获取选中行数据
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要修改夹层劣后百分比'的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目修改夹层劣后百分比'?", {
				okCall : function() {
				    $.pdialog.open('/loanSignAudit/queryLoansignUpdateRate?id='+selections[i].id, 'uptAudit', '修改夹层劣后百分比' , { width:400,height:180 });
				}
			});
	}
}

//重新生成待还款数据
function updateFullBid() {
	//获取选中行数据
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要重新生成待还款的项目！");
	} else {	
			alertMsg.confirm("是否让选中的项目重新生成待还款?", {
				okCall : function() {
								$.ajax({
									url : '/loanSign/updateFullBid',
									data : 'id=' + selections[i].id,
									type : 'post',
									success : function(msg) {
										if (msg==1) {
											alertMsg.correct("重新生成待还款记录成功");
										} else {
											alertMsg.correct("重新生成待还款记录失败");				
										}
										$('#myGridLoanCreditInfo').omGrid('reload');
										$('#myGridRecordCreditInfo').omGrid('reload');	
										$('#myGridRepayMentCreditInfo').omGrid('reload');		
										$('#myGridrecordparticularsList').omGrid('reload');		
									}
								});
			          }
			});
	}
}


//重新生成待还款数据
function tranCertHBZZ() {
	//获取选中行数据
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要红包转账的项目！");
	} else {	
			alertMsg.confirm("是否让选中的项目进行红包转账?", {
				okCall : function() {
								$.ajax({
									url : '/baoFuLoanSign/ipsTranCertHBZZ.htm',
									data : 'loanId=' + selections[i].id,
									type : 'post',
									success : function(msg) {
										if (msg==1) {
											alertMsg.correct("红包转账成功");
										}else if(msg==3){
											alertMsg.correct("此项目未使用红包！");
										} else {
											alertMsg.correct("红包转账失败，或已转账！");				
										}
										$('#myGridLoanCreditInfo').omGrid('reload');
										$('#myGridRecordCreditInfo').omGrid('reload');	
										$('#myGridRepayMentCreditInfo').omGrid('reload');		
										$('#myGridrecordparticularsList').omGrid('reload');		
									}
								});
			          }
			});
	}
}


//查询还款状态
function shareBonusState() {
	//获取选中行数据
	var selections = $('#myGridRepayMentCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要查询还款的还款记录！");
	} else {	
			alertMsg.confirm("是否让选中的还款记录进行还款查询?", {
				okCall : function() {
								$.ajax({
									url : '/baoFuLoanSign/shareBonusState.htm',
									data : 'repayId=' + selections[i].id,
									type : 'post',
									success : function(msg) {
										if (msg=="CSD000") {
											alertMsg.correct("还款成功");
										}else if(msg=="1"){
											alertMsg.correct("此标今天未进行还款！");
										}else {
											alertMsg.correct("还款失败，或查询处理失败");				
										}
										$('#myGridLoanCreditInfo').omGrid('reload');
										$('#myGridRecordCreditInfo').omGrid('reload');	
										$('#myGridRepayMentCreditInfo').omGrid('reload');		
										$('#myGridrecordparticularsList').omGrid('reload');		
									}
								});
			          }
			});
	}
}



/***
 * 查询放款信息
 */
$("#selCreditLoan").click(function() {
	var ids="";
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined|| selections.length < 1) {
	  	alertMsg.info("请选择一条项目信息数据！");
		 return false;
	}
	  alertMsg.confirm("您确定对此项目进行放款查询吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].payState==0){
										    	ids +=selections[i].id;
										    	$.ajax({
													data : 'id='+ ids,
													url : '/loansignManage/ipsFullLoanNum',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付已受理查询放款请求,请稍后尝试刷新页面！");
														}else if(msg=="2") {
															alertMsg.info("宝付项目放款查询失败,请尝试刷新页面！");
														}else if(msg=="3") {
															alertMsg.info("非宝付项目放款查询返回数据,请尝试刷新页面！");
														}else if(msg=="4") {
															alertMsg.info("宝付项目放款查询处理失败,请尝试刷新页面！");
														}else if(msg=="-1"){
															alertMsg.info("宝付项目放款失败，请到放款审核的项目中重新进行放款！");
														}
														$('#myGridLoanCreditInfo').omGrid('reload');
														$('#myGridRecordCreditInfo').omGrid('reload');	
														$('#myGridRepayMentCreditInfo').omGrid('reload');		
														$('#myGridrecordparticularsList').omGrid('reload');		
													}
												});
										}else{
											alertMsg.info("请选择状态为待确定的项目进行放款查询！");
											return false;
									}
								}
						}
				});
});


/***
 * 佣金放款
 */
$("#updateGeneralizemoney").click(function() {
	var ids="";
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
	  	alertMsg.info("请选择一条项目信息数据！");
		 return false;
	}
	  alertMsg.confirm("您确定对此项目进行佣金转账吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].payState==1){
										    	ids +=selections[i].id;
										    	$.ajax({
													data : 'loanId='+ ids,
													url : '/generalizemoney/ipsTransBonuses',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付佣金转账已成功,请稍后尝试刷新页面！");
														}else if(msg=="0") {
															alertMsg.info("宝付佣金转账失败,请尝试刷新页面！");
														}else if(msg=="-1"){
															alertMsg.info("佣金转账失败,请联系客服！");
														}else if(msg=="2"){
															alertMsg.info("没有需要转账的佣金记录，不能进行佣金转账");
														}else if(msg=="3"){
															alertMsg.info("宝付佣金转账返回失败，请尝试刷新页面！");
														}else if(msg=="4"){
															alertMsg.info("无此权限！");
														}else if(msg=="5"){
															alertMsg.info("请勿操作，后台正在进行佣金转账！");
														}
													}
												});
										}else{
											alertMsg.info("请选择状态为已成功的项目进行佣金转账！");
											return false;
									}
								}
						}
				});
});

//导出
$("#fullLoansign").click(function(){
	 var messgae="是否导出所有项目信息到excel？";
	 var id="";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
				if (selections.length > 0) {
					// 得到选中的第一条记录
					var dataRow = selections[0];
					// 得到id
					 id = dataRow.id;
				}
				window.location.href = "/loansignManage/loansign-table-to-excel?id=" + id
			}
	});
});

//导出
$("#outRepaymentrecord").click(function(){
	 var messgae="是否导出所有还款记录信息到excel？";
	 var id="";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
				if (selections.length > 0) {
					// 得到选中的第一条记录
					var dataRow = selections[0];
					// 得到id
					 id = dataRow.id;
				}
				window.location.href = "/loansignManage/outRepaymentrecord?id=" + id
			}
	});
});

//导出
$("#outGeneralizeMoney").click(function(){
	 var messgae="是否导出所有佣金转账记录到excel？";
	 var id="";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
				if (selections.length > 0) {
					// 得到选中的第一条记录
					var dataRow = selections[0];
					// 得到id
					 id = dataRow.id;
				}
				window.location.href = "/generalizemoney/outGeneralizeMoney?id=" + id
			}
	});
});

//导出
$("#outParticulars").click(function(){
	 var messgae="是否导出所有还款明细记录到excel？";
	 var id="";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
				if (selections.length > 0) {
					// 得到选中的第一条记录
					var dataRow = selections[0];
					// 得到id
					 id = dataRow.id;
				}
				window.location.href = "/loansignManage/outParticulars?id=" + id
			}
	});
});

//查询余额
function selLoansignAccount() {
	var ids = "";
	// 获取选中行数据
	var selections = $('#myGridLoanCreditInfo').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选中要查询余额的项目融资人！");
	} else {
		alertMsg.confirm("是否对选中的会员信息进行余额查询?", {
			okCall : function() {
				for ( var i in selections) {
					if (selections[i].pMerBillNo != ""
							&& selections[i].pMerBillNo != null) {
						ids += selections[i].id;
					} else {
						alertMsg.info("只有注册过宝付账户的项目融资人才能进行余额查询！");
						return false;
					}
				}
				$.pdialog.open(
						'/FundsAccount/ipsSelFundsAccount?status=2&userId=' + ids,
						'selFundsAccount', '余额显示', {
							width : 450,
							height : 200
						});
			}
		});
	}
}

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


var myGridCompanyList = function(id) {
	$('#myGridCompanyList').omGrid({
		height : 340,
		dataSource : '/admin_account/query_by_company?id='+ id,
		limit : 10,
		title : '收取平台服务费流水',
		autoFit : true,
		emptyMsg : '暂时还没有数据',
		colModel : [ {
			header : '日期',
			name : 'time',
			width : 80,
			align : 'center'
		}, {
			header : '类型',
			name : 'explan',
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
		}, {
			header : '订单号',
			name : 'ipsNumber',
			align : 'center',
			width : 100
		} ]
	});
}

//根据放款金额统计总额
$("#sumMoney").click(function() {
      var  begincreditTime=$("#begincreditTime").val();
      var endcreditTime=$("#endcreditTime").val();
	  $.pdialog.open('/loansignManage/sumMoney?begincreditTime='+begincreditTime+'&endcreditTime='+endcreditTime, 'sumMoney', '统计总额' , { width:400,height:420 });
})
//初始化
myGridRecordCreditInfo(0);
myGridRepayMentCreditInfo(0);
myGridrecordparticularsList(0);
myGridRecordMoney(0);
myGridCompanyList(0);