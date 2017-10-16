$(document).ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#escrow-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#escrow-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#myGridEscrow').omGrid('reload');
						return true;
					};
					// 店铺列表
					$("#myGridEscrow").omGrid({
								dataSource : '/escrow/escrowList',
								height : 568,
								limit : 20,
								colModel : [ {
									header : '编号',
									name : 'id',
									width : 35,
									align : 'center'
								}, {
									header : '担保公司名称',
									name : 'name',
									width : 150,
									align : 'center'
								},{
									header : '公司电话号码',
									name : 'phone',
									width : 80,
									align : 'center'
								},{
									header : '公司地址',
									name : 'address',
									width : 120,
									align : 'center'
								},{
									header : '员工姓名',
									name : 'staffName',
									width : 120,
									align : 'center'
								},{
									header : '注册用户名',
									name : 'staffUsername',
									width : 120,
									align : 'center'
								},{
									header : '账户余额',
									name : 'staffMoney',
									width : 120,
									align : 'center'
								},{
									header : '员工手机',
									name : 'staffPhone',
									width : 120,
									align : 'center'
								},{
									header : '员工身份证',
									name : 'staffIdcard',
									width : 120,
									align : 'center'
								},{
									header : '员工邮箱',
									name : 'staffEmail',
									width : 120,
									align : 'center'
								},{
									header : '宝付帐号',
									name : 'staffBaofu',
									width : 120,
									align : 'center'
								},{
									header : '注册宝付状态',
									name : 'inBaofu',
									width : 100,
									align : 'center',
									renderer : function(v, rowData, rowIndex) {
										if(v==0){
											return "待注册";
										}else if(v==1){
											return "已注册";
										}else if(v==-1){
											return "注册失败";
										}
								   }
								},{
									header : '宝付开通时间',
									name : 'staffBaofuCreateTime',
									width : 120,
									align : 'center'
								},{
									header : '宝付授权',
									name : 'inAccredit',
									width : 100,
									align : 'center',
									renderer : function(v, rowData, rowIndex) {
										if(v==0){
											return "待授权";
										}else if(v==1){
											return "已授权";
										}else if(v==-1){
											return "授权失败";
										}
								}
								},{
									header : '宝付授权时间',
									name : 'accreditTime',
									width : 120,
									align : 'center'
								},{
									header : '简介',
									name : 'brief',
									width : 120,
									align : 'center'
								}, {
									header : '发展历史',
									name : 'history',
									width : 120,
									align : 'center'
								}, {
									header : '管理团队',
									name : 'team',
									width : 120,
									align : 'center'
								}, {
									header : '使命',
									name : 'mission',
									width : 120,
									align : 'center'
								}]
							});

					//搜索面板
					$("#escrow-search-panel").omPanel({
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
				 
				 $("#escrow-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/escrow/escrowList?"+$("#searchEscrowForm").serialize());
					             $('#myGridEscrow').omGrid('setData', url);
				 });																								
				});

//添加第三担保方信息
$("#addEscrow").click(function(){
	//打开编辑页面属性一次为
	navTab.openTab("addEscrowList","/escrow/add",{title:"添加第三担保方信息",fresh:true});
});

//修改第三担保方信息
$("#uptEscrow").click(function(){
	 //获取选中行数据
	 var selectedRecords = $('#myGridEscrow').omGrid('getSelections',true);
	 //判断用户是否选中数据
	 if(selectedRecords.length==1){
		 navTab.openTab("uptEscrowList","/escrow/query?id="+selectedRecords[0].id,{title:"修改第三担保方信息",fresh:true});
	 }else{
		alertMsg.warn("请选择您选择要修改的第三担保方信息"); 
	 }
});

//删除
function delEscrow() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要删除的第三担保方信息！");
	} else {	
		 alertMsg.confirm("是否要删除选中的第三担保方信息?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].inBaofu==0){
							ids +=selections[i].id+",";
						}else{
							alertMsg.info("只有未注册过宝付账户的第三方担保才能进行删除操作！");
							return false;
						}
					}
					$.ajax({
						url : '/escrow/delEscrow',
						data : 'ids=' + ids,
						type : 'post',
						success : function(msg) {
							if (msg==1) {
								$('#myGridEscrow').omGrid('reload');// 刷新当前页
								alertMsg.correct("删除成功");
							} else if(msg==2){
								alertMsg.info("删除失败！");
							}
						}
					});
				}
			});
	}
}

//查询余额
function selEscrowMoney() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要查询余额的第三方担保信息！");
	} else {	
		 alertMsg.confirm("是否对选中的第三方担保信息进行余额查询?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].staffBaofu!=""&&selections[i].staffBaofu!=null){
							ids +=selections[i].id;
						}else{
							alertMsg.info("只有注册过宝付账户的第三方担保才能进行余额查询！");
							return false;
						}
					}						
				 $.pdialog.open('/escrow/ipsSelEscrowMoney?id='+ids, 'selEscrowMoney', '第三方担保余额显示' , { width:450,height:200 });
				}
			});
	}
}

