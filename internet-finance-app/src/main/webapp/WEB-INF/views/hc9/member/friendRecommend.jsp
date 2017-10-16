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
<link href="${oss}/resources/assets/css/center/center.css" rel="stylesheet"><jsp:include
	page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
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
				<div class="nav-right col-md-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="text-label">
								推荐好友购买产品，您即可获得相应佣金。
															
							</h4>
							<h4 class="text-label">
							<c:if test="${session_user.userType eq 2 }">
								<span class="text-danger">月标佣金 = 投资额 * 2% / 12 * 投资月份</span>&nbsp;&nbsp;&nbsp;
								<span class="text-danger">天标佣金 = 投资金额 * 2% / 360 * 投资天数</span>
							</c:if>
							<c:if test="${session_user.userType eq 4 }">
								<span class="text-danger">月标佣金 = 投资额 * 1.5% / 12 * 投资月份</span>&nbsp;&nbsp;&nbsp;
								<span class="text-danger">天标佣金 = 投资金额 * 1.5% / 360 * 投资天数</span>
							</c:if>
							<c:if test="${session_user.userType eq 6 || session_user.userType eq 1 || session_user.userType eq 3}">
								<span class="text-danger">月标佣金 = 投资额 * 0.5% / 12 * 投资月份</span>&nbsp;&nbsp;&nbsp;
								<span class="text-danger">天标佣金 = 投资金额 * 0.5% / 360 * 投资天数</span>
							</c:if>
							</h4>
						</div>
						<div class="panel-body">
							<div class="col-md-8 invited">
								<div>
									<h4 class="text-para">推荐链接</h4>
									<p class="text-label">推荐好友通过此链接注册会员，注册成功后即可成为您推荐的会员</p>
									<div class="form-inline text-label">
										<div class="form-group">
											<input type="text" class="form-control input-sm" id="promote_link" value="${promoteLikn }"
												readonly="readonly">
										</div>
										<button type="button" class="btn btn-danger btn-sm" id="copy_url">复制推荐链接</button>
									</div>
								</div>
								<div>
									<h4 class="text-para">推荐码</h4>
									<p class="text-label">推荐好友注册时，将此号码填入推荐码输入框</p>
									<div class="form-inline text-label">
										<div class="form-group">
											<input type="text" class="form-control input-sm" id="promote_code" readonly="readonly" value="${promoteNo}">
										</div>
										<button type="button" class="btn btn-danger btn-sm" id="copy_code">复制推荐码</button>
										<span class="help-block text-danger">* 也可填写注册手机号</span>
									</div>
								</div>
							</div>
							<div class="col-md-4 invited-qrcode">
								<div>
									<img class="img-responsive img-thumbnail center-block"
										src="/cic/QRcode" alt="" style="margin:40px auto 0;">
									<p class="smmedium-font text-danger text-center hline">分享二维码</p>
									<p class="smmedium-font text-danger text-center hline">推荐好友注册</p>
								</div>
							</div>
							<div class="col-md-12">
								
							</div>
						</div>
					</div>
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
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/script/jquery.zclip.min.js"></script>
	<script src="${oss}/resources/assets/script/friendRecommend.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>