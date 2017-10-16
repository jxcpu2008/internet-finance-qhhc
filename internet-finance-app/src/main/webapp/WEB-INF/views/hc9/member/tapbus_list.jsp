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
		url : '/member_index/tapbus_list',
		type : 'post',
		data : {
			no : pageno,
			status : $("#status").val()
		},
		success : function(data) {
			$("#tapbus").html(data);
		}
	});
}
$(function(){
	$("#tabpanel li a").click(function(){
		var $this = $(this);
		var sign = $this.attr("href").split('#')[1];
		if (sign == 'applyment') {
			$("#status").val('1');
		} else {
			$("#status").val('0');
		}
		$.ajax({
			url : '/member_index/tapbus_list',
			type : 'post',
			data : {
				no : 1,
				status : $("#status").val()
			},
			success : function(data) {
				$("#tapbus").html(data);
			}
		});
	});
});
</script>
<div class="account-view w100-view bg-snow" role="tabpanel">
	<ul class="nav nav-tabs nav-justified" role="tablist" id="tabpanel">
		<li role="presentation" <c:if test="${status eq 1 }">class="active"</c:if>><a href="#applyment"
			aria-controls="applyment" role="tab" data-toggle="tab">可使用</a></li>
		<li role="presentation" <c:if test="${status eq 0 }">class="active"</c:if>><a href="#pastdue"
			aria-controls="finacing" role="tab" data-toggle="tab">已过期</a></li>
		<li role="presentation"><a
			aria-controls="repayment" role="tab" data-toggle="tab"
			style="display: none;"></a></li>
	</ul>
	<div class="tab-content">
		<input type="hidden" id="status" value="${status }"/>
		<div role="tabpanel" class="tab-pane fade in active" id="applyment">
			<div style="width: 96%; margin: 0 auto; padding: 20px 10px 0 10px;">
				<ul style="padding: 0;">
					<c:forEach var="capbus" items="${page.list }" varStatus="i">
						<div
							style="<c:choose><c:when test="${status eq 0 }">background: url(/resources/public/images/member/dada_roll2.jpg) 0 0 no-repeat;</c:when><c:otherwise>background: url(/resources/public/images/member/dada_roll.jpg) 0 0 no-repeat;</c:otherwise></c:choose> width: 425px; height: 176px; float: left; position: relative; margin: 0 0 20px 10px;">
							<dl
								style="position: absolute; left: 25px; top: 20%; font-size: 18px; color: #787878;">
								<dt>嗒嗒巴士代金券</dt>
								<dd>
									￥<span style="font-size: 62px;"><fmt:formatNumber
											type="number" value="${capbus[0] }" /></span>
								</dd>
							</dl>
							<p
								style="position: absolute; right: 25px; top: 85%; font-size: 14px; color: #787878;">${capbus[1] }
								- ${capbus[2] }</p>
						</div>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>