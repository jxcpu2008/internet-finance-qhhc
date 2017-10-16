$(document)
		.ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#loanFlowInfo-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#loanFlowInfoList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					
					var relaodFileTable = function() {
						$('#myGridLoanFlowInfo').omGrid('reload');
						return true;
					};
					$('#myGridLoanFlowInfo').omGrid({
						dataSource : '/loansignManage/loansignList?status=9',
						title : '项目列表',
						height : 336,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 35,
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
							width : 100,
							renderer : function(v, rowData, rowIndex) {
									if(v==2){
										return "项目";
									}else if(v==3){
										return "天标";
									}

							}
						},
						{
							header : '借款人',
							name : 'uname',
							align : 'center',
							width : 120
						}, 
						{
							header : '借款金额',
							name : 'issueLoan',
							width : 150,
							align : 'center'
						}, {
							header : '红包使用总额',
							name : 'redEnvelopeMoney',
							width : 100,
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
							header : '优先金额',
							name : 'priority',
							width : 150,
							align : 'center'
						},
						{
							header : '优先剩余金额',
							name : 'prioRestMoney',
							width : 150,
							align : 'center'
						},
						{
							header : '夹层金额',
							name : 'sandwich',
							width : 150,
							align : 'center'
						},{
							header : '夹层剩余金额',
							name : 'midRestMoney',
							width : 150,
							align : 'center'
						},
						{
							header : '劣后金额',
							name : 'afterBad',
							width : 150,
							align : 'center'
						},{
							header : '劣后剩余金额',
							name : 'afterRestMoney',
							width : 150,
							align : 'center'
						},{
							header : '最低投资金额',
							name : 'loanUnit',
							width : 150,
							align : 'center'
						},
						{
							header : '年利率',
							name : 'prate',
							width : 80,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						},
						{
							header : '优先奖励',
							name : 'yearate',
							width : 50,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v*100+"%";
						   }
						},
						{
							header : '回购期限',
							name : 'remonth',
							width : 50,
							align : 'center'
						},
						{
							header : '项目所属行业',
							name : 'proindustry',
							align : 'center',
							width : 70
						},{
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 120
						}, {
							header : '拨款方式',
							name : 'getMoneyWay',
							align : 'center',
							width : 120,
							renderer : function(v, rowData, rowIndex) {
									return "一次性全额到账";
							}
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
							header : '宝付状态',
							name : 'payState',
							width : 120,
							align : 'center',
							renderer : function(v, rowData, rowIndex) { 
								 if (v == 0) {
									return "待确认";
								}else if (v == 1) {
									return "已成功";
								}
							}
						}, {
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
						} ],
						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridRecordFlowInfo(id);
							myGridRepayMentFlowInfo(id);
						}
					});

					//搜索面板
					$("#loanFlowInfo-search-panel").omPanel({
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
				 $('#loanFlowInfoList-button-search').omButton({
					 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
				 	});
				 
					//借款金额查询
				 $("#issueLoanfindFlowInfo").omCombo({
					width : 120,
					forceSelection:true,
					editable : false,
				    dataSource : [{text : '全部', value : '0'},
				                {text : '100000以内', value : '1'},
				                 {text : '100000~1000000', value : '2'},
				                 {text : '1000000以上', value : '3'}
				                 ]
				});
				 $("#typefindFlowInfo").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [ {text : '全部', value : '0'},
					                 {text : '众筹', value : '1'},
					                 {text : '天标', value : '3'}
					                 ]
				});
				 
				 $("#recommendfindFlowInfo").omCombo({
						width : 70,
						forceSelection:true,
						editable : false,
					  dataSource : [
					                {text : '全部', value : '2'},
					                {text : '不推荐', value : '0'},
					                 {text : '推荐', value : '1'}
					                 ]
				});
								 
				 $("#loanFlowInfoList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/loansignManage/loansignList?status=9&"+$("#loanFlowInfoListSearchFrom").serialize());
					             $('#myGridLoanFlowInfo').omGrid('setData', url);
				 });																								
				});


/**
 * 查看详情
 */
$("#queryFlowInfo").click(function(){
	//获取选中记录
	var  selections=$('#myGridLoanFlowInfo').omGrid('getSelections',true);
	//判断是否选中
	if(selections==null || selections =="" || selections.length <1){
		alertMsg.info("请您选择要查询项目信息！");
	}else if(selections.length>1){
		alertMsg.info("请您只选择一条项目信息进行查看！");
	}else{
		//打开编辑页面属性一次为
		navTab.openTab("queryloanSign","/loanSign/getLoansignInfo?id="
					+selections[0].id,{
			title:"查看详情",
			fresh:true
		});
	}
});

/** **************数据源************* */
// 加载出借记录列表
var myGridRecordFlowInfo = function(id) {
	$("#myGridRecordFlowInfo").omGrid({
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

//导出出借记录
$("#EXPLoanRecordFlowInfo").click(function(){
	// 获取选中记录
	var selections = $('#myGridLoanFlowInfo').omGrid('getSelections', true);
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


/***
 * 查询流标信息
 */
$("#selLoanFlow").click(function() {
	var ids="";
	var selections = $('#myGridLoanFlowInfo').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
	  	alertMsg.info("请选择待确认流标的项目！");
		 return false;
	}
	  alertMsg.confirm("您确定对此项目进行流标查询吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].payState==0){
										    	ids +=selections[i].id;
										    	$.ajax({
													data : 'id='+ ids,
													url : '/loansignManage/ipsLoanFlowNum',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付已受理查询流标请求,请稍后尝试刷新页面！");
														}else if(msg=="2") {
															alertMsg.info("宝付项目流标查询失败,请尝试刷新页面！");
														}else if(msg=="3") {
															alertMsg.info("非宝付项目流标查询返回数据,请尝试刷新页面！");
														}else if(msg=="4") {
															alertMsg.info("宝付项目流标查询处理失败,请尝试刷新页面！");
														}else if(msg=="-1"){
															alertMsg.info("宝付项目流标处理失败，请到融资中的项目重新流标");
														}
														$('#myGridLoanFlowInfo').omGrid('reload');
													}
												});
										}else{
											alertMsg.info("请选择状态为待确认的项目进行流标查询！");
											return false;
									}
								}
						}
				});
});

//初始化
myGridRecordFlowInfo(0);

