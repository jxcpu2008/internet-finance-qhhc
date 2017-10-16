$(document).ready(
		function() {
			var id = 0;
				$("#myGridRegBonus").omGrid({
					dataSource : '/bonus/queryRegBonus',
					height : 380,
					limit : 10,
					title : '注册奖励发放记录',
				   singleSelect : false,
					colModel : [{
						header : '推荐注册奖励id',
						name : 'id',
						width : 100,
						align : 'center'
					},{
						header : '真实姓名',
						name : 'name',
						width : 100,
						align : 'center'
					},{
						header : '用户名',
						name : 'userName',
						width : 100,
						align : 'center'
					},
					{
						header : '注册时间',
						name : 'createTime',
						align : 'center',
						width : 120
					},
					{
						header : '宝付注册时间',
						name : 'pIpsAcctDate',
						align : 'center',
						width : 120
					},
					{
						header : '被推荐人宝付授权状态',
						name : 'isAuthIps',
						align : 'center',
						width : 120,
						renderer : function(ips, rowData, rowIndex) {
							if (ips == 1) {
								return "宝付已授权";
							}else{
								return "宝付尚未授权";
							}
						}
					},
					{
						header : '推荐用户名',
						name : 'referrerUserName',
						align : 'center',
						width : 120
					},{
						header : '推荐真实姓名',
						name : 'referrerName',
						align : 'center',
						width : 120
					},{
						header : '推荐人手机',
						name : 'referrerPhone',
						align : 'center',
						width : 120
					},
					{
						header : '推荐人宝付号',
						name : 'referrerIps',
						align : 'center',
						width : 120
					},
					{
						header : '奖励金额',
						name : 'bouns',
						align : 'center',
						width : 120,
						
					},
					{
						header : '奖励发放状态',
						name : 'releaseStatus',
						align : 'center',
						width : 120,
						renderer : function(v, rowData, rowIndex) {
							if (v == 1) {
								return "已发放";
							}else if (v == 0) {
								return "待发放";
							}else if (v == -1) {
								return "发放失败";
							}
						}
					},
					{
						header : '奖励发放时间',
						name : 'releaseTime',
						align : 'center',
						width : 120
					},{
						header : '奖励发放人员',
						name : 'realname',
						align : 'center',
						width : 150
					}],
					// 选中事件
					onRowSelect : function(index, rowData, event) {
						// 取到该行id值
						var id = rowData["id"];
						myGridUserbank(id);
					}
				});
				
				// 加载出借记录列表
				var myGridUserbank = function(id) {
					$("#myGridUserbank").omGrid({
						dataSource : "/bonus/userbankList?id=" + id,
						title : '注册用户银行卡',
						height : 320,
						limit : 10,
						colModel : [ {
							header : '记录ID',
							name : 'id',
							width : 120,
							align : 'center'
						}, {
							header : '银行卡账号',
							name : 'bank_no',
							width : 120,
							align : 'center'
						}, {
							header : '银行卡名称',
							name : 'bank_name',
							width : 150,
							align : 'center'
						}, {
							header : '开户省会',
							name : 'pro_value',
							width : 150,
							align : 'center'
						}, {
							header : '开户城市',
							name : 'city_value',
							align : 'center',
							width : 150
						}, {
							header : '开户支行',
							name : 'bank_address',
							width : 150,
							align : 'center'
							
						}, {
							header : '手机验证码',
							name : 'validate_code',
							align : 'center',
							width : 150
						}, {
							header : '状态',
							name : 'state',
							align : 'center',
							width : 150,
							renderer : function(ips, rowData, rowIndex) {
								if (ips == 1) {
									return "成功";
								}else if(ips == -1){
									return "失败";
								}else if(ips == 0){
									return "待确认";
								}
							}
						} ]
					})
				};
				
				
				// 查询面板初始化
				$("#regBonusList-search-panel").omPanel({
					title : "高级搜索",
					collapsible : true,
					width : 'fit'
				});
				$('span#regBonusList-button-search').omButton({
									icons : {
										left : '/resources/operamasks-ui/themes/default/images/search.png'
									},
									width : 70
								});
				
				
				// 搜索面板
				$("#regBonusList-search-panel").omPanel({
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
				$("#releaseStatusCombo").omCombo({
					width : 70,
					forceSelection : true,
					dataSource : [ {
						text : '全部',
						value : ''
					}, {
						text : '待发放',
						value : '0'
					}, {
						text : '已发放',
						value : '1'
					},{
						text : '发放失败',
						value : '-1'
					}
					]
				});
				

				$("#regBonusList-button-search").click(
								function() {
									var ajaxbg = $("#background,#progressBar");
									ajaxbg.show();
									var url = encodeURI("/bonus/queryRegBonus?"+ $("#regBonusListSearchFrom").serialize());
									        $('#myGridRegBonus').omGrid('setData', url);
								});
				
				//控制时间控件可选择的范围
				var disFnTime = function disFn(date) {
				var nowMiddle = new Date();
					if (date > nowMiddle) {
					return false;
					}
				}
				//申请开始时间
				$("#selAuthIpsTimeStar").omCalendar({
					editable : false,
					disabledFn : disFnTime
				});
				//申请结束时间
				$("#selCreateTimeEnd").omCalendar({
					editable : false,
					disabledFn : disFnTime
				});
		}
);

//获取被推荐人
$("#selRegBonus").click(function(){
	var selAuthIpsTime=document.getElementById('selAuthIpsTimeStar').value;
	var selTimeEnd=document.getElementById('selCreateTimeEnd').value;
	if(selAuthIpsTime==null||selAuthIpsTime==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	if(selTimeEnd==null||selTimeEnd==""){
		alertMsg.info("时间必须填！");
		return false;
	}
	alertMsg.confirm("您确定要对此注册奖励进行转账吗？",{
		   okCall : function() {
					    $.ajax({
								url : '/bonus/regBonus.htm?'+$("#regBonusListSearchFrom").serialize(),
								type : 'post',
								success : function(msg) {
									if(msg=="1") {		
										 alertMsg.info("操作成功！");
									}else if(msg=="2") {
										alertMsg.info("用户系统消息发送失败");
									}else if(msg=="3"){
										alertMsg.info("无此权限！");
									}else if(msg=="4"){
										alertMsg.info("无数据需要转账！");
									}
									$('#myGridRegBonus').omGrid('reload');
								}
							});
					}
			});
});

$("#selRegBonusSelected").click(function(event){
	 //获取选中行数据
	 var selections = $('#myGridRegBonus').omGrid('getSelections',true);
	 if(selections.length>0){
		 var ids="";
		 for(var i=0;i<selections.length;i++){
			 ids +=selections[i].id+",";
		 }
		 alertMsg.confirm('是否确认选中注册奖励进行发放?', {
	            okCall: function(){
				    $.ajax({
						url : '/bonus/regBonusSelecte.htm?ids='+ids,
						type : 'post',
						success : function(msg) {
							if(msg=="1") {		
								 alertMsg.info("操作成功！");
							}else if(msg=="2") {
								alertMsg.info("用户系统消息发送失败");
							}else if(msg=="3"){
								alertMsg.info("无此权限！");
							}else if(msg=="4"){
								alertMsg.info("无数据需要转账！");
							}
							$('#myGridRegBonus').omGrid('reload');
						}
					});
				}
		});
	 }else{
		alertMsg.warn("您没有选择要发放注册奖励的数据");
	 }
});


//导出注册已发放
$("#outRegBonus").click(function(){
	 var messgae="是否导出所有注册发放记录到excel？";
	 //判断用户是否选中数据
	 alertMsg.confirm(messgae, {
			okCall: function(){
				window.location.href = "/bonus/outRegBonus?"+$("#regBonusListSearchFrom").serialize();
			}
	});
});
//初始化
myGridUserbank(0);
