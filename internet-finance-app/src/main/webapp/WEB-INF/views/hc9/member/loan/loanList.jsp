<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/assets/css/loanlist.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<ul class="list-unstyled list-inline cleargap clearfix margin40">
				<li class="theme" style="width:22%;"><span class="step text-center">1</span> <span
					class="glyphicon glyphicon-menu-right text-danger"
					aria-hidden="true"></span> <span class="smmedium-font text-label">投资优势结构化</span>
				</li>
				<li class="theme" style="width:25%;"><span class="step text-center">2</span> <span
					class="glyphicon glyphicon-menu-right text-danger"
					aria-hidden="true"></span> <span class="smmedium-font text-label">资金流转真诚透明</span>
				</li>
				<li class="theme" style="width:26%;"><span class="step text-center">3</span> <span
					class="glyphicon glyphicon-menu-right text-danger"
					aria-hidden="true"></span> <span class="smmedium-font text-label">多重保障投资人利益措施</span>
				</li>
				<li class="text-right theme" style="width:25%;"><span class="step text-center">4</span> <span
					class="glyphicon glyphicon-menu-right text-danger"
					aria-hidden="true"></span> <span class="smmedium-font text-label">平台所有操作合法有效</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="bg-container">
		<div class="container bg-snow loanlist">
			<div class="page-header">
				<h4 class="text-dark">我要众持</h4>
			</div>
			<div class="panel-list">
				<h5 class="text-label">产品类型：</h5>
				<ul class="list-unstyled list-inline" data-id="type">
					<li><a href="#" class="btn btn-danger" role="button">全部</a></li>
					<li><a href="#2" class="btn btn-link" role="button">车&nbsp;&bull;&nbsp;众盈</a></li>
					<li><a href="#1" class="btn btn-link" role="button">房&nbsp;&bull;&nbsp;众盈</a></li>
					<li><a href="#4" class="btn btn-link" role="button">信&nbsp;&bull;&nbsp;众盈</a></li>
					<li><a href="#3" class="btn btn-link" role="button">典&nbsp;&bull;&nbsp;众盈</a></li>
				</ul>
			</div>
			<div class="panel-list">
				<h5 class="text-label">期限：</h5>
				<ul class="list-unstyled list-inline" data-id="month">
					<li><a href="#" class="btn btn-danger" role="button">全部</a></li>
					<li><a href="#1" class="btn btn-link" role="button">1个月</a></li>
					<li><a href="#3" class="btn btn-link" role="button">3个月</a></li>
					<li><a href="#6" class="btn btn-link" role="button">6个月</a></li>
					<li><a href="#9" class="btn btn-link" role="button">9个月</a></li>
					<li><a href="#12" class="btn btn-link" role="button">12个月</a></li>
				</ul>
			</div>
			<div class="panel-list">
				<h5 class="text-label">优先年化收益：</h5>
				<ul class="list-unstyled list-inline" data-id="rate">
					<li><a href="#" class="btn btn-danger" role="button">全部</a></li>
					<li><a href="#8" class="btn btn-link" role="button">8~12%</a></li>
					<li><a href="#12" class="btn btn-link" role="button">12~15%</a></li>
				</ul>
			</div>
			<div class="panel-list">
				<h5 class="text-label">项目状态：</h5>
				<ul class="list-unstyled list-inline" data-id="state">
					<li><a href="#" class="btn btn-danger" role="button">全部</a></li>
					<li><a href="#1" class="btn btn-link" role="button">融资中</a></li>
					<li><a href="#2" class="btn btn-link" role="button">还款中</a></li>
					<li><a href="#3" class="btn btn-link" role="button">已完成</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body clearfix" id="loanlist"></div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/script/loanlist.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>