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
<link href="${oss}/resources/assets/css/news.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="newslist  clearfix">
				<div class="bread">
					<span class="text-label">您当前的位置：</span>
					<ol class="list-unstyled list-inline">
						<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>

						<li class="active">${deputy.name }</li>
					</ol>
				</div>
				<div class="row">
					<div class="col-xs-2 col-sm-2"
						style="background-color: #e4e4e4; padding: 0">
						<div class="newslt">
							<ul class="list-unstyled" style="display: block">
								<c:forEach items="${menu}" var="menu" varStatus="status">
									<c:if test="${menu.topic == topicId }">
										<c:if test="${topicId eq 6 }">
											<li><a href="${menu.url}?nav=6"
												<c:if test="${menu.id == deputyId }">class="newsactive" style="color:#fff;background-color:#d9534f;"</c:if>>${menu.name }</a></li>
										</c:if>
										<c:if test="${topicId ne 6 }">
											<li><a href="${menu.url}"
												<c:if test="${menu.id == deputyId }">class="newsactive" style="color:#fff;background-color:#d9534f;"</c:if>>${menu.name }</a></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- Add the extra clearfix for only the required viewport -->
					<div class="clearfix visible-xs-block"></div>

					<div class="col-xs-10 col-sm-10" style="background-color: #ffffff">
						<div class="newsrt">


							<div class="row text-center">
								<c:if test="${type eq 'single' }">
									<h2>${deputy.pageTitile }</h2>
								</c:if>
								<c:if test="${type eq 'article' }">
									<h2>${article.title }</h2>
								</c:if>
								<br>
								<h6 class="text-label">来源：前海红筹 &nbsp; 网址：http://www.hc9.com
									&nbsp;&nbsp;&nbsp;</h6>
							</div>
							<hr style="border-top: 1px dashed #eee;">
							<!--<div class="clearfix visible-xs-block"></div>-->
							<div class="text-label newsmain">
								<c:if test="${type eq 'single' }">
									<p>${deputy.pageHtml }</p>
								</c:if>
								<c:if test="${type eq 'article' }">
									<p>${article.context }</p>
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
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>