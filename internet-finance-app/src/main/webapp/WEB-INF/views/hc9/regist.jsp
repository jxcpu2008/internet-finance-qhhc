<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/assets/css/signup.css" rel="stylesheet">
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet" />
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />

</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<input type="hidden" id="channel" name="channel" value="${channel}" />
	<div class="bg-container">
		<div class="container">
			<div class="bg-snow signup clearfix">
				<div class="page-header">
					<h2>注&nbsp;册</h2>
				</div>
				<div class="panel panel-default pull-left">
					<div class="panel-body">
						<p class="mmedium-font text-label or">
							<span>或</span><span class="normal-font">&nbsp;&nbsp;我已有账号，现在就<a
								href="${https }/visitor/to-login" class="text-danger">登录</a></span>
						</p>
						<form class="form-horizontal" method="post" id="regForm">
							<input type="hidden" id="CSRFToken" name="CSRFToken"
								value="${csrf}" /> <input type="hidden" id="tgId"
								value="${tgId }" />

							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 用户名：</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="" name="userName"
										placeholder="" data-id="username" data-container="body" value="${phone}"
										data-toggle="popover" data-placement="right"
										data-trigger="focus" data-content="6-18位字符,可由字母、数字及'_'组合"><span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 设置密码：</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="regPwd"
										name="pwd" placeholder="" data-id="passwd"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="6-18位字符，包括英文字母、数字或符号"><span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 确认密码：</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="" name="pwd2"
										placeholder="" data-id="repasswd" data-container="body"
										data-toggle="popover" data-placement="right"
										data-trigger="focus" data-content="输入确认密码"><span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 手机号码：</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="" name="phone1"
										placeholder="" data-id="phone" data-container="body"
										data-toggle="popover" data-placement="right" value="${phone}" 
										data-trigger="focus" data-content="输入11位数字的手机号"><span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 验证码：</label>
								<div class="col-sm-2 w185">
									<input type="text" class="form-control" id="imagecode"
										name="imgcode" placeholder="" data-id="img-code" maxlength="4" ><span
										class="glyphicon form-control-feedback"></span>
								</div>
								<img id="code" class="imgcapt" src="/cic/code?name=user_login"
									onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();"
									title="看不清，点击换一张" style="cursor: pointer; height: 33px" />
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"><span
									class="text-danger">*</span> 校验码：</label>
								<div class="col-sm-2 w185">
									<input type="text" class="form-control" id="" name="pcode"
										placeholder="" data-id="phone-code" maxlength="6" disabled><span
										class="glyphicon form-control-feedback"></span>
								</div>
								<button type="button" class="btn btn-danger" id="sendPCode" >获取手机校验码</button>
							</div>
							<c:if test="${channel ne 'channel'}">
							<div class="form-group">
								<label class="col-sm-2 control-label text-label">推荐码：</label>
								<div class="col-sm-5">
									<a href="#invited-code" class="btn text-label"
										data-name="invited-code" data-toggle="collapse"
										aria-expanded="false" aria-controls="invited-code"><span
										class="glyphicon glyphicon-menu-down text-label"
										aria-hidden="true"></span> (可选)</a>
								</div>
							</div>
							</c:if>
							<div class="form-group">
								<label class="col-sm-2 control-label text-label"></label>
								<div class="col-sm-5 collapse" id="invited-code">
									<input type="text" class="form-control" id="number"
										name="number" value="${tgId }" placeholder=""
										data-id="invited-code" data-container="body"
										data-toggle="popover" data-placement="right"
										data-trigger="focus" data-content="请输入推荐人编号或手机号"><span
										class="glyphicon form-control-feedback"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox"> 我已阅读并同意</label> <a
											href="#" id="regters" class="hc-protocol text-label"><<前海红筹网站服务协议>></a>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-5">
									<button type="button" class="btn btn-danger btn-block"
										id="regSubmit">立即注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="pull-right bg-signup">
					<img class="img-responsive img-thumbnail center-block" src="${oss}/resources/assets/images/home/bg-signup.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- 前海红筹网站服务协议模态框 -->
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">前海红筹网站服务协议</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none;">
		<div class="popup-record" id="record">
			<div style="font-size: 18px; position: relative;background: url(${oss}/resources/assets/images/center/news/news-popupBg.png) 0 0 no-repeat;width: 498px;height:705px;">
				<div style="position: absolute;top:120px;left:50%;margin-left: -92px;"><img src="${oss }/resources/assets/images/center/news/news-registbg.png" /></div>
				<div style="position: absolute;top:394px;left:50%;margin-left: -182px;">
					<p style="text-align: center; line-height: 35px; color: #666666;font-size: 16px;"><span style="font-size: 24px; color: #444444;">恭喜您</span><br>
					成功完成注册，现在赶紧去领取您的百元红包大礼！<br>完成更多的新手任务，将有终极大奖等着你！</p>
				</div>
				<a style="position: absolute;top:540px;left:50%;margin-left: -130px;background-color: #f15252; color:#ffffff; text-decoration: none; padding: 10px 100px;border-radius:25px;" href="/neweractivity/totask.htm">去领取</a>
				<a style="position: absolute;top:600px;left:50%;margin-left: -130px;background-color: white; color:#f15252; text-decoration: none;border:1px solid #f15252; padding: 8px 88px;border-radius:25px;" href="/member_index/member_center.htm?index=0_0_3&nav=5">开通宝付</a>
			</div>
		</div>
	</div>
	<!-- end  -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/js/src/signup-modules.js"></script>
	<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js?v=2.1.5"></script>
	<script src="${oss}/resources/assets/js/signup.js?v=1.0.4"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>