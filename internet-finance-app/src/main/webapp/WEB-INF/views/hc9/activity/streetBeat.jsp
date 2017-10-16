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
.page{
	width:100%;
	height:900px;
}
.page1{
	background:url(/resources/public/images/activity/bg-img1.jpg) top center no-repeat;
}
.page2{
	background:url(/resources/public/images/activity/bg-img2.jpg) top center no-repeat;
}
.page3{
	background:url(/resources/public/images/activity/bg-img3.jpg) top center no-repeat;
}
.page4{
	background:url(/resources/public/images/activity/bg-img4.jpg) top center no-repeat;
}
.page5{
	background:url(/resources/public/images/activity/bottom-bg.jpg) top center no-repeat;
	width:100%;
	height:1338px;
	position:relative;
}
.page5 object{
	position:absolute;
	width:676px;
	height:410px;
	left:50%;
	margin-left:-338px;
	top:20%;
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
		<main id="newYear" role="main">
		<div>
			<div class="page1 page"></div>
			<div class="page2 page"></div>
			<div class="page3 page"></div>
			<div class="page4 page"></div>
			<div class="page5">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
					width="305" height="205">
					<param name="movie" value="${oss }/resources/public/images/activity/Flvplayer.swf" />
					<param name="quality" value="high" />
					<param name="allowFullScreen" value="true" />
					<param name="FlashVars"
						value="vcastr_file=http://hcfile.hc9.com/upload/video/bless.flv&LogoText=test&BufferTime=3" />
					<param name="PlayCount" value="10">
					<embed src="${oss }/resources/public/images/activity/Flvplayer.swf" allowfullscreen="true"
						flashvars="vcastr_file=http://hcfile.hc9.com/upload/video/bless.flv&LogoText=test"
						quality="high"
						pluginspage="http://www.macromedia.com/go/getflashplayer"
						type="application/x-shockwave-flash" width="676" height="410" autostart=true loop=false></embed>
				</object>
			</div>
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