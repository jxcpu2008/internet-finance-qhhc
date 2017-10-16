<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
	.hine-ico {
		position: relative;
		width:16px;
		height: 16px;
	}
	.hine-ico:hover i{
		display: block;
	}
	.hine-ico img{
		position: absolute;
		top:0;
		left: 0;
	}
	.hine-ico i{
		background : url("${oss}/resources/assets/images/tips/hint-box.png") 0 0 no-repeat;
		width:204px;
		height:70px;
		position: absolute;
		top:-75px;
		left: 50%;
		margin-left: -51px;
		padding:8px 20px;
		font-style: normal;
		display: none;
	}
	.tab-controls {
    overflow:hidden;
    *zoom:1;
}
.tab-controls a {
    background: #ffffff;
    display: inline;
    float: left;
	font-size:16px;
	color:#666666;
	width:50%;
	height:35px;
	padding-top:10px;
	position:relative;
}
.tab-controls a .clearfix{
	position:absolute;
	left:50%;
	margin-left:-50px;
}
.tab-controls a i{
	background-image:url(${oss}/resources/assets/images/tips/tabbtn-icon.png);
	background-repeat:no-repeat;
	margin-right:10px;
}
.tab-controls a.btn_1 i{
	background-position:0 0;
	width:30px;
	height:24px;
}
.tab-controls a.btn_2 i{
	background-position:-30px 0;
	width:26px;
	height:21px;
}
.tab-controls a.btn_1 span{
	line-height:24px;
}
.tab-controls a.btn_2 span{
	line-height:21px;
}
.tab-controls a.active,
.tab-controls a:hover{
    border-bottom: 2px solid red;
    background: #fdf5f5;
	color:#d9534f;
}
.tab-controls a.btn_1.active i,
.tab-controls a.btn_1:hover i{
	background-position:0 -24px;
}
.tab-controls a.btn_2.active i,
.tab-controls a.btn_2:hover i{
	background-position:-30px -21px;
}
.tab-content .tab-item {
    display:none;
}
</style>
<table class="table text-center">
	<thead>
		<tr class="bg-panel">
			<th class="text-center">产品名称</th>
			<th class="text-center">期数</th>
			<th class="text-center">预计还款日期</th>
			<th class="text-center">应还金额</th>
			<th class="text-center">还款日期</th>
			<th class="text-center">&nbsp;操&nbsp;作&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<input type="hidden" name="balance" id="balance" value="${balance}" />
		<c:forEach var="record" items="${page.list}">
