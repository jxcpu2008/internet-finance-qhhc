<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title text-dark">${lr.loansign.name }</h4>
	</div>
	<div class="modal-body">
		<div class="table-responsive text-para micmedium-font">
			<table class="table table-bordered div-center">
				<thead>
					<tr class="bg-panel">
						<th class="text-center">投资金额(元)</th>
						<th class="text-center">投资类型</th>
						<th class="text-center">年化率(奖励)</th>
						<th class="text-center">投资时间</th>
						<th class="text-center">剩余期数 / 总期数</th>
					</tr>
				</thead>
				<tbody>
					<tr class="bg-snow text-center">
						<td>${lr.tenderMoney }</td>
						<td>
						<c:if test="${lr.loansign.loansignType.id ne 5 }">
							<c:if test="${lr.subType eq 1 }">
								<span class="label label-clip label-priority">优</span>
							</c:if> <c:if test="${lr.subType eq 2 }">
								<span class="label label-clip label-sandwich">夹</span>
							</c:if> <c:if test="${lr.subType eq 3}">
								<span class="label label-clip label-inferior">劣</span>
							</c:if>
						</c:if>
						<c:if test="${lr.loansign.loansignType.id eq 5 }">--</c:if>
						</td>
						<!-- 
						<td><c:if test="${empty lr.pContractNo }">--</c:if> <c:if
								test="${!empty lr.pContractNo }">${lr.pContractNo }</c:if></td>
						 -->
						 <td>
						 	<c:if test="${lr.subType eq 1 }">
						 		<fmt:formatNumber type="number" value="${(loanrecords[0][9]*100) + (loanrecords[0][10]*100) }" pattern="#0.00" />%
						 		<c:if test="${!empty loanrecords[0][11] }">+<fmt:formatNumber type="number" value="${loanrecords[0][11] *100 }" />%(加息券)</c:if>
							</c:if>
							<c:if test="${lr.subType eq 2 }">0~14%</c:if>
							<c:if test="${lr.subType eq 3}">浮动收益</c:if>
						 </td>
						<td>${lr.tenderTime }</td>
						<td>${count }/${loanrecords.size() }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="table-responsive text-label margin40">
			<table class="table text-center">
				<thead>
					<tr class="bg-panel">
						<th class="text-center">还款期数(期)</th>
						<th class="text-center">应收本金(元)</th>
						<th class="text-center">应收利息(元)</th>
						<th class="text-center">预计还款日期</th>
						<th class="text-center">实收总额(元)</th>
						<th class="text-center">还款状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rp" items="${loanrecords }" varStatus="i">
						<tr>
							<td>${rp[1] }</td>
							<td><fmt:formatNumber type="number" value="${rp[2] }"
									pattern="#0.00#" /></td>
							<td><fmt:formatNumber type="number" value="${rp[3] }"
									pattern="#0.00#" />
								<c:if test="${i.first && !empty rp[7] }">+${rp[7] }(加息券收益)</c:if>		
							</td>
							<td>${rp[4] }</td>
							<td><c:if test="${empty rp[5] }">--</c:if> <c:if
									test="${!empty rp[5] }">
									<c:choose>
										<c:when test="${rp[6] eq 1 && i.first }"> <!-- 如果已还款且是最后一期就加上加息金额 -->
											<fmt:formatNumber type="number" value="${rp[5]+rp[8] }"
												pattern="#0.00#" />
										</c:when>
										<c:otherwise>
											<fmt:formatNumber type="number" value="${rp[5] }"
												pattern="#0.00#" />
										</c:otherwise>
									</c:choose>
								</c:if></td>
							<td class="text-danger"><c:if test="${rp[6] eq 1 }">
									已还款 
								</c:if> <c:if test="${rp[6] ne 1}">
									未还款
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty loanrecords }">
				<p class="text-center medium-font margin40">暂无</p>
			</c:if>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
	</div>
</div>