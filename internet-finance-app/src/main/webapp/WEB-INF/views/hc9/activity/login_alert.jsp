<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#zcModal_login .form-control {
	height: 48px;
}

#zcModal_login .form-control:not (.vercode ){
	padding-left: 45px;
}

#zcModal_login .modal-body {
	padding-left: 34px;
	padding-right: 34px;
}

#zcModal_login .form-control:focus {
	border-color: #d9534f;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .075) inset, 0 0 8px
		rgba(217, 83, 79, .6);
	outline: 0 none;
}

#zcModal_login .help-block {
	position: absolute;
}

.icon-login {
	background-image: url(${oss}/resources/assets/images/home/icon-login.png);
	background-repeat: no-repeat;
	display: inline-block;
	width: 21px;
	height: 23px;
	overflow: hidden;
	vertical-align: middle;
	position: absolute;
	margin-left: 12px;
	margin-top: -35px;
}

.login-user {
	background-position: 0 0;
}

.login-lock {
	background-position: -21px 0;
}

.vercode {
	width: 206px;
	display: inline-block;
}

#zcModal_login .checkbox, .forgot {
	display: inline-block;
}

.forgot {
	width: 221px;
	text-align: right;
}

.forgot>a:hover {
	color: #d9534f;
}

a[type="submit"] {
	margin-bottom: 40px;
	height: 50px;
	line-height: 37px;
}

.icon-checkbox {
	background-image: url(${oss}/resources/assets/images/home/checkbox.png);
	background-repeat: no-repeat;
	display: inline-block;
	height: 20px;
	overflow: hidden;
	vertical-align: middle;
	position: absolute;
	margin-left: -21px;
	margin-right: 15px;
}

.checkbox-ok {
	width: 20px;
	background-position: 0 0;
}

.checkbox-remove {
	width: 21px;
	background-position: -19px 0;
}

.last span {
	padding-left: 8px;
}

.last label {
	*display: inline;
	*zoom: 1;
}

.to-loan {
	background-image: url(${oss}/resources/assets/images/home/loan.jpg);
	background-repeat: no-repeat;
	width: 215px;
	height: 55px;
	line-height: 55px;
	display: block;
	margin: 60px auto 40px;
	text-decoration: none;
	font-size: 24px;
	color: #fff;
	text-align: center;
}

.to-loan:hover {
	text-decoration: none;
	color: #fff;
}

#val_error,#ln_error {
	visibility: hidden;
}
</style>
<!-- 登录注册 -->
<div class="modal fade" id="zcModal_login" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog" style="width: 397px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title lgmedium-font text-danger">用户登录</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="loginForm">
					<div class="form-group" style="margin-bottom: 40px;">
						<input type="text" class="form-control" id="loginName" name="userName" value="${userName }"
							placeholder="邮箱/用户名/手机号码" style="padding-left: 45px;"> <i
							class="icon-login login-user"></i>
						<p class="help-block text-danger normal-font" id="ln_error">用户名不能为空</p>
					</div>
					<div class="form-group" style="margin-bottom: 40px;">
						<input type="password" class="form-control"
							style="padding-left: 45px;" id="loginPwd" name="pwd" placeholder="密码">
						<i class="icon-login login-lock"></i>
						<p class="help-block text-muted normal-font" id="pw_error">6-18位字符</p>
					</div>
					<div class="form-group" style="margin-bottom: 40px;">
						<input type="text" class="form-control vercode" id="captcha" name="captcha"
							placeholder="验证码"> <span id="val_code" style="width: 85px; height: 48px; margin-left: 15px;"></span>
						<p class="help-block text-danger normal-font" id="val_error">验证码输入错误</p>
					</div>
					<div class="form-group last">
						<div class="checkbox">
							<label style="max-width: 200px;"><input type="checkbox" name="remember_user"
								checked="checked"><i class="icon-checkbox checkbox-ok"></i><span>记住用户名</span></label>
						</div>
						<div class="forgot">
							<a href="/find_password/init.do" class="text-label">忘记密码</a> <span>&nbsp;|&nbsp;</span>
							<a href="${https }/visitor/to-regist" class="text-danger">立即注册</a>
						</div>
					</div>
					<a type="submit" id="formSubmit" class="btn btn-danger btn-block mmedium-font">立即登录</a>
				</form>
			</div>
		</div>
	</div>
</div>