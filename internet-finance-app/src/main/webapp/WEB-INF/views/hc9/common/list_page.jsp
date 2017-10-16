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
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="/resources/assets/css/news.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="bread">
				<span class="text-label">您当前的位置：</span>
				<ol class="list-unstyled list-inline">
					<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>

					<li class="active">${deputy.name }</li>
				</ol>
			</div>
			<div class="newslist">
				<div class="row">
					<div class="clearfix visible-xs-block"></div>
					<div class="col-xs-2 col-sm-2"
						style="background-color: #e4e4e4; padding: 0">
						<div class="newslt">
							<ul class="list-unstyled" style="display: block">
								<c:forEach items="${menu }" var="menu" varStatus="status">
									<c:if test="${menu.id eq deputyId }">
										<input id="curUrl" type="hidden" value="${menu.url}" />
									</c:if>
									<li><a href="${menu.url}"
										<c:if test="${menu.id eq deputyId }">style="color:#fff;background-color:#d9534f;"</c:if>>${menu.name }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- Add the extra clearfix for only the required viewport -->
					<div class="clearfix visible-sm-block"></div>

					<div class="col-xs-10 col-sm-10" style="background-color: #ffffff">
						<div class="newsrt">


							<!--<div class="clearfix visible-xs-block"></div>-->
							<div id="nlist">
								<div class="text-label newsmain">
									<ul>
										<c:forEach items="${page.list }" var="article">
											<li><a href="/${article.url}"><h5>${article.title}</h5></a><span>${fn:substring(article.createTime,0,10)}</span></li>
										</c:forEach>

									</ul>
								</div>
								<c:if test="${!empty page.list}">
									<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
								</c:if>
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
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script type="text/javascript">

		function jumpPage(pageno, totalPage) {

			if (pageno <= 0 || pageno > totalPage) {
				return;
			}
			var curUrl = $("#curUrl").val();
			//select(pageno);
			window.location.href=curUrl+"?no="+pageno;
		}
		
	</script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>