//授权校验
function selInAccredit() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("您没有选择要授权的第三方担保信息！");
	} else {	
		 alertMsg.confirm("是否对选中的第三方担保信息进行授权?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].staffBaofu!=""&&selections[i].staffBaofu!=null&&selections[i].inAccredit!=1){
							ids +=selections[i].id;
						}else{
							alertMsg.info("只有注册过宝付账户的，未授权第三方担保才能进行授权！");
							return false;
						}
					}
					$.ajax({
						url : '/escrow/ipsInAccredit.htm',
						data : 'id=' + ids,
						type : 'post',
						success : function(msg) {
						   if(msg=="member/callcentralInAccredit.htm") {		
							    $('#myGridEscrow').omGrid('reload');
								window.open(msg);
								alertMsg.info("宝付已经受理授权请求,请稍后尝试刷新页面！");
							} else if(msg==1){
								  $('#myGridEscrow').omGrid('reload');
								alertMsg.info("授权失败！");
							}
						}
					});
				}
			});
	}
}

//查询银行卡信息
function selEscrowBank() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined|| selections.length < 1) {
		alertMsg.info("您没有选择要查询银行账户的第三方担保信息！");
	} else {	
		 alertMsg.confirm("是否对选中的第三方担保进行余额查询?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].staffBaofu!=""&&selections[i].staffBaofu!=null){
							ids +=selections[i].id;
						}else{
							alertMsg.info("只有注册过宝付账户的第三方担保才能进行银行账户信息查询！");
							return false;
						}
					}						
				 $.pdialog.open('/escrow/ipsSelEscrowBank?id='+ids, 'selFundsAccount', '第三方担保银行账户信息' , { width:450,height:320 });
				}
			});
	}
}


//注册宝付
function registerEscrow() {
	var ids="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined|| selections.length < 1) {
		alertMsg.info("您没有选择要注册宝付的第三方担保信息！");
	} else {	
		 alertMsg.confirm("是否对选中的第三方担保进行注册宝付?", {
				okCall : function() {
					for (var i in selections) {
						if(selections[i].staffBaofu==""||selections[i].staffBaofu==null){
							ids +=selections[i].id;
						}else{
							alertMsg.info("只有未注册过宝付账户的第三方担保才能进行注册！");
							return false;
						}
					}
					$.ajax({
						data : 'id='+ ids,
						url : '/escrow/ipsRegisterEscrow',
						type : 'post',
						success : function(msg) {
							if(msg=="0") {		
								 alertMsg.info("宝付已受理查询投资信息请求,请稍后尝试刷新页面！");
							}else if(msg=="1") {
								alertMsg.info("注册宝付失败,请尝试刷新页面！");
							}else {
								alertMsg.info(msg);
							}
							 $('#myGridEscrow').omGrid('reload');
						}
					});
				}
			});
	}
}

/***
 * 充值
 */
function selEscrowRecharge(){
	var ids="";
	var staffUsername="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined|| selections.length < 1) {
		alertMsg.info("您没有要充值的第三方担保信息！");
	}else{
			for (var i in selections) {
					if(selections[i].staffBaofu!=""&&selections[i].staffBaofu!=null){
						ids +=selections[i].id;
						staffUsername +=selections[i].staffUsername;
					}else{
						alertMsg.info("只有注册过宝付账户的第三方担保才能进行充值！");
						return false;
					}
			}
			$.pdialog.open('/escrowRecharge/queryEscrowRechage?id='+ids, 'selEscrowRecharge', staffUsername+'充值' , { width:450,height:220 });
	}
}

/***
 * 提现
 */
function  selEscrowWithdraw(){
	var ids="";
	var staffUsername="";
	//获取选中行数据
	var selections = $('#myGridEscrow').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined|| selections.length < 1) {
		alertMsg.info("您没有要提现的第三方担保信息！");
	}else{
			for (var i in selections) {
					if(selections[i].staffBaofu!=""&&selections[i].staffBaofu!=null){
						ids +=selections[i].id;
						staffUsername +=selections[i].staffUsername;
					}else{
						alertMsg.info("只有注册过宝付账户的第三方担保才能进行提现！");
						return false;
					}
					if(selections[i].staffMoney<=0){
						alertMsg.info("账户余额金额不足，不能提现");
						return false;
					}
			}
			$.pdialog.open('/escrowWithdraw/queryEscrowWithdraw?id='+ids, 'selEscrowRecharge', staffUsername+'提现' , { width:450,height:220 });
	}
}
