<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input id="type" type="hidden" value="${type }"/>
<table class="table text-center">
	<thead>
		<tr class="bg-panel">
			<th class="text-center"></th>
			<th class="text-center">金额</th>
			<th class="text-center">有效期</th>
			<th class="text-center">最低投资额(元)</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="redenv" items="${page.list }" varStatus="i">
			<tr>
				<c:if test="${i.index eq 0 }">
					<td><label style="padding: 0 10px;"><input type="radio"
							name="pick" checked="checked" value="${redenv[0] }"></label></td>
				</c:if>
				<c:if test="${i.index ne 0 }">
					<td><label style="padding: 0 10px;"><input type="radio"
							name="pick" value="${redenv[0] }"></label></td>
				</c:if>
				<td>
					<c:if test="${type eq 1 }">
						<fmt:formatNumber type="number" value="${redenv[1] }" pattern="#0.00#" />
					</c:if>
					<c:if test="${type eq 2 }">
						<fmt:formatNumber type="number" value="${redenv[1]*100 }" />%
					</c:if>
				</td>
				<td>${redenv[2].toString().substring(0,10) } - ${redenv[3].toString().substring(0,10) }</td>
				<td>¥<fmt:formatNumber type="number" value="${redenv[4] }"
						pattern="#0.00#" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${!empty page.list}">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<script type="text/javascript">
function select(no) {
	var type = $("#type").val();  // 1、红包 2、加息券
	$.ajax({
		url : '/loaninfo/changeCoupon.htm',
		type : 'post',
		data : {
			no : no,
			priority : $.trim($("#priority").val()),
			type : type,
			loanId : $("#loanId").val()
		},
		success : function(data) {
			if (type==1) {
				$("#redenve_list").html(data);  
			} else {
				$("#interest_list").html(data);
			}
		}
	});
}

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}
</script>