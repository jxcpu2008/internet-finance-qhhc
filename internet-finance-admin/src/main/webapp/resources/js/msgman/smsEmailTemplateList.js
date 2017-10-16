$(document).ready(
	function() {
		// 数据显示列表相关
		$('#smsEmailTemplateGride').omGrid({
			dataSource : '/templateManager/querySmsEmailTemplateList',
			title : '邮件短信模板列表',
			height : 345,
			limit : 10,
			// autoFit:true,
			colModel : [ {
				header : '模版ID',
				name : 'id',
				width : 90,
				align : 'center'
			}, {
				header : '模版类型',
				name : 'msgType',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "短信";
					} else if (v == 2) {
						return "邮件";
					}
				}
			}, {
				header : '模版名称',
				name : 'templateTypeName',
				align : 'center',
				width : 200
			}, {
				header : '模版标题',
				name : 'templateTitle',
				align : 'center',
				width : 500
			}, {
				header : '创建时间',
				name : 'createTime',
				align : 'center',
				width : 100
			}],
			// 选中事件
			onRowSelect : function(index, rowData, event) {
				// 取到该行id值
				var id = rowData["id"];
			}
		});
		
		// 搜索面板
		$("#smsEmailTemplate-search-panel").omPanel({
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
		$('#smsEmailTemplate-button-search').omButton(
			{
				icons : {
					left : '/resources/operamasks-ui/themes/default/images/search.png'
				},
				width : 70
			});
		
		/** 搜索按钮点击 */
		$("#smsEmailTemplate-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/templateManager/querySmsEmailTemplateList?" + $("#searchSmsEmailTemplateForm").serialize());
				$('#smsEmailTemplateGride').omGrid('setData', url);
			});
		
	/** 跳转到短信邮件新增页面 */
	$("#toAddSmsEmailTemplate").click(
		function() {
			// 打开编辑页面属性一次为
			navTab.openTab("toAddSmsEmailTemplate",
							"/templateManager/toAddSmsEmailTemplate", {
							title : "新增短信邮件模板",
							fresh : true
			});
		});
	
	// 模板一级大类型联动  添加
	$("#a_oneLevelTemplateId").change(function() {
		var upSwitchEnName = $(this).val();
		if(upSwitchEnName == $(this).find("option:selected").val()) {
			$.ajax({
				type : "post",
				data : "upSwitchEnName=" + upSwitchEnName,
				url : "/templateManager/queryTemplateListOfUpSwitchEnName",
				success : function(msg) {
					$("#a_twoLevelTemplateId").html(msg);
				}
			});
		}
	});
	
	// 模板一级大类型联动  修改
	$("#u_oneLevelTemplateId").change(function() {
		var upSwitchEnName = $(this).val();
		if(upSwitchEnName == $(this).find("option:selected").val()) {
			$.ajax({
				type : "post",
				data : "upSwitchEnName=" + upSwitchEnName,
				url : "/templateManager/queryTemplateListOfUpSwitchEnName",
				success : function(msg) {
					$("#u_twoLevelTemplateId").html(msg);
				}
			});
		}
	});
	
	/** 保存短息邮件 */
	$("#a_doAddSmsEmailTemplateBtn").click(
		function() {
			var msgType = $("#a_msgType").val();   // 模板类型
			var oneLevelTemplateId = $("#a_oneLevelTemplateId").val(); // 模板名称level1
			var twoLevelTemplateId = $("#a_twoLevelTemplateId").val(); // 模板名称level2
			var templateTitle = $.trim($("#a_templateTitle").val());    // 模板标题
			var templateContent = $.trim($("#a_templateContent").val());  // 模板内容
			if (msgType == 0) {
				alertMsg.info("请选择消息类型");
				return false;
			}
			if (oneLevelTemplateId == '' || twoLevelTemplateId == -1) {
				alertMsg.info("请选择模板名称");
				return false;
			}
			if (templateTitle == '') {
				alertMsg.info("请填写模板标题");
				return false;
			}
			if (templateContent == 0) {
				alertMsg.info("请填写模板内容");
				return false;
			}
			$("#a_doAddSmsEmailTemplateForm").submit();
		});
	
	/**  跳转到修改模板页面 */
	$("#toSmsEmailUpdateTemplate").click(
		function() {
			// 获取选中记录
			var selections = $('#smsEmailTemplateGride').omGrid('getSelections', true);
			// 判断是否选中
			if (selections == null || selections == "" || selections.length < 1) {
				alertMsg.info("请选择模板记录！");
			} else if (selections.length > 1) {
				alertMsg.info("请选择一条信息修改！");
			} else {
				// 打开编辑页面属性一次为
				navTab.openTab("toSmsEmailUpdateTemplate",
						"/templateManager/toSmsEmailUpdateTemplate?id=" + selections[0].id, 
						{
							title : "修改模板详情",
							fresh : true
						});
			}
		});
	
	/** 修改短息邮件模板 */
	$("#u_doUpdateSmsEmailUpdateTemplateBtn").click(
		function() {
			var msgType = $("#u_msgType").val();   // 模板类型
			var oneLevelTemplateId = $("#u_oneLevelTemplateId").val(); // 模板名称level1
			var twoLevelTemplateId = $("#u_twoLevelTemplateId").val(); // 模板名称level2
			var templateTitle = $.trim($("#u_templateTitle").val());    // 模板标题
			var templateContent = $.trim($("#u_templateContent").val());  // 模板内容
			if (msgType == 0) {
				alertMsg.info("请选择消息类型");
				return false;
			}
			if (oneLevelTemplateId == '' || twoLevelTemplateId == -1) {
				alertMsg.info("请选择模板名称");
				return false;
			}
			if (templateTitle == '') {
				alertMsg.info("请填写模板标题");
				return false;
			}
			if (templateContent == 0) {
				alertMsg.info("请填写模板内容");
				return false;
			}
			$("#u_doUpdateSmsEmailUpdateTemplateForm").submit();
		});
	
	$("[name=msgType]").change(function() {
		if ($(this).val() == 1) {
			$("[name=templateContent]").val('');
			$("[name=templateContent]").attr("maxlength","65");
		} else {
			$("[name=templateContent]").removeAttr("maxlength");
		}
	});
});

