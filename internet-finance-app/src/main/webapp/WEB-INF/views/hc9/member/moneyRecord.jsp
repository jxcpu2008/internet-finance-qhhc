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
					<div class="panel panel-default trade">
						<div class="panel-heading text-center">
							<div class="form-inline text-label">
								<div class="form-group has-feedback overtime">
									<label>起止时间: </label> <input type="text" name="beginTime"
										class="form-control input-sm form_datetime" id="in11"
										onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
										placeholder="开始时间" readonly="readonly"><span
										class="glyphicon glyphicon-calendar form-control-feedback left-calendar tleft-calendar text-label"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input
										type="text" class="form-control input-sm form_datetime"
										id="in12" name="endTime"
										onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
										placeholder="结束时间" readonly="readonly"><span
										class="glyphicon glyphicon-calendar form-control-feedback text-label tright-calendar"></span>
								</div>
								<button type="button"
									class="btn btn-danger btn-sm col-xs-1 nofloat" id="queryCom">查询</button>
								<button type="button"
									class="btn btn-warning btn-sm col-xs-1 nofloat" id="all">全部</button>
								<button type="button"
									class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" id="near_one">最近1个月</button>
								<button type="button"
									class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" id="near_three">最近3个月</button>
							</div>
						</div>
						<div class="panel-body">
							<div class="form-inline text-label bg-snow">
								<div class="form-group">
									<label>交易类型: </label>
									<ul class="list-unstyled list-inline" id="investType">
										<li class="active"><a href="#0">全部</a></li>
										<li><a href="#7" id="withdraw">提现</a></li>
										<li><a href="#6">充值</a></li>
										<li><a href="#5,15">认购</a></li>
										<li><a href="#20">回款</a></li>
										<li><a href="#4">还款</a></li>
										<li><a href="#12,22">融资</a></li>
										<li><a href="#18,21,24,25">奖励</a></li>
										<li><a href="#16">佣金</a></li>
									</ul>
								</div>
							</div>
							<div class="table-responsive text-label" id="trade_record">
								<!-- 交易记录 -->
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
	<script src="${oss}/resources/assets/script/tradeRecord.js"></script>
	<script src="${oss}/resources/My97DatePicker/WdatePicker.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>