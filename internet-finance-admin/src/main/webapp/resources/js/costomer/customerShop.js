$(document).ready(
				function() {
					var id = 0;
					// 查询面板初始化
					$("#customerShop-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerShopList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					var relaodFileTable = function() {
						$('#customerShop').omGrid('reload');
						return true;
					};
					
					$("#customerShop").omGrid({
						dataSource : '/customerShop/customerShopList',
						title : '客服店铺众筹投资流水查询',
						height : 550,
						limit : 20,
						colModel : [ {
							header : '记录ID',
							name : 'id',
							width : 55,
							align : 'center'
						},{
							header : '店铺名称',
							name : 'shopName',
							width : 150,
							align : 'center'
						},{
							header : '投资者真实用户名',
							name : 'name',
							width : 100,
							align : 'center'
						}, {
							header : '投资者登录用户名',
							name : 'userName',
							width : 100,
							align : 'center'
						},
						 {
							header : '购买金额',
							name : 'tenderMoney',
							width : 120,
							align : 'center'
						},  {
							header : '订单号',
							name : 'orderNum',
							width : 150,
							align : 'center'
						}, {
							header : '购买时间',
							name : 'tenderTime',
							align : 'center',
							width : 120
						},  {
							header : '购买是否成功',
							name : 'isSucceed',
							width : 120,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "待确认";
								} else if (v == 1) {
									return "成功";
								}else if (v==-1){
									return "失败";
								}
							}
						},{
							header:'投资方式',
							name:'webOrApp',
							align:'center',
							width:120,
							renderer : function(v, rowData, rowIndex) {
								if (v == 1) {
									return "PC端";
								} else if (v == 2) {
									return "移动端";
								}
							}
						} ]
					});

					//搜索面板
					$("#customerShop-search-panel").omPanel({
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
					
					 $("#search-shop").omCombo({
					     	width : 70,
					     	forceSelection:true,
					         dataSource : [ {text : '不限', value : ''},
					                        {text : '待确认', value : '0'}, 
					                        {text : '成功', value : '1'},
					                        {text : '失败', value : '-1'}]
					     });

					//鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
				        html : '可以通过单击，展开高级搜索面板哦'
				    });
				 
				 $("#customerShopList-button-search").click(function(){
					 var ajaxbg = $("#background,#progressBar");
				           ajaxbg.show();
					 var url=encodeURI("/customerShop/customerShopList?"+$("#customerShopListSearchFrom").serialize());
					             $('#customerShop').omGrid('setData', url);
				 });																								
	});


/***
 * 查询投资信息
 */
$("#selCustomerShop").click(function() {
	var ids="";
	var selections = $('#customerShop').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
	  	alertMsg.info("请选择待确认的店铺众筹投资信息！");
		 return false;
	}
	  alertMsg.confirm("您确定对此条数据进行投资查询吗！",{
			   okCall : function() {
					  for (var i in selections){
										if(selections[i].isSucceed==0){
										    	ids +=selections[i].id;
										    	$.ajax({
										    		data : 'ids='+ ids,
													url : '/shopManage/ipsShopRecordNum',
													type : 'post',
													success : function(msg) {
														if(msg=="1") {		
															 alertMsg.info("宝付已受理查询投资信息请求,请稍后尝试刷新页面！");
														}else if(msg=="2") {
															alertMsg.info("宝付投资信息查询失败,请尝试刷新页面！");
														}else if(msg=="3") {
															alertMsg.info("非宝付投资信息查询返回数据,请尝试刷新页面！");
														}else if(msg=="4") {
															alertMsg.info("宝付投资信息查询处理失败,请尝试刷新页面！");
														}else if(msg=="-1"){
															alertMsg.info("宝付处理失败，请尝试刷新页面！");
														}
														$('#customerShop').omGrid('reload');
													}
												});
										}else{
											alertMsg.info("请选择状态为待确认的进行投资查询！");
											return false;
									}
								}
						}
				});
       });
