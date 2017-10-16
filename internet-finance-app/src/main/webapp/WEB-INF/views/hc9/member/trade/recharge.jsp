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
					<div class="panel panel-default text-para charge">
						<div class="panel-heading">
							<h4>充值</h4>
						</div>
						<div class="panel-body">
							<div class="media clearfix">
								<div class="media-left padding20">
									<img src="${oss}/resources/assets/images/center/baofu.png">
								</div>
								<div class="media-body">
									<form class="form-horizontal margin40" id="recharge_form">
										<div class="form-group">
											<label class="col-sm-3 control-label text-label mmedium-font">充值金额：</label>
											<div class="col-sm-5">
												<input type="text" class="form-control input-lg" id="amount"
													name="amount" placeholder=""
													onkeyup="value=value.replace(/[^\d\.]/g,'')">
											</div>
											<div class="input-group-addon">元</div>
											<a href="javascript:;" onclick="rechargeSub()"
												class="btn btn-danger btn-lg smmedium-font" role="button">确定充值</a>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="panel-footer bg-snow">
							<h5 class="mormal-font text-danger">温馨提示 :</h5>
							<ul class="list-unstyled text-label">
								<li>1. 充值银行卡需开通网上支付功能；</li>
								<li>2. 充值过程中不收取任何手续费，由前海红筹进行代付；</li>
								<li>3. 根据不同的安全认证方式，充值单笔限额和每日限额会不同，具体请咨询银行客服；</li>
								<li>4. 由宝付跳转到银行界面进行支付，保证资金安全；</li>
								<li>5. 严禁利用充值功能进行信用卡套现、转账、洗钱等行为；</li>
								<li>6. 充值金额实时到帐，具体以银行系统处理时间为准；</li>
								<li>7. 充值期间，请勿关闭浏览器，待充值成功并返回会员中心后，所充资金才能入账，如有疑问，请及时联系我们：400-822-3499。</li>
							</ul>
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
	<script src="${oss}/resources/assets/script/recharge.js?v=1.0.2"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>