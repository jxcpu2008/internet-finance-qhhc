$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#loanAudit-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#loanAuditList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					
					var relaodFileTable = function() {
						$('#myGridLoanAudit').omGrid('reload');
						return true;
					};
					$('#myGridLoanAudit').omGrid({
						dataSource : '/loanSignAudit/auditList?stateNum=4',
						title : '项目众筹放款审核',
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
						}, 
						{
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
						},
						 {
							header : '还款类型',
							name : 'refunway',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "按月还款";
								}  else if (v == 2) {
									return "按季度还款";
								} else if (v == 3) {
									return "天标还款";
								} else if (v == 4) {
									return "等本等息还款";
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
						}, 
						{
							header : '借款利率',
							name : 'realRate',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						},{
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 120
						}, {
							header : '平台服务费收取方式',
							name : 'feeMethod',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "本金中扣除";
								}  else if (v == 2) {
									return "额外支付";
								}
							}
						}, {
							header : '收取平台服务费状态',
							name : 'feeState',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "已收取";
								}  else if (v == 2) {
									return "未收取";
								} else if (v == 0) {
									return "待确认";
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
						}, {
							header : '项目状态',
							name : 'status',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if (v == 4) {
									return "待审核";
								} 
							}
						}, {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						} ],
						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridRecordAudit(id);
							myGridRepayMent(id);
						}
					});

					//搜索面板
					$("#loanAudit-search-panel").omPanel({
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
				 $('#loanAuditList-button-search').omButton({
					 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
				 	});
				 
					//借款金额查询
				 $("#issueLoanfindAudit").omCombo({
					width : 120,
					forceSelection:true,
					editable : false,
				    dataSource : [{text : '全部', value : '0'},
				                {text : '100000以内', value : '1'},
				                 {text : '100000~1000000', value : '2'},
				                 {text : '1000000以上', value : '3'}
				                 ]
				});
				 $("#typefindAudit").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [ {text : '全部', value : '0'},
					                 {text : '普通众持', value : '2'},
					                 {text : '短期众持', value : '3'}
					                 ]
				});
				 
				 $("#recommendfindAudit").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [
					                {text : '全部', value : '2'},
					                {text : '不推荐', value : '0'},
					                 {text : '推荐', value : '1'}
					                 ]
				});
								 
				 $("#loanAuditList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/loanSignAudit/auditList?stateNum=4&"+$("#loanAuditListSearchFrom").serialize());
					             $('#myGridLoanAudit').omGrid('setData', url);
				 });																								
				});

/** **************数据源************* */
// 加载出借记录列表
var myGridRecordAudit = function(id) {
	$("#myGridRecordAudit").omGrid({
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
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v;
							}
						} ,{
							header:'特权会员',
							name:'isPrivilege',
							align:'center',
							width:150,
							renderer : function(v, rowData, rowIndex) {
								return v;
							}
						},{
							header:'投资类型',
							name:'subType',
							align:'center',
							width:150,
							renderer : function(v, rowData, rowIndex) {
								return v;
							}
						}, {
							header : '红包金额',
							name : 'redEnvelope',
							align : 'center',
							width : 150
						}]
					});
};
// 还款记录
var myGridRepayMent = function(id) {
	$("#myGridRepayMent").omGrid({
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
						} ,{
							header : '实收平台服务费',
							name : 'companyRealFee',
							width : 120,
							align : 'center'
						}],		// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridparticularsListAudit(id);
						}
					});
};

/***
 * 还款明细
 */
var myGridparticularsListAudit = function(id) {
	$("#myGridparticularsListAudit").omGrid({
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





//导出出借记录
$("#EXPLoanRecordAudit").click(function(){
	// 获取选中记录
	var selections = $('#myGridLoanAudit').omGrid('getSelections', true);
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

//收取平台费服务费
function updateFeeLoan() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridLoanAudit').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要收取平台服务费的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目收取平台服务费?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].feeMethod==2){
								if(selections[i].feeState==2){
									$.ajax({
										url : '/loanSignAudit/loansignUpdateFee',
										data : 'id=' + selections[i].id,
										type : 'post',
										success : function(msg) {
											if (msg==1) {
												alertMsg.info("收取平台服务费成功！");
											}else if(msg==3){
												alertMsg.info("可用余额不足，不能收取平台服务费");
											}else if(msg==4){
												alertMsg.info("只有未收取平台服务费的项目才能进行操作！");
											} else {
												alertMsg.info("收取平台服务费失败！");
											}
											$('#myGridLoanAudit').omGrid('reload');
											$('#myGridRepayMent').omGrid('reload');		
											$('#myGridparticularsListAudit').omGrid('reload');		
										}
									});
								}else{
									alertMsg.info("只有未收取平台服务费的项目才能进行操作！");
									return false;
								}
						}else{
							alertMsg.info("只有平台服务费收取方式为额外支付的项目才能进行操作！");
							return false;
						}
					}						
				}
			});
	}
}

