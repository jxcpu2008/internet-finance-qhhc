<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="/resources/assets/css/packet1.css" rel="stylesheet">

</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="banner-1"></div>
	<div class="banner-2"></div>
	<div class="banner-3"></div>
	<div class="banner-4"></div>
	<div class="banner-5">
		<div class="sup sup-1">
			<p>从8月8日起，至8月31日止，凡是新注册</p>
			<p>的客户，送3元红包抵扣投资金额。</p>
			<p class="last">
				如想要更多红包，点击进入&nbsp;&nbsp;<a href="/visitor/to-regist">新手注册送360元大红包</a>
			</p>
		</div>
		<div class="sup sup-2">
			<p>新用户首次投资500元以上，还能额外获赠</p>
			<p>5元现金。</p>
			<p class="last">
				时间有限，机会难得，还在等什么呢？&nbsp;&nbsp;<a href="/loaninfo/loanList.htm?nav=2">快来投资吧!</a>
			</p>
		</div>
		<div class="sup sup-3">
			<p>在8月13、14日新老用户单笔投资达1400元</p>
			<p>以上的客户，还会再额外赠送5元现金。</p>
			<p class="last">
				新老用户，优惠多多!&nbsp;&nbsp;<a href="/loaninfo/loanList.htm?nav=2">快来投资吧!</a>
			</p>
		</div>
	</div>
	<div class="banner-6"></div>
	<div class="w1200 rules">
		<h3>活动规则</h3>
		<ul>
			<li>1、注册赠送的红包可直接抵扣投资金额，无任何金额限制；</li>
			<li>2、投资赠送的现金可在宝付账户进行查询；</li>
			<li>3、红包与现金可作为本金在前海红筹进行投资使用，到期可与投资收益一起提现；</li>
			<li>4、在8月13、14日新老用户投资赠送的现金的机会只有一次；</li>
			<li>5、用户可登陆前海红筹账户，进入”会员中心-我的红包“查看并使用红包；</li>
			<li>6、活动时间：2015年8月8日-2015年8月31日；</li>
			<li>7、红包使用截至时间：2016年2月3号；</li>
			<li>8、本次活动最终解释权归前海红筹所有。</li>
		</ul>
		<h3>红包如何使用</h3>
		<ul>
			<li>登录 我的账户 ，在 [ 会员中心 - 我的红包 ] 处可查看红包，在活动期限内投资可直接使用红包。</li>
		</ul>
	</div>
	<div class="w1200 right-now">
		<img src="/resources/assets/images/home/logo.png"
			class="img-responsive" alt="前海红筹">
		<div class="form-input">
			<form action="/visitor/to-regist" method="post" id="registForm">
				<input type="text" placeholder="输入手机号码" name="phone"><a
					href="javascript:;" id="toregister">立即注册</a>
			</form>

		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script type="text/javascript">
		$(function() {
			$("#toregister").click(function() {
				var phone = $("input[name='phone']").val();
				var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;

				if ($.trim(phone) == "") {
					ymPrompt.errorInfo('手机号码不能为空！', 400, 200, '失败', null);
					return;
				} else if (!myreg.test(phone)) {
					ymPrompt.errorInfo('手机号码格式不正确！', 400, 200, '失败', null);
					return;
				} else {
					$("#registForm").submit();
				}
			});

		});
	</script>
</body>
</html>
