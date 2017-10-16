<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<link rel="stylesheet"
	href="${oss}/resources/public/css/style.css?v=1.0" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<style>
.roll-bg1 {
	background: url(/resources/public/images/dada/roll/roll-bg_01.jpg?v=1.2) top center no-repeat;
	height: 810px;
	position: relative;
}

.roll-bg1 dl dt img {
	margin: 0 12px;
}

.roll-bg1 dl {
	position: absolute;
	top: 30%;
	left: 50%;
	margin-left: -375px;
}

.roll-bg2 {
	background: url(/resources/public/images/dada/roll/roll-bg_02.jpg) top center no-repeat;
	height: 515px;
	position: relative;
}

.roll-bg2 .content {
	position: absolute;
	top: 15%;
	left: 50%;
	margin-left: -444px;
}

.roll-bg3 {
	background: url(/resources/public/images/dada/roll/roll-bg_03.jpg) top center no-repeat;
	height: 855px;
	position: relative;
}

.roll-bg3 .content {
	position: absolute;
	top: 10%;
	left: 50%;
	margin-left: -473px;
}

.roll-bg4 {
	background: url(/resources/public/images/dada/roll/roll-bg_04.jpg) top center no-repeat;
	height: 558px;
	position: relative;
}

.roll-bg4 .content {
	position: absolute;
	top: 0%;
	left: 50%;
	margin-left: -472px;
}

.title {
	color: #fff58e;
	font-size: 24px;
	background-color: #342e54;
	padding: 5px 20px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-ms-border-radius: 5px;
	-moz-border-radius: 5px;
	-o-border-radius: 5px;
	display: inline-block;
}

#main {
	vertical-align: auto;
}

.dada-qrcode{
	position:absolute;
	right:25%;
	top:10%;
}
.dada-qrcode img{
	border-radius:5px;
	-webkit-border-radius:5px;
	-ms-border-radius:5px;
	-moz-border-radius:5px;
	-o-border-radius:5px;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<!-- head -->
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		<!-- end head -->

		<!--Main begin-->

		<main id="main">
		<div class="roll-bg1 roll-bg">
			<dl class="txt-c">
				<%-- <dt class="px16">
					<font color="#342e54">“免费回家计划”由靠谱的互联网理财平台<img
						src="${oss}/resources/public/images/dada/roll/hc9-logo.png" />和送你上下班的<img
						src="${oss}/resources/public/images/dada/roll/dada-logo.png" />联合打造
					</font>
				</dt> --%>
				<!-- <dd class="px14">
					<font color="#342e54">活动时间：2015年12月29日-2016年2月29日</font>
				</dd> -->
			</dl>
		</div>

		<div class="roll-bg2 roll-bg">
			<div class="content">
				<img src="${oss}/resources/public/images/dada/roll/ticket-ico.png" /><img
					src="${oss}/resources/public/images/dada/roll/redpacket-ico.png" />
			</div>
		</div>

		<div class="roll-bg3 roll-bg">
			<div class="content">
				<div class="mb50">
					<span class="title">参与方式</span>
					<p class="px18 pt20">
						<font color="#342e54">投资标的优先、夹层均可参与，劣后除外；</font>
					</p>
				</div>
				<div>
					<span class="title">嗒嗒巴士代金券获取方式</span>
					<p class="px18 pt20 pb20">
						<font color="#342e54">活动期间完成首投后，新老用户即可获赠嗒嗒巴士代金券，具体如下：</font>
					</p>
					<table width="946" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#d6cbab" class="txt-c mt20 px18"
						style="color: #342e54;">
						<tr>
							<td bgcolor="#fff2c1">首投金额</td>
							<td bgcolor="#fff2c1">1个月标</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">1000≤首投<5000</td>
							<td bgcolor="#fff2c1">10元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">5000≤首投<10000</td>
							<td bgcolor="#fff2c1">55元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">10000≤首投<30000</td>
							<td bgcolor="#fff2c1">115元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">首投≥30000</td>
							<td bgcolor="#fff2c1">400元嗒嗒巴士代金券</td>
						</tr>
					</table>
					<table width="946" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#d6cbab" class="txt-c mt20 px18"
						style="color: #342e54;">
						<tr>
							<td bgcolor="#fff2c1">首投金额</td>
							<td bgcolor="#fff2c1">3个月标</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">1000≤首投<5000</td>
							<td bgcolor="#fff2c1">20元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">5000≤首投<10000</td>
							<td bgcolor="#fff2c1">110元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">10000≤首投<30000</td>
							<td bgcolor="#fff2c1">230元嗒嗒巴士代金券</td>
						</tr>
						<tr>
							<td bgcolor="#fff2c1">首投≥30000</td>
							<td bgcolor="#fff2c1">700元嗒嗒巴士代金券</td>
						</tr>
					</table>
					<p class="px14 mt20">
						<font color="#342e54">*
							每个用户仅限领一次，无使用门槛限制，嗒嗒巴士任何乘车项目均可抵扣，有效期为领取后的365天</font>
					</p>
				</div>
			</div>
		</div>

		<div class="roll-bg4 roll-bg">
			<div class="content">
				<div class="mb50">
					<span class="title">嗒嗒巴士代金券发放安排</span>
					<p class="px18 pt20">
						<font color="#342e54">用户在活动期间内完成首投后，代金券即时发送，用户开通嗒嗒巴士账号即可使用；<br>此外，用户在前海红筹注册手机号需与嗒嗒巴士注册手机号相一致，否则奖品不予<br>发放；</font>
					</p>
				</div>
				<div class="mb50">
					<span class="title">嗒嗒巴士代金券查看方式</span>
					<p class="px18 pt20">
						<font color="#342e54">A、用户可在“我的账户”——“会员中心” ——“我的嗒嗒车票”进行查看；<br>B、开通嗒嗒巴士账号后，在其APP上查看；
						</font>
					</p>
				</div>
				<p class="px14 mt20">
					<font color="#342e54">*
						用户在参与本活动的同时，不影响该用户参与平台其他活动；如有其他问题请联系前海红筹客服部，客服QQ：4008223499，
						客服热线：400-822-3499；<br>* 本活动由前海红筹与嗒嗒巴士联合举办。
					</font>
				</p>
			</div>
			<div class="dada-qrcode"><img src="${oss}/resources/public/images/dada/roll/dada-qrcode.jpg" /><br><font color="#342e54" class="px18 txt-c">扫描下载嗒嗒巴士APP</font></div>
		</div>
		</main>
		<!--Main end-->

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
		<!-- end footer -->
	</div>
	<!--Container end-->
</body>
</html>