//审核通过
function auditLoansign() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridLoanAudit').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要审核放款的项目！");
	} else {	
		var selMsg="";
		if(selections[i].refunway==4||selections[i].feeMethod==2){
			selMsg="<p style='font-size:16px;'>融资总额："+selections[i].issueLoan+"元<br/>实际到账："+selections[i].issueLoan+"元</p>"
		}else{
			var sumMoney=selections[i].issueLoan-selections[i].feeMoney;
			selMsg="<p style='font-size:16px;'>融资总额："+selections[i].issueLoan+"元<br/>扣除服务费："+selections[i].feeMoney+"元<br/>实际到账："+sumMoney+"元</p>";
		}
		 alertMsg.confirm(selMsg, {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].status==4){
							$.ajax({
								url : '/loanSignAudit/approvalOrAudit',
								data : 'id=' + selections[i].id+'&stateNum=2&status=5',
								type : 'post',
								success : function(msg) {
									if (msg==1) {
										alertMsg.info("审核通过成功！");
									}else if(msg==4){
										alertMsg.info("收取方式为额外支付的，必须先收取平台服务费再进行放款！");
									}else if(msg==5){
										alertMsg.info("项目标放款金额与实际金额不一致，存在红包问题！");
									}else if(msg=="loanSign/central.htm") {		
										window.open(msg);
										alertMsg.info("宝付已经受理放款请求,请稍后尝试刷新页面！");
									} else {
										alertMsg.info("审核通过失败！");
									}
									$('#myGridLoanAudit').omGrid('reload');
									$('#myGridRepayMent').omGrid('reload');		
									$('#myGridparticularsListAudit').omGrid('reload');		
								}
							});
						}else{
							alertMsg.info("只有未审核的项目才能审核放款！");
							return false;
						}
					}						
				}
			});
	}
}
// 审核不通过
function notAuditLoanAudit() {
	var ids="";
	var selections = $('#myGridLoanAudit').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要审核的项目！");
	} else {
		alertMsg.confirm("是否让选中的项目申请不通过审核?", {
			okCall : function() {
				for (var i in selections) {
					if(selections[i].status==4&&selections[i].feeState!=1){
							$.ajax({
								url : '/loanSignAudit/approvalOrAudit',
								data : 'id=' + selections[i].id+'&stateNum=2&status=3',
								type : 'post',
								success : function(msg) {
									if (msg==2) {
										alertMsg.correct("审核不通过处理成功");
									} else {
										 alertMsg.info("审核不通过处理失败！");
									}
									$('#myGridLoanAudit').omGrid('reload');
									$('#myGridRepayMent').omGrid('reload');		
									$('#myGridparticularsListAudit').omGrid('reload');		
								}
							});
					}else{
						alertMsg.info("只有未审核，未收取平台服务费的项目申请才能进行审核不通过！");
						return false;
					}
				
				}	
			}
		});
	}
}

//收取平台服务费
function selLoanFeeState() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridLoanAudit').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要查询平台服务费是否收取成功的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目进行查询平台服务服查询?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].feeMethod==2){
								if(selections[i].status==4&&selections[i].feeState==0){
									$.ajax({
										url : '/loanSignAudit/selLoanFeeState',
										data : 'id=' + selections[i].id,
										type : 'post',
										success : function(msg) {
											if (msg==1) {
												alertMsg.info("查询平台服务费收取成功！");
											}else if(msg==2){
												alertMsg.info("只有未审核，待确认收取的平台服务费项目才可以进行查询！");
											}else {
												alertMsg.info("查询平台服务费收取失败！");
											}
											$('#myGridLoanAudit').omGrid('reload');
											$('#myGridRepayMent').omGrid('reload');		
											$('#myGridparticularsListAudit').omGrid('reload');		
										}
									});
								}else{
									alertMsg.info("只有未审核，待确认收取的平台服务费项目才可以进行查询！");
									return false;
								}
						}else{
							alertMsg.info("只有平台服务费收取方式是额外支付的项目才可以进行查询！");
							return false;
						}
					}						
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


//初始化
myGridRecordAudit(0);
myGridRepayMent(0);
myGridparticularsListAudit(0);