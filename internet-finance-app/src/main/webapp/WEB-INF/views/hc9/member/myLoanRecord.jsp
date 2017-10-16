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
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<div class="table-responsive text-para micmedium-font">
								<table class="table table-bordered div-center">
									<thead>
										<tr class="bg-danger text-snow">
											<th class="text-center">待收本金</th>
											<th class="text-center">历史总收益</th>
											<th class="text-center">待收收益</th>
										</tr>
									</thead>
									<tbody>
										<tr class="bg-snow">
											<td><fmt:formatNumber type="number"
													value="${comData.expectMoney }" pattern="0.00" /></td>
											<td><fmt:formatNumber type="number"
													value="${comData.hostIncome}" pattern="0.00" /></td>
											<td><fmt:formatNumber type="number"
													value="${comData.expectIncome }" pattern="0.00" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="panel-body bg-panel">
							<div class="account-view w100-view bg-snow" role="tabpanel">
								<ul class="nav nav-tabs nav-justified" role="tablist">
									<li role="presentation" class="active" style="width: 200px;"><a href="#project"
										aria-controls="project" role="tab" data-toggle="tab">投资项目</a></li>
									<li style="width: 1px;">&nbsp;</li>
									<li style="width: 750px; background-color: #eeeeee;">&nbsp;</li>
									<!-- 
									<li role="presentation"><a href="#details"
										aria-controls="details" role="tab" data-toggle="tab">收益明细</a></li>
									 -->
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active"
										id="project">
										<div class="form-inline text-label text-center margin40">
											<div class="form-group has-feedback overtime">

												<label>起止时间: </label> <input type="text" id="in11"
													class="form-control input-sm form_datetime"
													onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
													placeholder="开始时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label left-calendar"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input
													type="text" class="form-control input-sm form_datetime"
													onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
													id="in12" placeholder="结束时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label right-calendar"></span>

											</div>
											<a class="btn btn-danger btn-sm col-xs-1 nofloat"
												data-query="queryTime" role="button">查询</a>

											<button type="button"
												class="btn btn-warning btn-sm col-xs-1 nofloat" data-id="">全部</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat"
												data-id="1">最近1个月</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat"
												data-id="3">最近3个月</button>
										</div>
										<div class="form-inline text-label bg-snow invest">
											<div class="form-group" data-type="tab_loan">
												<input type="hidden" id="state" /> <input type="hidden"
													id="timeno" /><input type="hidden" id="query" value="0" />
												<label>投资类型: </label>
												<ul class="list-unstyled list-inline">
													<li class="active"><a href="#">全部</a></li>
													<li><a href="#1">投资中</a></li>
													<li><a href="#2">还款中</a></li>
													<li><a href="#3">完成</a></li>
												</ul>
											</div>
										</div>
										<div class="table-responsive text-label" id="loanrecord">

										</div>
									</div>
									<div role="tabpanel" class="tab-pane fade" id="details">
										<div class="form-inline text-label text-center margin40">
											<div class="form-group has-feedback overtime">
												<label>起止时间: </label> <input type="text" id="in1"
													class="form-control input-sm form_datetime"
													onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in2\')}'})"
													placeholder="开始时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label left-calendar"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input
													type="text" class="form-control input-sm form_datetime"
													onclick="WdatePicker({minDate:'#F{$dp.$D(\'in1\')}'})"
													id="in2" placeholder="结束时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label right-calendar"></span>
											</div>
											<a class="btn btn-danger btn-sm col-xs-1 nofloat"
												data-query="queryTime" role="button">查询</a>
											<button type="button"
												class="btn btn-warning btn-sm col-xs-1 nofloat" data-id="">全部</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat"
												data-id="1">最近1个月</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat"
												data-id="3">最近3个月</button>
										</div>
										<!-- <div class="form-inline text-label bg-snow invest">
											<div class="form-group" data-type="tab_loan">
												<label>投资类型: </label>
												<ul class="list-unstyled list-inline">
													<li class="active"><a href="#">全部</a></li>
													<li><a href="#-1">待收益</a></li>
													<li><a href="#1">已收益</a></li>
												</ul>
											</div>
										</div> -->
										<div class="table-responsive text-label" id="income"></div>
									</div>
								</div>
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
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/script/loancenter.js"></script>
	<script src="/resources/My97DatePicker/WdatePicker.js?v=1.0.1"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>