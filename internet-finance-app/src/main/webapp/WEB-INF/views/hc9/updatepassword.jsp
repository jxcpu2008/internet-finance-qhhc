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
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
</head>
<body>
	<div class="bg-container">
		<div class="container">
			<div class="bread">
				<span class="text-label">您当前的位置：</span>
				<ol class="list-unstyled list-inline">
					<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>
					<li class="glyphicon-custom"><a href="/find_password/init.do">找回登录密码</a></li>
				</ol>
			</div>
			<div class="contwrap">
				<div class="forgotpwdBox">
					<form id="find_password_form" method="post"
						onsubmit="return false;">
						<input type="hidden" value="${updateuser.id}" name="id" />
						<div class="clear"></div>
						<table cellspacing="0" cellpadding="0" class="forgotpwdTable"
							id="forgotpwdEmail">
							<tbody>
								<tr>
									<th>用户名：</th>
									<td><input type="text"
										class="forgotpwdTx curvyCorners_2 w120px" readonly="readonly"
										value="${updateuser.userName}" /></td>
								</tr>
								<tr>
									<th>新密码：</th>
									<td><input type="password"
										class="forgotpwdTx curvyCorners_2 w120px validate[required,maxSize[12],minSize[6]]"
										name="passwordfd" id="passwordfd" /></td>
								</tr>
								<tr>
									<th>确认密码：</th>
									<td><input type="password"
										class="forgotpwdTx curvyCorners_2 w120px validate[required,equals[passwordfd],maxSize[12],minSize[6]]"
										name="passwordfd_again" id="passwordfd_again" /></td>
								</tr>
								<tr>
									<th></th>
									<td><input type="button" value="重置密码"
										class="forgotpwdBnt curvyCorners_5" id="submit_form"/></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<p class="forgotpwdSevers">若您无法使用上述方法找回，请联系客服${footer.phone }</p>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script type="text/javascript">
		$(function(){
			$("#submit_form").click(function(){
				var pwd = $("#passwordfd").val();
				if (pwd.length >= 6 && pwd.length <= 18) {
					$.post("/find_password/checkpasswordbylink",{"password":$("#passwordfd").val(),"passwordagain":$("#passwordfd_again").val()},function(data){
						if(data==-1){
							location.href = "/find_password/init.do";
						}else if(data==-3){
							ymPrompt.errorInfo("密码为空，或者两次密码输入不同！",400,200,"温馨提示",null);
						}else if(data==1){
							ymPrompt.succeedInfo("密码重置成功！",320,180,"温馨提示",function(){
								window.location.href='${https}/visitor/to-login';
							});
						}
					});
				} else {
					ymPrompt.errorInfo("密码长度为6-18位！",400,200,"温馨提示",null);
				}
			});
		});
	</script>
</body>
</html>