/** 预览短信邮件模板 */
function viewSmsEmailTemplate() {
	// 获取选中记录
	var selections = $('#smsEmailTemplateGride').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections.length < 1) {
		alertMsg.info("请选择模板记录！");
	} else if (selections.length > 1) {
		alertMsg.info("请选择一条信息修改！");
	} else {
		// 得到id
		var id = selections[0].id;
		$.pdialog.open('/templateManager/toSmsEmailTemplateDetail?id=' + id,
				'viewSmsEmailTemplateDetail', '查看模板详情', {
					width : 800,
					height : 420
				});
	}
}

/** 删除短信邮件模板记录 */
function deleteSmsEmailTemplateConfirmMsg() {
	var selections = $('#smsEmailTemplateGride').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined 
			|| selections.length < 1) {
			alertMsg.info("请选择需要删除的记录！");
	} else {
		// 得到选中的第一条记录
		var dataRow = selections[0];
		// 得到id
		var id = dataRow.id;
		alertMsg.confirm("您确定要删除当前记录？", {
			okCall : function() {
				$.ajax({
					url : '/templateManager/deleteSmsEmailTemplate',
					data : 'id=' + id,
					type : 'post',
					success : function(data) {
						data = JSON.parse(data);
						var msg = data.code;
						if (msg == '0') {
								$('#smsEmailTemplateGride').omGrid('reload');// 刷新当前页
							alertMsg.correct("删除成功");
						} else if (msg == '1') {
						alertMsg.info("删除失败！");
							} else if (msg == '2') {
							alertMsg.info("不允许删除！");
						}
					}
				});
			}
		});
	}
}