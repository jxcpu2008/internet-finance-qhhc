<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table text-center" id="loanrecord">
	<thead>
		<tr class="bg-panel">
			<th class="text-center">产品名称</th>
			<th class="text-center">产品期限</th>
			<th class="text-center">认购类型</th>
			<th class="text-center">认购金额(元)</th>
			<th class="text-center">认购时间</th>
			<th class="text-center">还款日期</th>
			<th class="text-center">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty page.list}">
			<c:forEach var="loan" items="${page.list}">
				<tr>
					<c:if test="${fn:length(loan[0]) ge 12}">
						<td title="${loan[0] }"><a class="text-label"
							href="/loaninfo/loansignInfo.htm?loanId=${loan[6] }">${loan[0].substring(0,12)}..</a></td>
					</c:if>
					<c:if test="${fn:length(loan[0]) lt 12}">
						<td title="${loan[0] }"><a class="text-label"
							href="/loaninfo/loansignInfo.htm?loanId=${loan[6] }">${loan[0] }</a></td>
					</c:if>
					<td><c:if test="${loan[8] eq 2}">${loan[9]}个月</c:if> <c:if
						test="${loan[8] eq 3}">${loan[9]}天 </c:if></td>
					<td><c:if test="${loan[7] ne 5}"><c:if test="${loan[1] eq 1}">
							<span class="label label-clip label-priority">优</span>
						</c:if> <c:if test="${loan[1] eq 2}">
							<span class="label label-clip label-sandwich">夹</span>
						</c:if> <c:if test="${loan[1] eq 3}">
							<span class="label label-clip label-inferior">劣</span>
						</c:if>
						</c:if>
						<c:if test="${loan[7] eq 5}">--</c:if></td>
					<td><fmt:formatNumber type="number" value="${loan[2] }"
							pattern="#0.00" /></td>
					<td>${loan[3] }</td>
					<td>${loan[10] }</td>
					<td><a class="btn btn-danger btn-xs"
						role="button" data-toggle="modal"
						onclick="findDetail(${loan[5] })">查看详情</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<!-- 还款明细模态框 -->
<div class="modal fade" id="eachDetailsModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog"></div>
</div>
<script type="text/javascript">
//收益明细-查看详情
function findDetail(lrId) {
	$.ajax({
		url : '/loaninfo/repayInfo.htm',
		type : 'post',
		data : {
			lrId : lrId
		},
		success : function(data) {
			$(".modal-dialog").html(data);
			$('#eachDetailsModal').modal('show');
		}
	});
}
</script>