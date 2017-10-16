$(document).ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#escrowRecharge-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#escrowRechargeList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#myGridEscrowRecharge').omGrid('reload');
						return true;
					};
					// 店铺列表
					$("#myGridEscrowRecharge").omGrid({
						dataSource : '/escrowRecharge/escrowRechargeList',
						title : '第三方担保充值记录',
						height : 550,
						limit : 20,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 35,
							align : 'center'
						}, {
							header : '担保公司名称',
							name : 'name',
							width : 100,
							align : 'center'
						}, {
							header : '注册用户名',
							name : 'staff_username',
							width : 100,
							align : 'center'
						},
						{
							header : '充值金额',
							name : 'rechargeAmount',
							align : 'center',
							width : 120
						}, {
							header : '实际到账金额',
							name : 'reAccount',
							align : 'center',
							width : 120
						},{
							header : '宝付收取手续费',
							name : 'fee',
							width : 100,
							align : 'center'
						},{
							header : '商户收取手续费',
							name : 'merfee',
							width : 100,
							align : 'center'
						},
						{
							header : '费用承担方',
							name : 'feetakenon',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "平台支付";
								} else if (v == 2) {
									return "用户支付";
								}
							}
						}, {
							header : '充值时间',
							name : 'time',
							align : 'center',
							width : 150
						},
						{
							header : '宝付充值成功时间',
							name : 'succ_time',
							width : 150,
							align : 'center'
						},{
							header : '充值流水号',
							name : 'orderNum',
							width : 150,
							align : 'center'
						},
						{
							header : '状态',
							name : 'status',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "待确认 ";
								} else if (v == 1) {
									return "充值成功";
								}else if (v == -1) {
									return "充值失败";
								}
							}
						}]
					});

					//搜索面板
					$("#escrowRecharge-search-panel").omPanel({
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
					
					 $("#search-escrowRecharge").omCombo({
					     	width : 70,
					     	forceSelection:true,
					         dataSource : [ {text : '不限', value : ''},
					                        {text : '待确认', value : '0'}, 
					                        {text : '充值成功', value : '1'},
					                        {text : '充值失败', value : '-1'}]
					     });

					//鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
				        html : '可以通过单击，展开高级搜索面板哦'
				    });
				 
				 $("#escrowRechargeList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/escrowRecharge/escrowRechargeList?"+$("#escrowRechargeListSearchFrom").serialize());
					             $('#myGridEscrowRecharge').omGrid('setData', url);
				 });																								
	});


/***
 * 查询充值信息
 */
$("#selEscrowRechargeRecord").click(function() {
	var ids="";
	var selections = $('#myGridEscrowRecharge').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
	  	alertMsg.info("请选择待确认充值的第三方担保信息！");
		 return false;
	}
	  alertMsg.confirm("您确定对此第三方担保进行充值查询吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].status==0){
										    	ids +=selections[i].id;
										    	$.ajax({
													data : 'id='+ ids,
													url : '/escrowRecharge/ipsEscrowRechargeNum.htm',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付已受理查询充值请求,请稍后尝试刷新页面！");
														}else if(msg=="2") {
															alertMsg.info("宝付项目充值处理中,请尝试刷新页面！");
														}else if(msg=="3") {
															alertMsg.info("非宝付项目充值查询返回数据,请尝试刷新页面！");
														}else if(msg=="4") {
															alertMsg.info("宝付项目充值充值失败,请重新充值！");
														}else if(msg=="5"){
															alertMsg.info("宝付项目充值查询失败，请尝试刷新页面!");
														}
														$('#myGridEscrowRecharge').omGrid('reload');
													}
												});
										}else{
											alertMsg.info("请选择状态为待确认的第三方担保信息进行充值查询！");
											return false;
									}
								}
						}
				});
       });
