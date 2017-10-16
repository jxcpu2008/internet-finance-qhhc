<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>

<div class="newsrt">
	<div class="clearfix visible-xs-block"></div>
	<div class="text-label titmian">

		<div class="tit">
			<c:forEach items="${helplist }" var="list" end="0" varStatus="varst">
			${list.levelOne }
			</c:forEach>
			<hr>
		</div>
		<div class="panel-group" id="myp" role="tablist"
			aria-multiselectable="true">
			<c:forEach items="${helplist }" var="list" varStatus="varst">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" data-toggle="collapse"
						data-parent="#myp" href="#myp${varst.index+12 }"
						aria-expanded="false">
						<h4 class="panel-title">
							<span>${list.secondary}</span>
						</h4>
					</div>
					<div id="myp${varst.index+12 }"
						class="panel-collapse collapse <c:if test="${varst.index eq 0 }">in</c:if>"
						role="tabpanel">
						<div class="panel-body">${list.remark }</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</div>
