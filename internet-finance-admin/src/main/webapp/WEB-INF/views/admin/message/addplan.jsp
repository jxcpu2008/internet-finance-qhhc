<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
div.conment>ul li {line-height: 41px;}
div.conment {padding-left: 50px;padding-top: 10px;}
.bottom_btn {background-color: #33ffff;border: 1px solid #ccc;height: 30px;}
button {cursor: pointer;}
#viewSmsEmailTemplateOfPlanBtn {
	border: 1px solid #bbb;
	background-color: #dedede;
	padding: 2px 15px;
	border-radius: 4px;
	cursor: pointer;
}
</style>
<script>
	$(function() {
		//投资时间
		$("#loanTimeFloor").omCalendar({
			disabledFn : disFn
		});
		$("#loanTimeup").omCalendar({
			disabledFn : disFn
		});

		//注册时间
		$("#regTimeFoolr").omCalendar({
			disabledFn : disFn
		});
		$("#regTimeUp").omCalendar({
			disabledFn : disFn
		});

		var disFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};

		//弹出框
		$("#chooseUser").click(function() {
			$("#backgrounddiv").show();
			$("#chooseGetUser").show();
		});

		//关闭
		$("#closebtn").click(function() {
			$("#backgrounddiv").hide();
			$("#chooseGetUser").hide();
			$("#reset").trigger('click');
		});

		//搜索
		$("#searchUser").click(
			function() {
				var loanfloor = $("#loanfloor").val();
				var loanup = $("#loanup").val(); // 投资额
				var loanTimeFloor = $("#loanTimeFloor").val();
				var loanTimeup = $("#loanTimeup").val(); // 投资时间
				var loanCountFloor = $("#loanCountFloor").val();
				var loanCountUp = $("#loanCountUp").val(); // 投资次数
				var regTimeFoolr = $("#regTimeFoolr").val();
				var regTimeUp = $("#regTimeUp").val(); // 注册时间
				if (loanfloor != '' || loanup != '') {
					if (loanfloor == '' || loanup == '') {
						alertMsg.info("投资额必须填写上限和下限");
						return;
					} else {
						if (parseInt(loanup) < parseInt(loanfloor)) {
							alertMsg.info("投资额下限必须大于上限");
							return;
						}
					}
				}
				if (loanTimeFloor != '' || loanTimeFloor != '') {
					if (loanTimeup == '' || loanTimeup == '') {
						alertMsg.info("投资时间必须填写上限和下限");
						return;
					}
				}
				if (loanCountFloor != '' || loanCountFloor != '') {
					if (loanCountUp == '' || loanCountUp == '') {
						alertMsg.info("投资次数必须填写上限和下限");
						return;
					} else {
						if (parseInt(loanCountUp) < parseInt(loanCountFloor)) {
							alertMsg.info("投资次数下限必须大于上限");
							return;
						}
					}
				}
				if (regTimeFoolr != '' || regTimeFoolr != '') {
					if (regTimeUp == '' || regTimeUp == '') {
						alertMsg.info("注册时间必须填写上限和下限");
						return;
					}
				}
				$.ajax({
					url : '/messageManager/getSearchUser.htm',
					type : 'post',
					data : $("#searchForm").serialize(),
					success : function(data) {
						data=JSON.parse(data);						
						var htm = "根据筛选条件，共搜出符合条件的数据<span id='user_num'>"
									+ data[0]
									+ "</span>条。其中"
									+ data[2] + "个用户没有手机号码，"
									+ data[1] + "个用户没有邮箱。"
						$("#result").html(htm);
					}
				});
			});
		//确认发送按钮
		$("#sureSend").click(function() {
			var user_num = $("#user_num").text();
			if (user_num == '' || parseInt(user_num) <= 0) { // 表示收件人不为0
				alertMsg.info("请先筛选收件人信息且收件人不能为0条！");
				return;
			}
			$.ajax({
				url : "/messageManager/sureSearchUser.htm",
				type : 'post',
				success : function(data) {
					if (data == null) {
						alertMsg.info("请先筛选收件人信息");
					} else {
						var data = JSON.parse(data);
						var htm = " ";
						for (var i = 0; i < data.length; i++) {
							if (i <= 5) {
								htm += data[i][2] + ";";
							} else {
								htm += "等" + data.length + "人。";
								break;
							}
						}
						$("#getUserPerson").val(htm);
						$("#backgrounddiv").hide();
						$("#chooseGetUser").hide();
					}
				}
			});
		});

		//导出接收人员名单按钮
		$("#exportReceiverList").click(function() {
			var user_num = $("#user_num").text();
			if (user_num == '' || parseInt(user_num) <= 0) { // 表示收件人不为0
				alertMsg.info("请先筛选收件人信息且收件人不能为0条！");
				return;
			}
			var url = "/messageManager/exportReceiverList.htm";
			window.location.href = url;
		});
		
		//下拉框联动
		$("#emailType").change(
			function() {
				$.ajax({
					url : '/messageManager/queryTemplateList',
					type : 'post',
					data : {
						upSwitchEnName : $("#emailType").val()
					},
					success : function(data) {
						data = JSON.parse(data);
						var htm = "";
						if (data == "") {
							htm = "<option value=''>请选择</option>";
							$("#emailName").html(htm);
						} else {
							for (var i = 0; i < data.length; i++) {
								htm += "<option value='"+data[i].switchEnName+"'>"
									+ data[i].switchZhName
									+ "</option>";
						}
						$("#emailName").html(htm);
					}
				}
			});
		});

		//提交计划
		$("#submitPlan").click(function() {
			submitPlan(1);
		});
		//草稿计划
		$("#editplan").click(function() {
			submitPlan(2);
		});
		/** 预览 */
		$("#viewSmsEmailTemplateOfPlanBtn").click(function() {
			var msgType = $("#sendTypeId").val();
			var templateType = $("#emailType").val();
			var templateEnName = $("#emailName").val();
			
			if (templateType == "" || templateEnName == "") {
				alertMsg.info("请选择计划模板");
				return;
			}
			
			$.ajax({
				url : '/messageManager/isTemplateExist.htm?msgType=' + msgType + '&templateType=' + templateType + '&templateEnName=' + templateEnName,
				type : 'post',
				success : function(data) {
					var data = JSON.parse(data);
					var code = data.code;
					if(code == '0') {
						$.pdialog.open('/messageManager/viewSmsEmailTemplateOfPlan?msgType=' + msgType + '&templateType=' + templateType + '&templateEnName=' + templateEnName,
								'viewSmsEmailTemplateOfPlanAdd', '查看短信邮件模板详情', {
								width : 800,
								height : 420
							}); 
					} else {
						alertMsg.info(data.msg);
					}
				}
			});
		});
	});

	function submitPlan(plantype) {
		var user_num = $("#user_num").text(); // 收件人数量
		var plan_t1 = $("#emailType").val();  // 计划模板1
		var plan_t2 = $("#emailName").val();  // 计划模板2
		var start_send_time = $("#start_send_time").val();  // 发送开始时间
		var end_send_time = $("#end_send_time").val();  // 发送结束时间
		var msgNum = $("#msgNum").val(); // 每次发送数量
		if (user_num == '' || parseInt(user_num) == 0) {
			alertMsg.info("请筛选收件人信息");
			return;
		}
		if (plan_t1 == "" || plan_t2 == "") {
			alertMsg.info("请选择计划模板");
			return;
		}
		if (start_send_time == '') {
			alertMsg.info("请选择发送开始时间");
			return;
		}
		if (end_send_time == '') {
			alertMsg.info("请选择发送结束时间");
			return;
		}
		if (msgNum == '') {
			alertMsg.info("请输入每小时发送的短信/邮件数量");
			return;
		}
		$.ajax({
			url : '/messageManager/savePlan.htm?planType=' + plantype,
			type : 'post',
			data : $("#planform").serialize(),
			success : function(data) {
				data = JSON.parse(data);
				var code = data.code;
				var msg = data.msg;
				if ("0" == code) {
					// 1、短信  2、邮件
					var type = $("[name=sendType]").val();					
					if (plantype == 1) {
						if (type == 1) {
							navTab.openTab("main102", "/messageManager/smsList?type=1", 
									{ title:"短信列表", fresh:true});
						} else {
							navTab.openTab("main103", "/messageManager/smsList?type=2", 
									{ title:"邮件列表", fresh:true});
						}
					} else if (plantype == 2) {
						navTab.openTab("main106", "/messageManager/draftBox", 
								{ title:"草稿箱", fresh:true});
					}
					navTab.closeTab("main105");  // close 添加页面
				} else {
					alertMsg.info(msg);
				}
			}
		});
	}
