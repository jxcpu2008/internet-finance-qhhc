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
					<div class="panel panel-default text-para withdraw">
						<div class="panel-heading">
							<h4>提现申请</h4>
						</div>
						<div class="panel-body">
							<p class="mormal-font text-label">尊敬的前海红筹用户，前海红筹为您记录和保存了您的提现记录，敬请审阅。您还可以截取时间段来查询您的提现记录。</p>
							<div class="time-hline"></div>
							<ul
								class="list-unstyled list-inline cleargap text-center clearfix margin40">
								<li class="col-md-4"><span class="step">1</span>
									<p class="padding20">提现申请</p></li>
								<li class="col-md-4"><span class="step">2</span>
									<p class="padding20">跳转宝付，输入信息</p></li>
								<li class="col-md-4"><span class="step">3</span>
									<p class="padding20">完成提现</p></li>
							</ul>
							<div class="well well-lg clearfix">
								<p>
									您当前账户可用余额：<span class="text-danger mmedium-font"> &yen;
										<fmt:formatNumber type="number"
											value="${session_user.userfundinfo.cashBalance}"
											pattern="0.00" />
									</span> 元
								</p>
								<p>
									
								<c:choose>
									<c:when test="${session_user.fee eq 1 || empty goldPech}">
										提现额度：<span class="text-danger mmedium-font"> &yen; <fmt:formatNumber
											type="number"
											value="${session_user.userfundinfo.cashBalance>(2+platform_fee)?session_user.userfundinfo.cashBalance-2-platform_fee:0}"
											pattern="0.00" />
									</span> 元
									</c:when>
									<c:otherwise>
										提现额度：<span class="text-danger mmedium-font"> &yen; <fmt:formatNumber
											type="number"
											value="${session_user.userfundinfo.cashBalance}"
											pattern="0.00" />
									</span> 元
									</c:otherwise>
								</c:choose>
									
								</p>
								<p class="pull-right" style="margin-left:20px;">支付通道：宝付</p>
								<p class="pull-right" style="margin-left:20px;">
									平台手续费：<span class="text-danger mmedium-font" id="plat_fee">&yen; 0.0</span> 元
								</p>
								<c:if test="${session_user.fee eq 1 || empty goldPech}">
									<p class="pull-right" style="margin-left:20px;">
										手续费用(宝付扣费)：<span class="text-danger mmedium-font"> &yen;
											2.00</span> 元
									</p>
								</c:if>
							</div>
						</div>
						<div class="panel-footer bg-snow">
							<form class="form-horizontal margin40" id="withdraw_form"
								method="post">
								<input id="temp_id" type="hidden" value="${withdrawCard.id }" />
								<input id="withdraw_id" name="withdrawCardId" type="hidden" />
								<c:choose>
									<c:when test="${session_user.fee eq 1 || empty goldPech}">
										<input type="hidden" id="cashBalance"
											value="${session_user.userfundinfo.cashBalance>(2+platform_fee)?session_user.userfundinfo.cashBalance-2-platform_fee:0}" />
									</c:when>
									<c:otherwise>
										<input type="hidden" id="cashBalance" value="${session_user.userfundinfo.cashBalance}" />
									</c:otherwise>
								</c:choose>
								<div class="form-group">
									<label class="col-sm-3 control-label text-label mmedium-font">提现金额：</label>
									<div class="col-sm-5">
										<input type="text" class="form-control input-lg" name="money"
											id="wmoney" placeholder="" maxlength="9"
											onkeyup="value=value.replace(/[^\d\.]/g,'')">
									</div>
									<a id="withsubmit" class="btn btn-danger btn-lg smmedium-font"
										role="button">确认提现</a>
								</div>
								<c:if test="${!empty withdrawCard }">
									<div style="margin: -10px 240px;">
										<input id="withdraw_cbx" type="checkbox" ><span style="margin-left:5px;">提现券</span><span style="margin-left: 10px;">抵扣宝付手续费2元</span>
									</div>
								</c:if>
							</form>
							<h5 class="mormal-font text-danger">温馨提示 :</h5>
							<ul class="list-unstyled text-label">
								<li>1. 正常提现收取手续费2元/笔，由宝付从账户余额中收取，单笔提现金额不限；</li>
								<li>2.
									充值未认购即提现，则收取“充值未认购金额*1%+2元”的手续费。（例如：充值1000元，未认购即提现，手续费收取
									1000元X1%+2元=12元）；</li>
								<li>3.
									提现预计到账时间为T+1，T日16：00前申请提现一般当日到账（工作日），16:00后申请提现次工作日到账，遇双休日法定节假日顺延，实际到账时间依据账户托管方（第三方支付平台）及提现银行而有所差异；</li>
								<li>4. 提现过程中跳转宝付页面操作时输入信息错误时，请返回会员中心并重新提现申请；</li>
								<li>5.
									忘记宝付支付密码请登录宝付安全中心进行重置，宝付账户名即是注册手机号，宝付个人会员中心http://my.baofoo.com；</li>
								<li>6. 提现过程若有疑问，请及时联系我们：400-822-3499。</li>
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
	<script src="${oss}/resources/assets/script/withdraw.js?v=1.0.2"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>