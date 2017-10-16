<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>

<c:if test="${!empty page.list }">
	<c:forEach items="${page.list }" var="loanlist" varStatus="var">
		<div class="product-info">
			<div style="position:relative;">
				<c:if test="${loanlist[11] eq 1  || loanlist[0]==378}">
					<img src="${oss}/resources/assets/images/home/award-ico.png" style="position:absolute;right:0;top:45px;" />
				</c:if>
				<h4 class="text-danger text-ellipsis">
					<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist[0]}"
						class="text-danger" title="${loanlist[1] }" data-id="modifyDot">${loanlist[1] }</a>
				</h4>
				<small class="text-label pull-right">标期:<c:if
						test="${loanlist[8] eq 2}">${loanlist[2]}个月</c:if> <c:if
						test="${loanlist[8] eq 3}">${loanlist[2]}天 </c:if></small>
				<p>
					<span class="text-label">融资总额:</span> &yen;
					<span data-id="fm"><fmt:formatNumber type="number" value="${loanlist[3]}"
						pattern="#0.00" /></span>
					元
				</p>
				<p>
					<span class="text-label">起投金额:</span> &yen;
					<span data-id="fm"><fmt:formatNumber type="number" value="${loanlist[4]}"
						pattern="#0.00" /></span>
					元
				</p>
				<div id="process-${var.index+1}" class="autox110"
					data-process="<fmt:formatNumber
												type="number"
												value="${(loanlist[3]-loanlist[5])/loanlist[3]*100}"
												pattern="#0.0" />"></div>
				<ul class="list-unstyled list-inline clearfix">
					<c:if test="${loanlist[10] ne 5 }">
						<li class="text-label micmedium-font text-center"><span
							class="label label-clip label-priority"><span
								class="texttop-align">优</span></span><span
							class="medium-font text-success sub-align"><fmt:formatNumber
									type="number" value="${loanlist[6]*100}" pattern="#0.00" /><span
														class="normal-font">%</span>+<fmt:formatNumber
									type="number" value="${loanlist[7]*100}" pattern="#0.00" /><span
								class="normal-font">%</span></span></li>
						<li class="text-label micmedium-font" style="width: 49%;"><span
							class="label label-clip label-sandwich"><span
								class="texttop-align">夹</span></span>0~14<span class="normal-font">%</span></li>
						<li class="text-label micmedium-font" style="width: 49%;"><span
							class="label label-clip label-inferior"><span
								class="texttop-align">劣</span></span>浮动收益</li>
					</c:if>
					<c:if test="${loanlist[10] eq 5 }">
						<li class="text-label micmedium-font text-center" style="padding-top: 15px;"><span
							class="label label-clip label-priority"></span><span
							class="medium-font text-success sub-align"><fmt:formatNumber
							type="number" value="${(loanlist[6]+loanlist[7])*100}" pattern="#0.00" /><span
							class="normal-font">%</span></span></li>
					</c:if>
				</ul>
			</div>
			<c:if test="${loanlist[9] eq 1 }">
				<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist[0]}"
					class="btn btn-default btn-lg btn-block bg-danger text-snow"
					role="button">立即众持</a>
			</c:if>
			<c:if
				test="${loanlist[9] eq 2 || loanlist[9] eq 3 ||loanlist[9] eq 4 ||loanlist[9] eq 5 }">
				<a href="javascript:;"
					class="btn btn-default btn-lg btn-block bg-muted text-snow"
					role="button">融资成功</a>
			</c:if>
			<c:if test="${loanlist[9] eq 6 || loanlist[9] eq 7 }">
				<a href="javascript:;"
					class="btn btn-default btn-lg btn-block bg-muted text-snow"
					role="button">还款中</a>
			</c:if>
			<c:if test="${loanlist[9] eq 8 }">
				<a href="javascript:;"
					class="btn btn-default btn-lg btn-block bg-muted text-snow"
					role="button">已完成</a>
			</c:if>
			<c:if test="${loanlist[9] eq -1 }">
				<a href="javascript:;"
					class="btn btn-default btn-lg btn-block bg-muted text-snow"
					role="button">已清盘</a>
			</c:if>
		</div>
	</c:forEach>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<script src="${oss}/resources/assets/js/src/generic-modules.js"></script>
<script src="${oss}/resources/assets/js/loan.js"></script>
<script>
$(function() {
	$('a[data-id="modifyDot"]').each(function() {
		$(this).html($.trim($(this).text()).replace(' ﹒', ' &bull; '));
	});
	if ($(window).width() < 1170) {
		$('.product-info').css('width', '30%');
	}
});
</script>
<!--[if (gte IE 6)&(lte IE 8)]>
            <script src="/resources/assets/js/src/ie-modules.js"></script>
            <script src="/resources/assets/js/ie8fix.js"></script> 
        <![endif]-->