</script>
<div style="background-color: #fff; width: 100%; height: 400px; top: 100px; left: 400px;">
	<div style="background: #00CCFF; height: 25px; padding: 10px 0 0 20px;">
		<span>添加计划</span>
	</div>
	<form method="post" id="planform">
		<div class="conment" style="padding-top: 20px; padding-left: 50px;">
			<ul>
				<li>
					<label style="margin-right: 40px;">选择计划:</label> 
					<select style="width: 180px;" id="sendTypeId" name="sendType">
						<option value="1"
							<c:if test="${type eq 1 }">selected="selected"</c:if>>短信</option>
						<option value="2"
							<c:if test="${type eq 2 }">selected="selected"</c:if>>邮件</option>
					</select>
				</li>
				<li>
					<label style="margin-right: 40px;">&nbsp;&nbsp;收件人:</label>
					<input type="text" style="width: 380px;" id="getUserPerson" readonly="readonly" />
					<button type="button" id="chooseUser">筛选</button>
				</li>
				<li>
					<label style="margin-right: 40px;">计划模板:</label>
					<select style="width: 190px;" id="emailType" name="templateType">
						<option value="">请选择</option>
						<c:forEach items="${oneLevelTypeList }" var="emailType">
							<option value="${emailType.switchEnName }">${emailType.switchZhName }</option>
						</c:forEach>
					</select>
					<select style="width: 190px;" id="emailName" name="templateEnName">
						<option value="">请选择</option>
					</select>
					<span id="viewSmsEmailTemplateOfPlanBtn">预览模板</span>
				</li>
				<li>
					<label style="margin-right: 40px;">发送计划:</label>
					<label>发送时间：</label>
					<input id="start_send_time" type="text" name="sendBeginTime"
					class="date" dateFmt="yyyy-MM-dd HH" style="width: 180px"
					placeholder="开始时间" /> - <input id="end_send_time" type="text"
					name="sendEndTime" class="date" dateFmt="yyyy-MM-dd HH"
					style="width: 180px" placeholder="结束时间" />
				</li>
				<li>
					<label style="margin-right: 40px; color: #fff;">发送计划:</label>
					<label>发送间隔：</label>每 <select style="width: 120px;" name="intervalTime">
						<option value="1">1小时</option>
					</select> 发送 &nbsp;
					<input id="msgNum" type="text" onkeyup="value=value.replace(/[^\d]/g,'')" name="msgNum" style="width: 30px;" />
					封
				</li>
			</ul>
			<div style="padding-top: 30px;">
				<button type="button" style="width: 120px; margin-left: 75px;" id="submitPlan">提交</button>
				<button type="button" style="width: 120px; margin-left: 50px;" id="editplan">存至草稿箱</button>
			</div>
		</div>
	</form>