<%-- 			<input id="repayRecordId" type="text" value="${record.repayRecordId}"/> --%>
			<input id="loanName_${record.repayRecordId}" type="hidden" value="${record.loanName}"/>
			<input id="loanAmount_${record.repayRecordId}" type="hidden" value="${record.loanAmount}"/>
			<input id="loanType_${record.repayRecordId}" type="hidden" value="${record.loanType}"/>
			<input id="loanDays_${record.repayRecordId}" type="hidden" value="${record.loanPeriods}"/>
			<input id="overdueDays_${record.repayRecordId}" type="hidden" value="${record.overdueDays}"/>
			<input id="loanId_${record.repayRecordId}" type="hidden" value="${record.loanId}"/>
			<input id="loanName_${record.repayRecordId}" type="hidden" value="${record.loanName}"/>
			<input id="feeState_${record.repayRecordId}" type="hidden" value="${record.feeState}"/>
			<input id="repayPeriod_${record.repayRecordId}" type="hidden" value="${record.repayPeriod}"/>
			<input id="loanPeriods_${record.repayRecordId}" type="hidden" value="${record.loanPeriods}"/>
			<input id="refundWay_${record.repayRecordId}" type="hidden" value="${record.refundWay}"/>
			<input id="expectRepayDate_${record.repayRecordId}" type="hidden" value="${record.preRepayDate}"/>
			<tr>
				<c:if test="${fn:length(record.loanName) ge 15}">
					<td title="${record.loanName}">${record.loanName.substring(0,15)}..</td>
				</c:if>
				<c:if test="${fn:length(record.loanName) lt 15}">
					<td title="${record.loanName}">${record.loanName}</td>
				</c:if> 
				<td>第${record.repayPeriod}期</td>
				<td>${record.preRepayDate}</td>
				<td><fmt:formatNumber type="currency" value="${record.repayAmount}" currencySymbol="" /></td>
				<td>
					<c:if test="${!empty record.repayTime}">${record.repayTime.substring(0, 10)}</c:if>
					<c:if test="${empty record.repayTime}">--</c:if>
				</td>
				<td>
					<c:choose>
						<%-- 允许提前还款 --%>
						<c:when test="${record.inadvanceRepayPermit}">
							<%-- 未还款，包括正常未还款和逾期未还款 --%>
							<c:if test="${record.repayState eq 1 || record.repayState eq 3}">
								<%-- 天标 --%>
								<c:if test="${record.loanType eq 3}">
									<%-- 正常还款，即未逾期 --%>
									<c:if test="${record.overdue eq 2}">
										<c:choose>
											<%-- 借款期限超过允许提前还款的阀值 --%>
											<c:when test="${record.enableInstantRepay}">
												<%-- 提前还款 --%>
												<c:if test="${record.overdueDays < 0}">
													<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#inadvanceRepayModule" onclick="inadvanceRepay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount}, ${record.realDays});">立即还款</button>	
												</c:if>
												<%-- 正常还款 --%>
												<c:if test="${record.overdueDays == 0}">
													<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#repayModule" onclick="repay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount});">立即还款</button>
												</c:if>
											</c:when>
											<c:otherwise>
												未还款
											</c:otherwise>
										</c:choose>
									</c:if>
									<%-- 逾期还款 --%>
									<c:if test="${record.overdue eq 1}">
										<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#overdueRepayModule" onclick="overdueRepay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount}, ${feeParams.overdueRepayment});">逾期还款</button>
									</c:if>
								</c:if>
								<%-- 月标 --%>
								<c:if test="${record.loanType eq 2}">
									<%-- 正常还款，即未逾期 --%>
									<c:if test="${record.overdue eq 2}">
										<c:choose>
											<%-- 一个月的标 --%>
											<c:when test="${record.loanPeriods == 1}">
												<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#repayModule" onclick="repay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount});">立即还款</button>
											</c:when>
											<%-- 超过一个月的标 --%>
											<c:otherwise>
												<c:choose>
													<%-- 当前的还款期数 --%>
													<c:when test="${record.currentRepayRecordId eq record.repayRecordId}">
														<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#monthsRepayModule" onclick="monthsRepay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount});">立即还款</button>
													</c:when>
													<c:otherwise>
														未还款
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:if>
									<%-- 逾期还款 --%>
									<c:if test="${record.overdue eq 1}">
										<c:choose>
											<%-- 一个月的标 --%>
											<c:when test="${record.loanPeriods == 1}">
												<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#overdueRepayModule" onclick="overdueRepay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount}, ${feeParams.overdueRepayment});">逾期还款</button>
											</c:when>
											<%-- 超过一个月的标 --%>
											<c:otherwise>
												<c:choose>
													<%-- 当前的还款期数 --%>
													<c:when test="${record.currentRepayRecordId eq record.repayRecordId}">
														<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#overdueRepayModule" onclick="overdueRepay(${record.loanId}, ${record.repayRecordId}, ${record.repayAmount}, ${feeParams.overdueRepayment});">逾期还款</button>
													</c:when>
													<c:otherwise>
														逾期未还款
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:if>
							</c:if>
							<c:if test="${record.repayState eq 2 || record.repayState eq 4}">
								已还款
							</c:if>
							<c:if test="${record.repayState eq 5}">
								已提前还款
							</c:if>
							<c:if test="${record.repayState eq 6}">
								提前还款中
							</c:if>
							<c:if test="${record.repayState eq -1}">
								已清盘
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${record.repayState eq 1 || record.repayState eq 3}">
								<c:if test="${record.overdue eq 2 && record.currentRepayRecordId eq record.repayRecordId}">
									<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#normalRepayModule" onclick="repaymentInfo(${record.loanId}, ${record.repayRecordId});">按时还款</button>
								</c:if>
								<c:if test="${record.overdue eq 1 && record.currentRepayRecordId eq record.repayRecordId}">
									<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#normalRepayModule" onclick="repaymentInfo(${record.loanId}, ${record.repayRecordId});">逾期还款</button>
								</c:if>
								<c:if test="${record.overdue eq 2 && record.currentRepayRecordId ne record.repayRecordId}">
									未还款
								</c:if>
								<c:if test="${record.overdue eq 1 && record.currentRepayRecordId ne record.repayRecordId}">
									逾期未还款
								</c:if>
							</c:if>
							<c:if test="${record.repayState eq 2 || record.repayState eq 4 || record.repayState eq 5}">
								已还款
							</c:if>
							<c:if test="${record.repayState eq -1 }">
								已清盘
							</c:if>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<div class="modal fade" id="normalRepayModule" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">项目还款</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="post" action="/loanManage/shareLoanRepayMent.htm" id="normalRepayForm">
					<input type="hidden" name="repayId" id="repayId" />
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">当前还款的项目
							:</label>
						<div class="col-sm-9">
							<span data-title="title" id="loan_name"></span> <span
								class="text-danger" data-total="total" id="issueLoan">(&yen; 0.00
								元)</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">还款总额 :</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" id="repaySum" name="repayMoney"
								placeholder="" readonly="readonly">
						</div>
						<div class="input-group-addon">元</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">还款类型 :</label>
						<div class="col-sm-9">
							<span id="repayType">按月付息，到期还本</span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="normalRepayConfirmBtn">确认还款</button>
				<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- 正常还款 -->
