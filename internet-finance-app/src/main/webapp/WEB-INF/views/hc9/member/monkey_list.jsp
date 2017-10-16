<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.hint-ico{
	background: url('/resources/assets/images/center/hint-ico.png') 0 0 no-repeat; 
	width:22px; 
	height:22px; 
	background-position:0 0; 
	float: left;
	display: inline;
	position: relative;
}
.hint-ico:hover{
	background-position:-22px 0 ;
}
.hint-ico:hover em{
	display: block;
}
.hint-ico em{
	position: absolute;
	background: url('/resources/assets/images/center/frame-bg.png') 0 0 no-repeat;
	height:49px;
	display:none;
	width:139px;
	top:-52px;
	left:50%;
	margin-left:-71px;
	z-index: 99; 
	padding: 5px 0 0 10px;
	font-style: normal;
	text-align: left;	
	color:#787878;
}
</style>
<script type="text/javascript">
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	$.ajax({
		url : '/member_index/monkey_list',
		type : 'post',
		data : { no : pageno },
		success : function(data) {
			$("#monkey_list").html(data);
		}
	});
}
</script>
<div class="table-responsive text-label">
	<table class="table text-center">
		<col width="20%" />
		<col width="30%" />
		<col width="25%" />
		<col width="25%" />
		<thead>
			<tr class="bg-panel">
				<th class="text-center" style="padding: 10px;">中奖名称</th>
				<th class="text-center" style="padding: 10px;">中奖时间</th>
				<th class="text-center" style="padding: 10px;">中奖活动</th>
				<th class="text-center" style="padding: 10px;">发放状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="monkey" items="${page.list }">
				<tr>
					<td style="padding: 10px;">
						<c:if test="${monkey[0] eq 1 or monkey[0] eq 2 or monkey[0] eq 12 or monkey[0] eq 13 or monkey[0] eq 14 or monkey[0] eq 15 }">
							现金奖励<fmt:formatNumber type="number" value="${monkey[1] }"
							pattern="#0.00#" />元
						</c:if>
						<c:if test="${monkey[0] ge 3 and monkey[0] le 5 }">
							现金返利<fmt:formatNumber type="number" value="${monkey[1] }"
							pattern="#0.00#" />元
						</c:if>
						<c:if test="${monkey[0] eq 6 }">
							iPhone 6s 16G
						</c:if>
						<c:if test="${monkey[0] eq 7 }">
							Apple Watch
						</c:if>
						<c:if test="${monkey[0] eq 8 }">
							Kindle 电子书
						</c:if>
						<c:if test="${monkey[0] eq 9 }">
							现金奖励<fmt:formatNumber type="number" value="${monkey[1] }"
							pattern="#0.00#" />元
						</c:if>
						<c:if test="${monkey[0] eq 10 }">
							现金2元
						</c:if>
						<c:if test="${monkey[0] eq 11 }">
							<fmt:formatNumber type="number" value="${monkey[1] }"
							pattern="#0.00#" />元现金
						</c:if>
						<c:if test="${monkey[0] eq 16 }">
							演唱会门票<fmt:formatNumber type="number" value="${monkey[1] }"
							pattern="#0.#" />张(李荣浩)
						</c:if>
					</td>
					<td  style="padding: 10px;">${fn:substring(monkey[2],0,16) }</td>
					<td>
						<c:if test="${monkey[0] eq 1 or monkey[0] eq 12 }">一鸣金人</c:if>
						<c:if test="${monkey[0] eq 2 or monkey[0] eq 13}">一锤定音</c:if>
						<c:if test="${monkey[0] ge 3 and monkey[0] le 5 }">金袍加身</c:if>
						<c:if test="${monkey[0] ge 6 and monkey[0] le 8 }">红筹达人</c:if>
						<c:if test="${monkey[0] eq 9 }">红筹理财师</c:if>
						<c:if test="${monkey[0] eq 10 }">金桃朵朵开</c:if>
						<c:if test="${monkey[0] eq 11 }">翻牌抽奖</c:if>
						<c:if test="${monkey[0] eq 14 or monkey[0] eq 15 }">5月活动</c:if>
						<c:if test="${monkey[0] eq 16 }">聚橙网</c:if>
					</td>
					<c:choose>
						<c:when test="${monkey[3] eq 1 }">
							<td style="color: #B4B4B4; padding: 10px;">已发放</td>
						</c:when>
						<c:otherwise>
							<td style="color: #333333; padding: 10px;">
								<span style="float: left; padding:0 16px 0 85px;">待发放</span>
								<c:if test="${monkey[0] eq 10 }">
									<span class="hint-ico">
										<c:choose>
											<c:when test="${monkey[4] eq monkey[5]}">
												<em style="font-size: 12px; color: #787878;">实名审核通过后发放至<br>账户余额</em>
											</c:when>
											<c:otherwise>
												<em style="font-size: 12px; color: #787878;">您的好友实名审核通过后发放至账户余额</em>
											</c:otherwise>
										</c:choose>
									</span>
								</c:if>
							</td>
						</c:otherwise>
					</c:choose>
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