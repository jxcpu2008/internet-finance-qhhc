<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/vendor/css/calendar.css" rel="stylesheet">
<link href="${oss}/resources/assets/css/center/center.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- 页头 -->
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="center bg-snow clearfix">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<input type="hidden" id="phone" value="${userbasic.userrelationinfo.phone}">
				<input type="hidden" id="CSRFToken" name="CSRFToken" value="${csrf}" /> 
				<div class="nav-right col-md-10">
					<ul class="list-group text-para clearfix">
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-user center-block textbottom-align"></span>
								&nbsp;&nbsp;用户名 <span class="user-info text-label">${userbasic.userName }</span>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-vid center-block textbottom-align"></span>
								&nbsp;&nbsp;实名认证
								<c:if test="${userbasic.cardStatus ne 2 }"> <span class="user-info">您还未实名认证</span></c:if>
								<c:if test="${userbasic.cardStatus eq 2 }"> <span class="user-info text-label">真实姓名：${userbasic.name }</span>
								<c:set var="cardId" value="${userbasic.userrelationinfo.cardId }"/>
								<span class="user-info text-label">身份证：${cardId.replace(cardId.substring(3,cardId.length()-4),"******") }</span></c:if>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-email center-block textbottom-align"></span>
								&nbsp;&nbsp;绑定邮箱 <span class="user-info"><c:if
										test="${userbasic.userrelationinfo.emailisPass eq 0}">您还未绑定邮箱</c:if>
									<c:if test="${userbasic.userrelationinfo.emailisPass eq 1}">${userbasic.userrelationinfo.email}</c:if></span>
								<a href="#envelope-binding"
									class="btn btn-danger btn-xs normal-font col-xs-1 pull-right"
									role="button" data-toggle="collapse" aria-expanded="false"
									aria-controls="envelope-binding">修改</a>
							</div>
							<div class="collapse" id="envelope-binding">
								<div class="panel-body">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">邮箱：</label>
											<div class="col-sm-4">
												<input type="email" class="form-control" id="email_val"
													placeholder="输入新邮箱地址" data-id="email"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button"
													class="btn btn-warning btn-sm col-sm-2 normal-font" id="uptEmail">提交</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-mobile center-block textbottom-align"></span>
								&nbsp;&nbsp;绑定手机 <span class="user-info">${userbasic.userrelationinfo.phone}</span>
								<a href="#phone-binding"
									class="btn btn-danger btn-xs normal-font col-xs-1 pull-right"
									role="button" data-toggle="collapse" aria-expanded="false"
									aria-controls="phone-binding">修改</a>
							</div>
							<div class="collapse" id="phone-binding">
								<div class="panel-body">
									<form class="form-horizontal" id="form_bindPhone">
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">手机号码：</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="newPhone" name="newPhone"
													placeholder="输入新手机号码" data-id="phone"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">短信验证码：</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="p_valifyCode" name="smscode"
													placeholder="短信验证码" data-id="phone-code"><span class="glyphicon form-control-feedback"></span>
											</div>
											<button type="button" class="btn btn-warning btn-sm normal-font w15" id="phone_getCode">获取手机验证码</button>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">交易密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" id="trade_pwd" name="tradePwd"
													placeholder="输入交易密码" data-id="trade-code"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button"
													class="btn btn-warning col-sm-2 normal-font" id="bindPhone">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-smbaofu center-block textbottom-align"></span>
								&nbsp;&nbsp;宝付账户 									
									<c:if test="${empty userbasic.pMerBillNo}">
								<span class="user-info">暂未开通宝付</span><a href="#baofuModal"
									class="btn btn-warning btn-xs normal-font col-xs-2 pull-right" data-toggle="modal"
									role="button">立即开通宝付</a></c:if>
									
								<c:if test="${!empty userbasic.pMerBillNo}">
								<span class="user-info">${userbasic.pMerBillNo}</span><a href="https://my.baofoo.com/" target="_blank"
									class="btn btn-danger btn-xs normal-font col-xs-2 pull-right"
									role="button">登录我的宝付</a></c:if>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-lock center-block textbottom-align"></span>
								&nbsp;&nbsp;登录密码 <span class="user-info">已设置</span> <a href="#loginpasswd"
									class="btn btn-danger btn-xs normal-font col-xs-1 pull-right"
									role="button" data-toggle="collapse" aria-expanded="false"
									aria-controls="loginpasswd">修改</a>
							</div>
							<div class="collapse" id="loginpasswd">
								<div class="panel-body">
									<form class="form-horizontal" id="form_uptLoginPwd" action="/update_info/update_pwd">
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">原登录密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="oldPwd"
													placeholder="输入原登录密码" data-id="origin-passwd"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">新登录密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="newPwd"
													placeholder="输入新登录密码" data-id="new-passwd"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">确认新登录密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="surePwd"
													placeholder="确认新登录密码" data-id="renew-passwd"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" id="uptLoginPwd"
													class="btn btn-warning col-sm-2 normal-font">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div>
								<span
									class="icon-navlist icon-moneybox center-block textbottom-align"></span>
								&nbsp;&nbsp;交易密码 <a href="#paypasswd"
									class="btn btn-danger btn-xs normal-font col-xs-1 pull-right"
									role="button" data-toggle="collapse" aria-expanded="false"
									aria-controls="paypasswd">修改</a>
							</div>
							<div class="collapse" id="paypasswd">
								<div class="panel-body">
									<form class="form-horizontal" id="form_uptTradePwd">
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">新交易密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="newPwd"
													placeholder="输入新交易密码" data-id="new-trade-passwd"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">确认新交易密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="surePwd"
													placeholder="确认新交易密码" data-id="renew-trade-passwd"><span class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">手机号：</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" value="${userbasic.userrelationinfo.phone }" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label text-label">验证码：</label>
											<div class="col-sm-2">
												<input type="text" class="form-control" id="verifyCode" name="code"
													placeholder="短信验证码" data-id="verifyCode"><span class="glyphicon form-control-feedback"></span>	
											</div>
											<button type="button" class="btn btn-warning btn-sm normal-font w15" id="getPhoneCode">获取手机验证码</button>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="button" id="uptTradePwd"
													class="btn btn-warning col-sm-2 normal-font">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/js/jquery.form.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<script src="${oss}/resources/assets/js/src/center/baofu-modules.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/script/accountSet.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>