<div class="modal fade" id="repayModule" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="loanName"></h4>
			</div>
			<form class="form-horizontal" method="post" action="/loanManage/repay.htm" id="repayForm">
				<input type="hidden" name="repayRecordId" id="repayRecordIdHidden2" />
				<input type="hidden" name="repayAmount" id="repayAmountHidden2" />
				<input type="hidden" name="balance" id="balanceHidden2" />
				<input type="hidden" name="overdueDays" id="overdueDaysHidden2" />
				<input type="hidden" name="loanId" id="loanIdHidden2" />
				<input type="hidden" name="loanName" id="loanNameHidden2" />
				<input type="hidden" name="feeState" id="feeStateHidden2" />
				<input type="hidden" name="repayPeriod" id="repayPeriodHidden2" />
				<input type="hidden" name="loanPeriods" id="loanPeriodsHidden2" />
				<input type="hidden" name="refundWay" id="refundWayHidden2" />
				<input type="hidden" name="loanType" id="loanTypeHidden2" />
				<div>
					<div>
						<div style="padding:15px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">还款总额</em>
								<em style="font-style:normal;" id="repayAmount" name="repayAmount"></em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">借款期限</em>
								<em style="font-style:normal;" id="loanPeriods" name="loanPeriods"></em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">还款类型</em>
								<em style="font-style:normal;" id="refundWay" name="refundWay"></em>
							</span>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: right;">
					<button type="button" class="btn btn-danger" id="confirmRepayBtn">确认还款</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 提前还款-->
<div class="modal fade" id="inadvanceRepayModule" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="inadvanceLoanName"></h4>
			</div>
			<form class="form-horizontal" method="post" action="/loanManage/repay.htm" id="inadvanceRepayForm">
				<input type="hidden" name="repayRecordId" id="repayRecordIdHidden" />
				<input type="hidden" name="repayAmount" id="repayAmountHidden" />
				<input type="hidden" name="balance" id="balanceHidden" />
				<input type="hidden" name="overdueDays" id="overdueDaysHidden" />
				<input type="hidden" name="loanId" id="loanIdHidden" />
				<input type="hidden" name="loanName" id="loanNameHidden" />
				<input type="hidden" name="feeState" id="feeStateHidden" />
				<input type="hidden" name="repayPeriod" id="repayPeriodHidden" />
				<input type="hidden" name="loanPeriods" id="loanPeriodsHidden" />
				<input type="hidden" name="refundWay" id="refundWayHidden" />
				<input type="hidden" name="expectInterest" id="expectInterestHidden" />
				<input type="hidden" name="realInterest" id="realInterestHidden" />
				<input type="hidden" name="loanType" id="loanTypeHidden" />
				<div>
					<div>
						<div style="padding:15px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">还款总额</em>
								<em style="font-style:normal;" id="inadvanceRepayAmount" name="repayAmount"></em>
							</span>
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">您比正常还款少付<font style="color:red;" id="savedInterest" name="savedInterest"></font>元的利息</em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">预期期限</em>
								<em style="font-style:normal;" id="expectDays" name="expectDays"></em>
							</span>
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">实际期限</em>
								<em style="font-style:normal;" id="realDays" name="realDays"></em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">应付利息</em>
								<em style="font-style:normal;" id="expectInterest" name="expectInterest"></em>
							</span>
							<span  style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">实付利息</em>
								<em style="font-style:normal;" id="realInterest" name="realInterest"></em>
							</span>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: right;">
					<button type="button" class="btn btn-danger" name="applyInAdvanceRepayBtn" id="applyInAdvanceRepayBtn">申请还款</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 逾期还款 -->
