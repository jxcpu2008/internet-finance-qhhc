$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#loanApproval-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#loanApprovalList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					
					var relaodFileTable = function() {
						$('#myGridLoanApproval').omGrid('reload');
						return true;
					};
					$('#myGridLoanApproval').omGrid({
						dataSource : '/loanSignAudit/auditList?stateNum=3',
						title : '项目众筹放款审批',
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
							header : '投资状态',
							name : 'remoney',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "已满标";
								} else if (v != 0) {
									return "未满标";
								}
							}
						}, {
							header : '项目状态',
							name : 'status',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								if (v == 3) {
									return "待审批";
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
						} , {
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
							myGridRecordApproval(id);
						}
					});

					//搜索面板
					$("#loanApproval-search-panel").omPanel({
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
				 $('#loanApprovalList-button-search').omButton({
					 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
				 	});
				 
					//借款金额查询
				 $("#issueLoanfindApproval").omCombo({
					width : 120,
					editable : false,
					forceSelection:true,
				  dataSource : [{text : '全部', value : '0'},
				                {text : '100000以内', value : '1'},
				                 {text : '100000~1000000', value : '2'},
				                 {text : '1000000以上', value : '3'}
				                 ]
				});
				 $("#typefindApproval").omCombo({
						width : 70,
						editable : false,
						forceSelection:true,
					  dataSource : [ {text : '全部', value : '0'},
					                 {text : '普通众持', value : '2'},
					                 {text : '短期众持', value : '3'}
					                 ]
				});
				 
				 $("#recommendfindApproval").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [
					                {text : '全部', value : '2'},
					                {text : '不推荐', value : '0'},
					                 {text : '推荐', value : '1'}
					                 ]
				});
								 
				 $("#loanApprovalList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/loanSignAudit/auditList?stateNum=3&"+$("#loanApprovalListSearchFrom").serialize());
					             $('#myGridLoanApproval').omGrid('setData', url);
				 });																								
				});

/** **************数据源************* */
//加载出借记录列表
var myGridRecordApproval = function(id) {
	$("#myGridRecordApproval").omGrid({
						dataSource : "/loanSign/loanrecordList?id="
								+ id,
						title : '出借记录',
						height : 320,
						limit : 10,
						colModel : [{
							header : '项目名称',
							name : 'xname',
							width : 150,
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

// 审批通过
function ApprovalLoansign() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridLoanApproval').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要审批的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目申请通过审批?", {
				okCall : function() {
						if(selections[i].status==3){
							$.ajax({
								url : '/loanSignAudit/loanAuditPass?id='+selections[i].id+'&stateNum=1&status=4',
								type : 'post',
								success : function(msg) {
									if (msg == "2") {
										$('#myGridLoanApproval').omGrid('reload');// 刷新当前页
										$('#myGridRecordApproval').omGrid('reload');// 刷新当前页
										alertMsg.correct("满标审批成功！");
									} else {
										alertMsg.info("满标审批失败！");
									}
								}
							});
						}else{
							alertMsg.info("只有未审批的申请才能进行项目审批！");
							return false;
						}
				}
			});
	}
}

//修改平台服务费年利率
function updateCompanyFee() {
	//获取选中行数据
	var selections = $('#myGridLoanApproval').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要修改平台服务费年利率的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目修改平台服务费年利率?", {
				okCall : function() {
				    $.pdialog.open('/loanSignAudit/queryCompanyFee?id='+selections[i].id, 'uptAudit', '修改平台服务费年利率' , { width:400,height:180 });
				}
			});
	}
}

//修改借款人利率
function updateLoansign() {
	//获取选中行数据
	var selections = $('#myGridLoanApproval').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要修改借款人利率的项目！");
	} else {	
		 alertMsg.confirm("是否让选中的项目修改借款人利率?", {
				okCall : function() {
				    $.pdialog.open('/loanSignAudit/queryLoansignUpdate?id='+selections[i].id, 'uptAudit', '修改借款人利率' , { width:400,height:180 });
				}
			});
	}
}


//导出出借记录
$("#EXPLoanRecordApproval").click(function(){
	// 获取选中记录
	var selections = $('#myGridLoanApproval').omGrid('getSelections', true);
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
myGridRecordApproval(0);
