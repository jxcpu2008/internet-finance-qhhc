<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${title}</title>
<link rel="stylesheet" type="text/css"
	href="${oss}/resources/assets/css/retrieve_pwd.css" />
<!-- head -->
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
</head>
<body>
	<!--Content-->
	<div class="bg-container">
		<div class="container">
			<div class="bread">
				<span class="text-label">您当前的位置：</span>
				<ol class="list-unstyled list-inline">
					<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>
					<li class="glyphicon-custom"><a href="/find_password/init.do">找回登录密码</a></li>
				</ol>
			</div>
			<!--找回密码-->
			<div class="contwrap">
				<div class="forgotpwdBox">
					<form>
						<div class="forgotpwdHead">
							<span class="forgotpwdone iconPwd_one"></span><span
								class="forgotpwdtwo iconPwd_twos"></span>
						</div>
						<div class="clear"></div>
						<table cellspacing="0" cellpadding="0" class="forgotpwdTable"
							id="forgotpwdMobile" style="display: none;">
							<tbody>
								<tr>
									<th>手机号码：</th>
									<td><input type="text"
										class="forgotpwdTx curvyCorners_2 w120px" id="yhphone"
										name="phone" onkeyup="value=value.replace(/[^\d\.]/g,'')" /></td>
								</tr>
								<!-- <tr>
									<th></th>
									<td><input type="text" name="captcha" id="captcha"
										placeholder="请输入验证码"
										style="left: 0; width: 120px; height: 15px; padding: 10px 0 10px 40px; font-size: 14px; z-index: 1" />
										<img src="/cic/code?name=user_login"
										onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();"
										title="看不清，点击换一张"
										style="cursor: pointer; width: 90px; height: 35px; margin-left: 10px; float: right" /></td>
								</tr> -->
								<tr>
									<th>验证码：</th>
									<td><input type="text"
										class="forgotpwdTx curvyCorners_2 w50px" id="yhmphone"
										name="smsCode" onkeyup="value=value.replace(/[^\d\.]/g,'')" /><span
										class="forgotpwdBnt_two curvyCorners_2"
										style="height: 28px; line-height: 28px; margin-left: 10px;"
										id="getcode" onkeyup="value=value.replace(/[^\d\.]/g,'')">获取验证码</span></td>
								</tr>

								<tr>
									<th></th>
									<td><input type="button" value="提交"
										class="forgotpwdBnt curvyCorners_5" id="findbyphone" /></td>
								</tr>
							</tbody>
						</table>

						<table cellspacing="0" cellpadding="0" class="forgotpwdTable"
							id="forgotpwdEmail">
							<tbody>
								<tr>
									<th>邮箱地址：</th>
									<td><input type="text"
										class="forgotpwdTx curvyCorners_2 w120px" id="yhemail" /></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="button" id="findbyemail" value="提交"
										class="forgotpwdBnt curvyCorners_5" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<p class="forgotpwdSevers">若您无法使用上述方法找回，请联系客服${footer.phone }</p>
			</div>
			<!--End 找回密码-->
		</div>
	</div>
	<!--End Content-->
	<div class="clear"></div>
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script type="text/javascript">
		$(function() {
			$(".forgotpwdone").click(function(){
				$("#forgotpwdMobile").css('display','table');
				$("#forgotpwdEmail").hide();
				$(this).addClass('iconPwd_ones').siblings().removeClass('iconPwd_twos').addClass('iconPwd_two');
			});
			$(".forgotpwdtwo").click(function(){
				$("#forgotpwdEmail").css('display','table');
				$("#forgotpwdMobile").hide();
				$(this).removeClass('iconPwd_two').addClass('iconPwd_twos').siblings().removeClass('iconPwd_ones');
			});
			function valiCode() {
				var yhphone = $("#yhphone").val();
				if (yhphone.length != 11) {
					ymPrompt.errorInfo("请输入11位的移动电话号码", 400, 200, "温馨提示", null);
					return false;
				}
				$.ajax({
					type : 'post',
					data : {
						phone : yhphone
					},
					url : '/find_password/findphone.do',
					success : function(msg) {
						if (msg == 1) {
							ymPrompt.succeedInfo("找回密码短信发送成功!", 400, 200,
									"温馨提示", null);
							$('#getcode').unbind('click').css({
								'width' : '123px'
							});
							var time = 120;
							var code = setInterval(function() {
								if (time == 0) {
									clearInterval(code);
									$('#getcode').css({
										'width' : '80px'
									}).text('获取验证码').bind('click', valiCode);
								} else {
									$('#getcode').text(function() {
										--time;
										prefix = time < 10 ? '0' : '';
										return prefix + time + '秒后重新发送';
									});
								}
							}, '1000');
						} else if (msg == 2) {
							ymPrompt.errorInfo("你输入的电话号码不存在！", 400, 200,
									"温馨提示", null);
						} else if (msg == 4) {
							ymPrompt.errorInfo("短信发送频繁，请2分钟后再发！", 400, 200,
									"温馨提示", null);
						} else {
							ymPrompt.errorInfo("短信发送失败！", 400, 200, "温馨提示",
									null);
						}
					}
				});
			}
			// 手机验证码
			$('#getcode').bind('click', valiCode);
			$("#findbyphone")
					.click(
							function() {
								/* var captcha = $("#captcha").val();
								if (captcha=="") {
									ymPrompt.errorInfo("请输入图片验证码！", 300, 160,
											"温馨提示", null);
									return false;
								} */
								var yhphone = $("#yhphone").val();
								if (yhphone.length != 11) {
									ymPrompt.errorInfo("请输入11位的移动电话号码", 400,
											200, "温馨提示", null);
									return false;
								}
								var yhmphone = $("#yhmphone").val();
								if (yhmphone.length != 6) {
									ymPrompt.errorInfo("请输入6位的短信验证码", 400, 200,
											"温馨提示", null);
									return false;
								}
								$
										.ajax({
											type : 'post',
											data : {
												phone : yhphone,
												smsCode : yhmphone
											},
											url : '/find_password/checksmsCode',
											success : function(msg) {
												if (msg == 1) {
													//跳 转到更改页面
													window.location.href = "/find_password/toUpdate";
												} else if (msg == 2) {
													ymPrompt.errorInfo(
															"请重新发送短新验证码！", 400,
															200, "温馨提示", null);
												} else if (msg == 3) {
													ymPrompt.errorInfo(
															"验证码输入错误！", 380,
															190, "温馨提示", null);
												} else if (msg == 5) {
													ymPrompt.errorInfo(
															"该手机号码不存在！", 380,
															190, "温馨提示", null);
												} else {
													ymPrompt.errorInfo(
															"找回密码失败！", 380,
															190, "温馨提示", null);
												}
											}
										});
							});

			//邮箱
			$("#findbyemail")
					.click(
							function() {
								var yhemail = $("#yhemail").val();
								var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
								if (!reg.test(yhemail)) {
									ymPrompt.errorInfo("请输入正确的邮箱！", 360, 190,
											"温馨提示", null);
									return false;
								}
								$.ajax({
									type : 'post',
									data : {
										email : yhemail
									},
									url : '/find_password/findemail.do',
									success : function(msg) {
										if (msg == 1) {
											ymPrompt.succeedInfo("找回密码邮件发送成功!",
													360, 190, "温馨提示");
										} else if (msg == 2) {
											ymPrompt.errorInfo("找回密码邮件发送频繁！",
													360, 190, "温馨提示");
										} else if (msg == 3) {
											ymPrompt.errorInfo("你输入的邮箱不存在！",
													360, 190, "温馨提示");
										} else {
											ymPrompt.errorInfo("发送失败！", 360, 190, "温馨提示");
										}
									}
								});
							});
		});
	</script>
</body>
</html>

