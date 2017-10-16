<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	var loanId = $("#loanId").val();
	$.ajax({
		type : 'post',
		url : '/loaninfo/loanrecordList.htm',
		data : {
			no : pageno,
			loanId : loanId
		},
		success : function(data) {
			$("#record").html(data);
		}
	});
}

</script>
<p class="smmedium-font">
	<span class="text-dark">目前投标总额：</span><span class="text-danger">&yen;
		<fmt:formatNumber type="number"
			value="${loan.issueLoan-loan.restMoney }" pattern="#0.00" />
	</span><span class="text-dark">&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;剩余投标金额：</span>&yen;
	<fmt:formatNumber type="number" value="${loan.restMoney }"
		pattern="#0.00" />
	<span class="text-dark"> 元</span>
</p>
<div class="table-responsive text-para micmedium-font">
	<table class="table table-bordered table-striped">
		<thead class="bg-danger text-snow">
			<th class="text-center">投资人</th>
			<c:if test="${loan.loansignType.id ne 5 }">
				<th class="text-center">投资类型</th>
			</c:if>
			<th class="text-center">投资金额</th>
			<th class="text-center">投资时间</th>
			<th class="text-center">投资方式</th>
		</thead>
		<tbody>
			<c:if test="${!empty page.list}">
				<c:forEach items="${page.list}" var="obj" varStatus="no">
					<tr>
						<td class="text-center">${fn:replace(obj[4], fn:substring(obj[4], 1, fn:length(obj[4])-1), "***")}</td>
						<c:if test="${loan.loansignType.id ne 5 }"><td class="text-center"><c:if test="${obj[2] eq 1 }">优先</c:if> <c:if
								test="${obj[2] eq 2 }">夹层</c:if> <c:if test="${obj[2] eq 3 }">劣后</c:if>
						</td></c:if>
						<td class="text-center"><fmt:formatNumber type="number" value="${obj[0]}"
								pattern="#0.00" /></td>
						<td class="text-center">${obj[1]}</td>
						<td class="text-center">
							<c:if test="${obj[3] eq 1 }">PC端</c:if>
							<c:if test="${obj[3] eq 2 }">移动端</c:if>
							<c:if test="${obj[3] eq 5 }">自动投标</c:if>
							<c:if test="${obj[3] eq 8 }">Android客户端</c:if>
							<c:if test="${obj[3] eq 9 }">IOS客户端</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>