<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table width="948" border="0" cellpadding="1" cellspacing="1" bgcolor="red" class="common-table txt-c clr-yellow px18">
	<col width="20%"/>
	<col width="30%"/>
	<col width="20%"/>
	<col width="30%"/>
	<tr class="px22 bg-yellow clr-darkRed" height="60">
	    <td style="border:1px solid #ffe684" height="60">排名</td>
	    <td style="border:1px solid #ffe684">手机号</td>
	    <td style="border:1px solid #ffe684">投资累计金额</td>
	    <td style="border:1px solid #ffe684">待收奖励</td>
	</tr>
    <c:forEach var="monkeyData" varStatus="i" items="${list }" begin="0" end="9">
		<tr height="60" <c:if test="${i.count le 3 }">class="lightcolor"</c:if>>
		    <td bgcolor="#">
				<c:choose><c:when test="${i.count le 3 }"><img src="${oss }/resources/public/images/monkey/investRank-sprites${i.count }.png" /></c:when>
					<c:otherwise>${i.count }</c:otherwise>
				</c:choose>
			</td>
		    <c:set var="phone" value="${monkeyData.phone.toString() }" />
			<td>${phone.replace(phone.substring(3,phone.length()-4),'****') }</td>
			<td><fmt:formatNumber type="number" value="${monkeyData.money }" pattern="#0.00" /></td>
			<td>
				<c:if test="${i.count eq 1 }"><fmt:formatNumber type="number" value="${monkeyData.money*0.008 }" pattern="#0.00" /></c:if>
				<c:if test="${i.count eq 2 }"><fmt:formatNumber type="number" value="${monkeyData.money*0.006 }" pattern="#0.00" /></c:if>
				<c:if test="${i.count eq 3 }"><fmt:formatNumber type="number" value="${monkeyData.money*0.003 }" pattern="#0.00" /></c:if>
				<c:if test="${i.count gt 3 }">
					<c:choose>
						<c:when test="${week eq 7 }">请下期加油</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${weekNum eq week }"><span class="mybutton">继续加油</span></c:when>
								<c:otherwise>请下周加油</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<c:if test="${empty list }">
	<p style="text-align: center;font-size: 25px;color: white;padding: 50px;">还没用户入榜</p>
</c:if>
<script type="text/javascript">
$(function(){
	if ($(".mybutton").size() > 0) {
		$(".mybutton").on('mouseenter',function(){
			$(this).html('<a href="/loaninfo/loanList.htm?nav=2">继续加油</a>');
		});
		$(".mybutton").on('mouseleave',function(){
			$(this).html('继续加油');
		});
	}
});
</script>