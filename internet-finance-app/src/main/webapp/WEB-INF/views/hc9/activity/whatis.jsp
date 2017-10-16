<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="/resources/assets/css/home.css" rel="stylesheet" />
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" /><style
	type="text/css">
.whatis {
	background-color: #fafafa;
	min-height: 2783px;
	font-family: "微软雅黑";
}

.whatis-foot {
	margin-top: 0;
}

.main-title {
	height: 65px;
	padding-top: 50px;
}

.main-line>img {
	margin-top:-14px;
}

.hold-title {
	font-family: "微软雅黑";
	font-weight: 400;
	font-size: 32px;
	line-height: 32px;
	margin: 0 auto;
	text-align: center;
	width: 267px;
	height: 32px;
	position: relative;
	background-color: #fafafa;
	z-index: 1;
}

.whatis .first, .whatis .second {
	min-height: 200px;
	width: 900px;
	margin: 60px auto;
	font-size: 18px;
	background-color: #ebebeb;
}

.whatis .first ul, .whatis .second ul {
	padding-top: 60px;
	padding-left: 40px;
}

.whatis .first li, .prot {
	line-height: 38px;
	color: #666;
}

.prot {
	font-size: 14px;
}

.level-clr {
	color: #ce251f;
	font-weight: 700;
	margin-right: 5px;
}

.first-title, .second-title {
	width: 240px;
	height: 54px;
	background-color: #ce251f;
	position: absolute;
	margin-left: 40px;
	margin-top: -10px;
	z-index: 5;
}

.first-title>img, .second-title>img {
	margin-left: 15px;
	margin-top: -6px;
	margin-right: 5px;
}

.first-title>span, .second-title>span {
	color: #fff;
	font-size: 26px;
	line-height: 50px;
}

.angle-left {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-color: #fafafa #cf1d1d #cf1d1d #fafafa;
	border-image: none;
	border-style: solid;
	border-width: 5px;
	height: 0;
	margin-top: -10px;
	margin-left: 30px;
	position: absolute;
	width: 0;
	z-index: 4px;
}

.angle-right {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-color: #fafafa #fafafa #cf1d1d #cf1d1d;
	border-image: none;
	border-style: solid;
	border-width: 5px;
	height: 0;
	margin-top: -10px;
	margin-left: 280px;
	position: absolute;
	width: 0;
	z-index: 4px;
}

.second-content {
	padding-bottom: 10px;
}

.prot-box {
	border-bottom: 1px solid #bbb;
	padding-bottom: 50px;
	width: 820px;
}

.prot-title {
	width: 310px;
	height: auto;
}

.prot-img {
	margin-top: 10px;
}

.prot-4 {
	position: absolute;
	margin-top: 65px;
	margin-left: 8px;
}

.prot-3 {
	position: absolute;
	margin-top: -30px;
	margin-left: 196px;
}

.prot-2 {
	position: absolute;
	margin-top: 48px;
	margin-left: 114px;
}

.prot-1 {
	margin-left: 6px;
}

.cont-pad>ul {
	margin-left: 18px;
}

.prot-process {
	margin: 30px auto;
	text-align: center;
}

.get-started {
	width: 280px;
	height: 50px;
	margin: 60px auto 40px;
	background-color: #ce251f;
}

.get-started>a {
	display: block;
	line-height: 50px;
	text-align: center;
	color: #fff;
	text-decoration: none;
	font-size: 22px;
}
</style>
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<!-- header end -->
	<div class="bg-container">
			<div class="container">
	<div class="whatis">
		<div class="xl_name clr main-title">
			<div class="main-line clearfix">
				<h1 class="hold-title">什么是众持模式?</h1>
				<img src="/resources/images/main_line.jpg" class="center-block" />
			</div>
			<div class="first">
				<div class="angle-left"></div>
				<div class="first-title">
					<img src="/resources/images/1_03.jpg" /> <span>三种投资方式</span>
				</div>
				<div class="angle-right"></div>
				<ul class="list-unstyled">
					<li><span class="level-clr">优先级别</span>保本保收益，收益(年化率)稳定。</li>
					<li><span class="level-clr">夹层级别</span>保本不保收益，根据项目实际融资额分配收益。</li>
					<li><span class="level-clr">劣后级别</span>不保本不保收益，风险高收益高，对投资人有限制。</li>
				</ul>
			</div>
			<div class="second">
				<div class="angle-left"></div>
				<div class="second-title">
					<img src="/resources/images/1_06.jpg" /> <span>四重保障</span>
				</div>
				<div class="angle-right"></div>
				<div class="second-content">
					<div class="cont-pad">
						<ul class="list-unstyled list-inline prot-box">
							<li class="prot-title">
								<p class="level-clr">保障① : 第三方资金托管</p>
								<p class="prot">所有投资方、融资方往来的资金，由第三方支付公司(我司采用上海宝付公司)全权资金托管。</p>
							</li>
							<li class="prot-img prot-1"><img
								src="/resources/images/1_10.jpg" /></li>
						</ul>
					</div>
					<div class="cont-pad">
						<ul class="list-unstyled list-inline prot-box">
							<li class="prot-img"><img src="/resources/images/1_14.jpg" /></li>
							<li class="prot-title prot-2">
								<p class="level-clr">保障② : 融资方抵押物</p>
								<p class="prot">由前海红筹指定第三方对融资方抵押物进行估值并签订抵押协议。</p>
							</li>
						</ul>
					</div>
					<div class="cont-pad">
						<ul class="list-unstyled list-inline prot-box">
							<li class="prot-title">
								<p class="level-clr">保障③ : 劣后(投资人)</p>
								<p class="prot">"劣后"投资方式是不保本不保收益，抵押物变现后赔付前两项投资人如还有剩余资金平均分配给"劣后"的投资人。</p>
							</li>
							<li class="prot-img prot-3"><img
								src="/resources/images/1_18.jpg" /></li>
						</ul>
					</div>
					<div class="cont-pad">
						<ul class="list-unstyled list-inline prot-box">
							<li class="prot-img"><img src="/resources/images/1_22.jpg" /></li>
							<li class="prot-title prot-4">
								<p class="level-clr">保障④ : 担保公司、保险公司</p>
								<p class="prot">如果融资方抵押物因市场行情贬值严重不足以赔付"优先"本金及收益、"夹层"本金，(劣后全额亏空)不够部分将由保险公司理赔或由第三方担保公司赔付。</p>
							</li>
						</ul>
					</div>
					<div class="prot-process">
						<img src="/resources/images/1_26.jpg" />
					</div>
					<c:if test="${empty session_user}">
						<div class="get-started">
							<a href="${https }/visitor/to-regist">免费注册, 开始理财</a>
						</div>
					</c:if>
					<c:if test="${!empty session_user}">
						<div class="get-started">
							<a href="/loaninfo/loanList.htm">查看项目，开始理财</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</div></div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
</body>
</html>