</div>

<!-- ----弹出框 -->
<div id="chooseGetUser" style="border: 1px solid #CCC; background-color: #fff; width: 650px; height: 440px; 
	position: absolute; top: 110px; left: 450px; display: none; z-index: 100;">
	<div
		style="height: 30px; background-color: #F2F2F2; padding: 10px 0 0 10px; border-bottom: 1px solid #ccc;">
		<span>收件人条件筛选</span> <span id="closebtn"
			style="float: right; margin-right: 15px; cursor: pointer;">X</span>
	</div>
	<form id="searchForm" method="post">
		<div class="conment">
			<ul>
				<li>
					<label>&nbsp;投资总额：</label>
					<input id="loanfloor" onkeyup="value=value.replace(/[^\d]/g,'')" type="text"
					name="loanfloor" /> - <input id="loanup" type="text" name="loanup"
					onkeyup="value=value.replace(/[^\d]/g,'')" />
				</li>
				<li>
					<label>投资时间：</label> 
					<input type="text" name="loanTimeFloor" id="loanTimeFloor" /> - <input type="text"
					name="loanTimeup" id="loanTimeup" />
				</li>
				<li>
					<label>投资次数：</label>
					<input id="loanCountFloor"
					onkeyup="value=value.replace(/[^\d]/g,'')" type="text"
					name="loanCountFloor" /> - <input type="text" id="loanCountUp"
					onkeyup="value=value.replace(/[^\d]/g,'')" name="loanCountUp" />
				</li>
				<li>
					<label>注册时间：</label> 
					<input type="text" name="regTimeFoolr" id="regTimeFoolr" /> - <input type="text" 
					name="regTimeUp" id="regTimeUp" />
				</li>
				<li>
					<label>&nbsp;活 跃 度：</label>
					<input type="radio" name="liveness" value="1" />
					<font>近一周内登录过</font>
					<input type="radio" name="liveness" value="2" />
					<font>近一周内没有登录过</font>
				</li>
				<li style="margin-left: 62px;">
					<input type="radio" name="liveness" value="3" />
					<font>近一个月内登录过</font>
					<input type="radio" name="liveness" value="4" />
					<font>近一个月内没有登录过</font>
				</li>
			</ul>
		</div>
		<div style="text-align: center; margin: 19px 0 10px 0;">
			<button type="button" style="width: 90px; height: 30px;" id="searchUser">搜索</button>
			<button id="reset" type="reset" style="width: 90px; height: 30px;">重置</button>
		</div>
		<div style="border-top: 1px solid #ccc; padding: 20px; height: 30px;">
			<span id="result"></span> <span style="float: right;">
				<button type="button" id="sureSend" class="bottom_btn">确认发送名单</button>
				<button type="button" id="exportReceiverList" class="bottom_btn">导出名单</button>
			</span>
		</div>
	</form>
</div>
<div id="backgrounddiv"
	style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; opacity: .3; 
	display: none; z-index: 50; background-color: #ccc;">
</div>