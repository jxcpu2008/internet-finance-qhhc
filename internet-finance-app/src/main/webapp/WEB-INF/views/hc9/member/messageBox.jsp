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
	<!-- <style type="text/css">
	.triangle-1{
		width: 0;
		height: 0;
		border-left: 5px solid transparent;
		border-right: 5px solid transparent;
		border-top: 5px solid #999999;
		margin-top: 8px;
	}
	.triangle-2{
		width: 0;
		height: 0;
		border-left: 5px solid transparent;
		border-right: 5px solid transparent;
		border-bottom: 5px solid #999999;
		margin-top: 8px;
	}
	</style> -->
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
				<div class="nav-right col-md-10 clearfix">
					<div style="width: 932px; height:760px;border:1px solid #dddddd;border-radius:3px;margin-bottom: 20px;">
						<div class="clearfix" style="padding:20px 22px 20px 22px;border-bottom:1px solid #dddddd;">
							<span class="pull-left" style="font-size:18px; color: #555555;">我的消息</span>
							<a class="pull-right btn btn-danger btn-sm normal-font" href="javascript:setupall();">全部设为已读</a>
						</div>
						<ul style="padding: 0;" id="msg-list" >
							<%-- <li class="clearfix" style="list-style: none; padding: 18px 35px; border-bottom:1px solid #dddddd;">
								<span class="pull-left" style="background: url(${oss}/resources/assets/images/center/news/red-dot.png) 0 0 no-repeat;width:8px;height:8px;margin:7px 10px 5px 0;"></span>
								<a href="javascript:;" class="pull-left clearfix newsBtn" style="color: #575757;"><span class=" pull-left">红包到期提醒！</span></a>
								<span class="pull-right" style="color: #969696;">2015.12.02   18:00:30</span>
								<div class="clear"></div>
								<p class="content" style="display:none; margin-top: 20px;color: #999999;font-size: 14px;">目前同一证件只能注册一个前海红筹账户。</p>
							</li>
							--%>
						</ul>
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
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>