<div class="modal fade" id="overdueRepayModule" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="overdueLoanName"></h4>
			</div>
			<form class="form-horizontal" method="post" action="/loanManage/repay.htm" id="overdueRepayForm">
				<input type="hidden" name="repayRecordId" id="repayRecordIdHidden1" />
				<input type="hidden" name="repayAmount" id="repayAmountHidden1" />
				<input type="hidden" name="balance" id="balanceHidden1" />
				<input type="hidden" name="overdueDays" id="overdueDaysHidden1" />
				<input type="hidden" name="loanId" id="loanIdHidden1" />
				<input type="hidden" name="loanName" id="loanNameHidden1" />
				<input type="hidden" name="feeState" id="feeStateHidden1" />
				<input type="hidden" name="repayPeriod" id="repayPeriodHidden1" />
				<input type="hidden" name="loanPeriods" id="loanPeriodsHidden1" />
				<input type="hidden" name="refundWay" id="refundWayHidden1" />
				<input type="hidden" name="loanType" id="loanTypeHidden1" />
<!-- 				<input type="hidden" name="expectInterest" id="expectInterestHidden1" /> -->
<!-- 				<input type="hidden" name="realInterest" id="realInterestHidden1" /> -->
				<div>
					<div>
						<div style="padding:15px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">还款总额</em>
								<em style="font-style:normal;" id="overdueRepayAmount" name="repayAmount"></em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">应还时间</em>
								<em style="font-style:normal;" id="expectRepayDate" name="expectRepayDate"></em>
							</span>
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">逾期天数</em>
								<em style="font-style:normal;" id="overdueDays" name="overdueDays"></em>
							</span>
						</div>
						<div style="padding:10px 20px;border-bottom:1px solid #eee;" class="clearfix">
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">应付本息</em>
								<em style="font-style:normal;" id="expectRepayAmount" name="expectRepayAmount"></em>
							</span>
							<span style="width:48%; float: left;">
								<em style="margin-right:10px;font-style:normal;">罚付利息</em>
								<em style="font-style:normal;" id="penaltyAmount" name="penaltyAmount"></em>
								<em class="hine-ico" style="margin-left:10px;">
									<img src="${oss}/resources/assets/images/tips/hint-ico.png"/><i>应还金额*罚息利率*天数<br>罚息利率：千分之一</i>
								</em>
							</span>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: right;">
					<button type="button" class="btn btn-danger" id="confirmOverdueRepayBtn">确认还款</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 多月标还款 -->
<div class="modal fade" id="monthsRepayModule" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="monthsLoanName"></h4>
				<form class="form-horizontal" method="post" action="/loanManage/repay.htm" id="monthsRepayForm">
					<input type="hidden" name="repayFlag" id="flagHidden" />
					<input type="hidden" name="repayRecordId" id="repayRecordIdHidden3" />
					<input type="hidden" name="repayAmount" id="repayAmountHidden3" />
					<input type="hidden" name="balance" id="balanceHidden3" />
					<input type="hidden" name="overdueDays" id="overdueDaysHidden3" />
					<input type="hidden" name="loanId" id="loanIdHidden3" />
					<input type="hidden" name="loanName" id="loanNameHidden3" />
					<input type="hidden" name="feeState" id="feeStateHidden3" />
					<input type="hidden" name="repayPeriod" id="repayPeriodHidden3" />
					<input type="hidden" name="loanPeriods" id="loanPeriodsHidden3" />
					<input type="hidden" name="refundWay" id="refundWayHidden3" />
