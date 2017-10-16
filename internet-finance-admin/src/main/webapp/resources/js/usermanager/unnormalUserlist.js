$(document)
		.ready(
				function() {

					// 用户选择要导出的会员
//					var userIds = [];
					
					var phone = $("#phone").val();

					// 数据源面板
					$('#unnormal_user_list').omGrid(
							{
								// width:'fit',
								height : 485,
								dataSource : '/userinfo/getUnnormalUserList?&phone=' + phone,
								limit : 20,
								// autoFit:true,
								method : 'POST',
								showIndex : true,
								emptyMsg : '暂时还没有您想要的数据',
								singleSelect : false,
//								autoFit : true,
//								onRowSelect : function(index, data) {
//									if ($.inArray(data.userId, userIds) == -1)
//										userIds.push(data.userId);
//								},
//								onRowDeselect : function(index, data) {
//									var i = $.inArray(data.userId, userIds);
//									userIds.splice(i, 1);
//								},
//								// 还原过去选中的记录
//								onRefresh : function(nowpage, records) {
//									var len = selectIds.length;
//									var indexs = [];
//									for (var i = 0; i < len; i++) {
//										$.each(records, function(n, item) {
//											if (item.id === selectIds[i]) {
//												indexs.push(n);
//											}
//										});
//									}
//									$("#unnormal_user_list").omGrid(
//											"setSelections", indexs);
//								},
								colModel : [ 
//								{
//									header : '用户id',
//									name : 'userId',
//									width : 120,
//									align : 'center'
//								}, 
								{
									header : '用户名',
									name : 'userName',
									width : 120,
									align : 'center'
								}, {
									header : '真实姓名',
									name : 'name',
									align : 'center',
									width : 100
								}, {
									header : '注册时间',
									name : 'regTime',
									align : 'center',
									width : 120
								}, {
									header : '宝付注册状态',
									name : 'hasIpsAccount',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v == 0) {
											return "待确认";
										} else if (v == 1) {
											return "已注册";
										} else{
											return "未注册";
										}
									}
								}, {
									header : '宝付授权状态',
									name : 'isAuthIps',
									align : 'center',
									width : 120,
									renderer : function(v, rowData, rowIndex) {
										if (v == 0) {
											return "未授权";
										} else if (v == 1) {
											return "已授权";
										} else{
											return "未授权";
										}
									}
								}, {
									header : '手机号码',
									name : 'phone',
									align : 'center',
									width : 120
								}, {
									header : '操作类型',
									name : 'action',
									align : 'center',
									width : 120
								}, {
									header : '宝付账号',
									name : 'billNo',
									align : 'center',
									width : 150
								}, {
									header : '操作状态',
									name : 'operResult',
									align : 'center',
									width : 215
								}  ]
							});

					// 搜索面板
					$("#user-search-panel").omPanel({
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
					$('span#user-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});
					// 搜索按钮单击事件
					$("#user-button-search").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/userinfo/getUnnormalUserList?"
										+ $("#searchfrom").serialize());
								$('#unnormal_user_list').omGrid('setData', url);
							});

				});



$("#queryRemoteUserInfo").click(function() {
//	var store = $('#unnormal_user_list').omGrid('getData');
//	var rows = store.rows;
//	for (var j = 0; j < rows.length; j++) {
//		rows[j].operResult = "<font color='red'>不及格</font>";
//	}
//	$('#unnormal_user_list').omGrid('refresh');
	
//	alert(JSON.stringify(store));
	var selectedIndexs = $('#unnormal_user_list').omGrid('getSelections');
	var selections = $('#unnormal_user_list').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined || selections.length < 1) {
	  	alertMsg.info("请选择一条用户信息数据！");
	  	return false;
	}

	var userIds = [];
	var billNos = [];
	var confirmMsg = '确定对此用户进行补录吗？';
	if (selections.length == 1) {
		userIds.push(selections[0].userId);
		billNos.push(selections[0].billNo);
	} else {
		confirmMsg = '确定对这些用户进行批量补录吗？';
		for (var i = 0; i < selections.length; i++) {
			userIds.push(selections[i].userId);
			billNos.push(selections[i].billNo);
		}
	}
	
	alertMsg.confirm(confirmMsg, {
		okCall : function() {
			if (selections.length >= 1) {
				$.ajax({
					data : 'userIds=' + userIds.join(',') + '&billNos=' + billNos.join(','),
					url : '/userinfo/ipsUserInfo',
					type : 'post',
					success : function(data) {
						data = JSON.parse(data);
						
						var selectioned = $('#unnormal_user_list').omGrid('getSelections', true);
						
						var queryStatus = data.queryStatus;
						if (queryStatus == 1) {
							var userIdArray = data.returnMsg;
							if (userIdArray.length == 0) {
								alertMsg.info("宝付查询用户信息提示无用户信息！");
							} else {
								for (var i = 0; i < userIdArray.length; i++) {
									var userId = userIdArray[i].userId;
									
									for (var j = 0; j < selectioned.length; j++) {
										if (selectioned[j].userId == userId) {
											selectioned[j].operResult = "<font color='red'>操作成功</font>";
											selectioned[j].isAuthIps = 1;
										}
									}
								}
							}
						} else if (queryStatus == -1) {
							alertMsg.info("宝付查询用户信息异常，请联系管理员！");
						} else if (queryStatus == 3) {
							alertMsg.info("宝付查询用户信息提示无用户信息！");
						}
						$('#unnormal_user_list').omGrid('refresh');
						$('#unnormal_user_list').omGrid('setSelections', selectedIndexs);
						
//						if (msg == "1") {	// 用户信息返回状态： 1 正常  0未授权 -1已注销	
//							alertMsg.info("宝付查询用户信息操作成功！");
//						} else if (msg == "0") {	// 用户信息返回状态： 1 正常  0未授权 -1已注销
//							alertMsg.info("宝付查询用户信息提示用户未授权！");
//						} else if (msg == "-1") {
//							alertMsg.info("宝付查询用户信息异常，请联系管理员！");
//						} else if (msg == "2") {	// 用户信息返回状态： 1 正常  0未授权 -1已注销
//							alertMsg.info("宝付查询用户信息提示用户已注销！");
//						} else if (msg == "3") {
//							alertMsg.info("宝付查询用户信息提示无此用户信息！");
//						} else if (msg == "7") {
//							alertMsg.info("后台操作正在进行中，请勿操作！");
//						}
//						$('#unnormal_user_list').omGrid('reload');
					}
				});
			} else {
				alertMsg.warn("请选择用户信息数据！");
				return false;
			}
		}
	});
});