<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/assets/css/login.css?v=1.0.1" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container bg-login">
		<div class="container">
			<input type="hidden" id="errorPwd" value="${errorPwd }" /> <input
				type="hidden" id="isLogin" value="${isLogin }" /> <input
				type="hidden" id="skip" value="${skip }" />
			<div class="login">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="text-para">登录</h4>
					</div>
					<div class="panel-body bg-container">
						<form class="form-horizontal" method="post" id="loginForm">
							<div class="form-group">
								<label class="text-label">用户名/手机号码</label> <input type="text"
									class="form-control" id="loginName" name="userName"
									value="${userName }" placeholder="" data-id="login-man"
									data-container="body" data-toggle="popover"
									data-placement="right" data-trigger="focus"
									data-content="请输入用户名/手机号码"><span
									class="glyphicon form-control-feedback"></span>
							</div>
							<div class="form-group">
								<label class="text-label">密码</label> <input type="password"
									class="form-control" id="loginPwd" name="pwd" placeholder=""
									data-id="login-passwd" data-container="body"
									data-toggle="popover" data-placement="right"
									data-trigger="focus" data-content="请输入密码"><span
									class="glyphicon form-control-feedback"></span>
							</div>
							<div class="form-group">
								<label class="text-label vercode-text">验证码</label> <input
									type="text" class="form-control vercode" id="captcha"
									maxlength="4" name="captcha" placeholder=""
									data-id="login-vercode"><span
									class="glyphicon form-control-feedback"></span> <img id="code"
									class="imgcapt" src="/cic/code?name=user_login"
									onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();"
									title="看不清，点击换一张" style="cursor: pointer;" />
							</div>
							<a href="/find_password/init.do" class="text-label forgot"><small>忘记密码</small></a>
							<button type="button" id="formSubmit"
								class="btn btn-danger btn-block normal-font">立即登录</button>
							<p class="text-label text-right noaccount">
								<small>没有账号，现在<a href="${https }/visitor/to-regist"
									class="text-danger">注册</a></small>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/js/src/login-modules.js"></script>
	<script src="${oss}/resources/assets/js/login.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>