<!-- 					<input type="hidden" name="expectInterest" id="expectInterestHidden3" /> -->
					<input type="hidden" name="realInterest" id="realInterestHidden3" />
					<input type="hidden" name="loanType" id="loanTypeHidden3" />
					<div class="tab-controls">
		                <a href="javascript:;" class="btn_1" id="currentRepayTabPage">
		                	<div class="clearfix">
		                		<i style="display:inline; float: left;"></i>
		                		<span  style="display:inline; float: left;">当期还款</span>
		                	</div>
		                </a>
		                <a href="javascript:;" class="btn_2" id="inadvanceMonthsRepayTabPage">
		                	<div class="clearfix" style="margin-left:-80px;">
		                		<i  style="display:inline; float: left;"></i>
		                		<span  style="display:inline; float: left;">提前还款（全部还款）</span>
		                	</div>
		                </a>
		            </div>
		            <div class="tab-content">
		                <div class="tab-item">
		                	<p style="border-bottom:1px dashed #e4e4e4; padding:25px 0 10px 30px;">还款金额：&nbsp;&nbsp;
		                		<em style="font-style:normal;" id="monthsRepayAmount" name="repayAmount"></em>
		                	</p>
		                	<p style="border-bottom:1px dashed #e4e4e4; padding:10px 0 10px 30px;">还款期数：&nbsp;&nbsp;
		                		<em style="font-style:normal;" id="monthsRepayPeriod" name="repayPeriod"></em>
		                	</p>
		                	<p style="padding:10px 0 10px 30px;">还款类型：&nbsp;&nbsp;
		                		<em style="font-style:normal;" id="monthsRefundWay" name="refundWay"></em>
		                	</p>
		                </div>
		                <div class="tab-item">
							<div style="padding:50px 30px 0;">
		                    	<div class="clearfix">
		                        	<dl class="txt-c" style="float:left; display: inline;">
		                                <dt style="font-size:16px;">还款总额</dt>
		                                <dd style="font-size:22px;">
		                                	<em style="font-style:normal;" id="monthsInadvanceRepayAmount" name="repayAmount"></em>
		                                </dd>
		                            </dl>
		                            <img src="${oss}/resources/assets/images/tips/equal-ico.png" style="padding:30px 20px 0; float:left; display: inline;" />
		                            <dl class="txt-c" style="float:left; display: inline;">
		                                <dt style="font-size:16px;">实际本息</dt>
		                                <dd style="font-size:22px;">
		                                	<em style="font-style:normal;" id="monthsExpectRepayAmount" name="expectRepayAmount"></em>
		                                </dd>
		                            </dl>
		                            <img src="${oss}/resources/assets/images/tips/plus-ico.png" style="padding:30px 20px 0; float:left; display: inline;" />
		                            <dl class="txt-c" style="float:left; display: inline;">
		                                <dt style="font-size:16px;">额外利息</dt>
		                                <dd style="font-size:22px;">
		                                	<em style="font-style:normal;" id="monthsPenaltyAmount" name="penaltyAmount"></em>
		                                </dd>
		                            </dl>
		                        </div>
		                        <p style="margin-top:55px;">您比正常还款少付<font style="color:red;" id="monthsSavedInterest" name="savedInterest"></font>元的利息</p>
		                    </div>
		                </div>
	            	</div>
					<div class="modal-footer" style="text-align: right;">
						<button type="button" class="btn btn-danger" id="confirmMonthsRepayBtn">确认还款</button>
						<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${oss}/resources/assets/js/src/center/normal-repay-modules.js"></script>
<script src="${oss}/resources/assets/js/src/center/repay-modules.js"></script>
<script src="${oss}/resources/assets/js/src/center/inadvance-repay-modules.js"></script>
<script src="${oss}/resources/assets/js/src/center/overdue-repay-modules.js"></script>
<script src="${oss}/resources/assets/js/src/center/months-repay-modules.js"></script>
<script src="${oss}/resources/assets/js/myRepay.js"></script>