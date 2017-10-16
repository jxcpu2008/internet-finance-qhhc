<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="${oss}/resources/assets/css/helper.css" rel="stylesheet">
<link href="${oss}/resources/assets/css/news.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />

</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="container">
				<div class="bread">
					<span class="text-label">您当前的位置：</span>
					<ol class="list-unstyled list-inline">
						<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>
						<li class="active">帮助中心</li>
					</ol>
				</div>
				<div class="newslist">

					<div class="row">
						<div class="clearfix visible-xs-block"></div>
						<div class="col-xs-2 col-sm-2"
							style="background-color: #e4e4e4; padding: 0">

							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading collis">
										<h4
											class="panel-title <c:if test="${sign lt 5 }">activel</c:if>">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne"> 新手入门 </a>
										</h4>
									</div>
									<div id="collapseOne"
										class="panel-collapse collapse <c:if test="${sign lt 5 }">in</c:if>">
										<ul class="list-group">
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=1">注册</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=2">登录</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=3">实名认证</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=4">密码问题</a></li>
										</ul>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading collis">
										<h4
											class="panel-title <c:if test="${sign gt 4 && sign lt 8 }">activel</c:if>">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseTwo"> 资产管理 </a>
										</h4>
									</div>
									<div id="collapseTwo"
										class="panel-collapse collapse <c:if test="${sign gt 4 && sign lt 8 }">in</c:if>">
										<ul class="list-group">
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=5"> 充值</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=6"> 提现</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=7"> 投资</a></li>
										</ul>

									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading collis">
										<h4
											class="panel-title <c:if test="${sign gt 7 && sign lt 12 }">activel</c:if>">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseThree"> 常见问题 </a>
										</h4>
									</div>
									<div id="collapseThree"
										class="panel-collapse collapse <c:if test="${sign gt 7 && sign lt 12 }">in</c:if>">
										<ul class="list-group">
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=8"> 关于平台</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=9"> 产品相关</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=10"> 安全保障</a></li>
											<li class="list-group-item"><a
												href="/helper/toHelper.htm?sign=11"> 名称解释</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Add the extra clearfix for only the required viewport -->
						<div class="clearfix visible-sm-block"></div>

						<div class="col-xs-10 col-sm-10" style="background-color: #ffffff"
							id="helplist"></div>

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
		$(function() {
			if (!window.location.search) {
				var help_arr = 1;
			} else {
				var help_arr = window.location.search.split('?')[1].split('=')[1];
			}
			$.ajax({
				url : '/helper/queryHelp.htm?id=' + help_arr,
				type : 'post',
				success : function(msg) {
					$("#helplist").html(msg);
				}

			});

			$(".panel-heading").click(function() {
				$('#accordion h4').removeClass('activel');
				$(this).children('h4').addClass('activel');

			});

		});
	</script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>
