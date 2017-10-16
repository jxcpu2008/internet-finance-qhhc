<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	$.ajax({
		url : '/member_index/packet_list',
		type : 'post',
		data : {
			no : pageno
		},
		success : function(data) {
			$("#packet").html(data);
		}
	});
}
</script>
<div class="table-responsive text-label">
	<table class="table text-center">
		<thead>
			<tr class="bg-panel">
				<th class="text-center">红包金额</th>
				<th class="text-center">有效期</th>
				<th class="text-center">最低投资额(元)</th>
				<th class="text-center">状态</th>
				<th class="text-center">来源</th>
				<th class="text-center">使用时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="redenv" items="${page.list }">
				<tr>
					<td><fmt:formatNumber type="number" value="${redenv[1] }"
							pattern="#0.00#" /></td>
					<td>
						<c:set var="beginTime" value="${redenv[2].toString() }"/>
						<c:set var="endTime" value="${redenv[3].toString() }"/>
						<c:if test="${beginTime.length() gt 16 }">
							${beginTime.substring(0,16) }
						</c:if>
						<c:if test="${beginTime.length() le 16 }">
							${beginTime }
						</c:if>
						-
						<c:if test="${endTime.length() gt 16 }">
							${endTime.substring(0,16) }
						</c:if>
						<c:if test="${endTime.length() le 16 }">
							${endTime }
						</c:if>
					</td>
					<td>¥ <fmt:formatNumber type="number" value="${redenv[4] }"
							pattern="#0.00#" /></td>
					<c:if test="${redenv[5] eq 0 }">
						<td class="text-success">可使用</td>
					</c:if>
					<!-- 2表示待确认 -->
					<c:if test="${redenv[5] eq 1 || redenv[5] eq 2 }">
						<td class="text-muted">已使用</td>
					</c:if>
					<c:if test="${redenv[5] eq 3 }">
						<td class="text-warning">已过期</td>
					</c:if>
					<c:if test="${redenv[5] eq 3 }">
					</c:if>
					<td>
						<c:if test="${redenv[7] eq 1 }">投资</c:if>
						<c:if test="${redenv[7] eq 2 }">注册</c:if>
						<c:if test="${redenv[7] eq 3 }">奖励</c:if>
						<c:if test="${redenv[7] eq 4 }">抽奖</c:if>
						<!-- other情况 -->
						<c:if test="${redenv[7] eq 5 }">老用户回馈</c:if>
						<c:if test="${redenv[7] eq 6 }">节日福利</c:if>
						<c:if test="${redenv[7] eq 7 }">补发奖励</c:if>
						<c:if test="${redenv[7] eq 8 }">4月活动奖励</c:if>
						<c:if test="${redenv[7] eq 9 }">微信红包</c:if>
						<c:if test="${redenv[7] eq 10 }">充值</c:if>
						<c:if test="${redenv[7] eq 11 }">生日福利</c:if>
						<c:if test="${redenv[7] eq 12 }">周周惊喜</c:if>
					</td>
					<c:if test="${empty redenv[6] }">
						<td>--</td>
					</c:if>
					<c:if test="${!empty redenv[6] }">
						<td>${redenv[6] }</td>
					</c:if>
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
</div>