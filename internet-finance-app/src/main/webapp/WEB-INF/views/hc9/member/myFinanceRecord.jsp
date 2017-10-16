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
						<div class="panel-heading panel-view">
							<div class="account-view w100-view bg-snow" role="tabpanel">
								<ul class="nav nav-tabs nav-justified" role="tablist"
									id="tabpanel">
									<li role="presentation" class="active"><a
										href="#applyment" aria-controls="applyment" role="tab"
										data-toggle="tab">融资申请记录</a></li>
									<li role="presentation"><a href="#finacing"
										aria-controls="finacing" role="tab" data-toggle="tab">融资管理</a></li>
									<li role="presentation"><a href="#repayment"
										aria-controls="repayment" role="tab" data-toggle="tab">还款清单</a></li>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active"
										id="applyment">
										<div
											class="table-responsive text-para micmedium-font padding20">
											<table class="table table-bordered text-center">
												<thead>
													<tr class="bg-danger text-snow">
														<th class="text-center">总融资额度</th>
														<th class="text-center">已用融资额度</th>
														<th class="text-center">剩余融资额度</th>
													</tr>
												</thead>
												<tbody>
													<tr class="bg-snow">
														<td><fmt:formatNumber pattern="0.00"
																value="${credit }" /></td>
														<td><fmt:formatNumber pattern="0.00"
																value="${invest_mon }" /></td>
														<td><fmt:formatNumber pattern="0.00"
																value="${surplus_mon }" /></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="table-responsive text-label">
											<table class="table text-center div-center">
												<thead>
													<tr class="bg-panel">
														<th class="text-center">申请人</th>
														<th class="text-center">融资类型</th>
														<th class="text-center">审核状态</th>
														<th class="text-center">提交时间</th>
													</tr>
												</thead>
												<tbody>
													<c:if
														test="${!empty borrow_base && borrow_base.auditStatus ne 1 }">
														<tr>
															<td>${session_user.name}</td>
															<td>项目众持</td>
															<td><c:if test="${borrow_base.auditStatus eq 2}">审核中</c:if>
																<c:if
																	test="${borrow_base.auditStatus eq 3 && borrow_base.auditResult eq 1}">已通过</c:if>
																<c:if
																	test="${borrow_base.auditStatus eq 3 && borrow_base.auditResult eq 0}">未通过</c:if></td>
															<td>${borrow_base.releaseTime}</td>
														</tr>
													</c:if>
												</tbody>
											</table>
											<c:if
												test="${empty borrow_base || borrow_base.auditStatus eq 1 }">
												<p class="text-center medium-font margin40">暂未申请</p>
											</c:if>
										</div>
										<div class="panel-body applyments">
											<h4 class="text-para padding20">申请流程</h4>
											<div class="time-hline"></div>
											<ul
												class="list-unstyled list-inline cleargap text-center clearfix">
												<li class="col-md-3">
													<div class="popover top" role="tooltip">
														<div class="arrow"></div>
														<div class="popover-content">平台注册</div>
													</div> <span class="step">1</span>
												</li>
												<li class="col-md-3">
													<div class="popover bottom" role="tooltip">
														<div class="arrow"></div>
														<div class="popover-content">开通宝付账户并授权</div>
													</div> <span class="step">2</span>
												</li>
												<li class="col-md-3">
													<div class="popover top" role="tooltip">
														<div class="arrow"></div>
														<div class="popover-content">提交借款申请</div>
													</div> <span class="step">3</span>
												</li>
												<li class="col-md-3">
													<div class="popover bottom" role="tooltip">
														<div class="arrow"></div>
														<div class="popover-content">风控审核</div>
													</div> <span class="step">4</span>
												</li>
											</ul>
											<h4 class="text-para padding20">申请条件</h4>
											<ol class="text-label hline">
												<li>借款人、保证人须符合中国法律法规中对借贷主体资格、担保主体资格的有关规定。</li>
												<li>借款人、保证人必须具有良好的信誉。</li>
												<li>有固定经营实体，且在本地持续经营时间超过半年的中小企业主。</li>
												<li>贷款用于正常的经营周转，固定资产投入等。</li>
											</ol>
											<!-- <a href="javascript:;" id="startApply"
												class="btn btn-danger col-xs-2 micmedium-font center-block nofloat"
												role="button">立即申请</a> -->
										</div>
									</div>
									<div role="tabpanel" class="tab-pane fade" id="finacing">
										<div class="form-inline text-label search-form">
											<div class="form-group">
												<label>项目名称: </label> <input type="text" name="loan_name"
													class="form-control input-sm">
											</div>
											<button type="button"
												class="btn btn-danger btn-sm col-xs-1 nofloat searchCom">搜索</button>
										</div>
										<div class="form-inline text-label search-time">
											<div class="form-group has-feedback overtime">
												<label>发布时间: </label> <input type="text" name="beginTime"
													class="form-control input-sm form_datetime" id="in11"
													onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
													placeholder="开始时间" readonly="readonly"> <span
													class="glyphicon glyphicon-calendar form-control-feedback text-label left-calendar"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input
													type="text" class="form-control input-sm form_datetime"
													id="in12" name="endTime"
													onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
													placeholder="结束时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label right-calendar"></span>
											</div>
											<button type="button"
												class="btn btn-danger btn-sm col-xs-1 nofloat queryCom">查询</button>
											<button type="button"
												class="btn btn-warning btn-sm col-xs-1 nofloat all">全部</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat near_one">最近1个月</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat near_three">最近3个月</button>
										</div>
										<div class="form-inline text-label bg-snow invest">
											<div class="form-group">
												<label>融资状态: </label>
												<ul class="list-unstyled list-inline" id="all_state">
													<li class="active"><a href="#0">全部</a></li>
													<li><a href="#1">融资中</a></li>
													<li><a href="#2">满标中</a></li>
													<li><a href="#3">还款中</a></li>
													<li><a href="#4">已完成</a></li>
												</ul>
											</div>
										</div>
										<div class="panel-body">
											<div class="table-responsive text-label" id="finance_record">
												<!-- 融资管理列表 -->
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane fade" id="repayment">
										<div class="form-inline text-label search-form">
											<div class="form-group">
												<label>项目名称: </label> <input type="text" name="loan_name"
													class="form-control input-sm">
											</div>
											<button type="button"
												class="btn btn-danger btn-sm col-xs-1 nofloat searchCom">搜索</button>
										</div>
										<div class="form-inline text-label search-time">
											<div class="form-group has-feedback overtime">
												<label>预计还款时间: </label> <input type="text" name="beginTime"
													class="form-control input-sm form_datetime repay" id="in11"
													onclick="WdatePicker({maxDate:'#F{$dp.$D(\'in12\')}'})"
													placeholder="开始时间" readonly="readonly"> <span
													class="glyphicon glyphicon-calendar form-control-feedback text-label left-calendar"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input
													type="text" class="form-control input-sm form_datetime repay"
													id="in12" data-id="in12" name="endTime"
													onclick="WdatePicker({minDate:'#F{$dp.$D(\'in11\')}'})"
													placeholder="结束时间" readonly="readonly"><span
													class="glyphicon glyphicon-calendar form-control-feedback text-label right-calendar"></span>
											</div>
											<button type="button"
												class="btn btn-danger btn-sm col-xs-1 nofloat queryCom">查询</button>
											<button type="button"
												class="btn btn-warning btn-sm col-xs-1 nofloat all">全部</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat near_one">最近1个月</button>
											<button type="button"
												class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat near_three">最近3个月</button>
										</div>
										<div class="panel-body">
											<div class="table-responsive text-label"
												id="repayment_record">
												<!-- 还款清单 -->

											</div>
										</div>
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
	<script src="/resources/My97DatePicker/WdatePicker.js?v=1.0"></script>
	<script src="${oss}/resources/assets/script/loanManage.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#startApply").click(
					function() {
						$.ajax({
							url : '/borrow/startApply.htm',
							type : 'post',
							success : function(data) {
								if (data == "1") {
									ymPrompt.errorInfo('抱歉，您还未开通宝付会员！', 400,
											200, '提醒', null);
								} else if(data == "2"){
									ymPrompt.errorInfo('抱歉，您还未完成宝付授权！', 400,
											200, '提醒', null);
								}else {
									location.href = "/borrow/forwardPersoninfo.htm";
								}
							}
						});
					});

		});
	</script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>