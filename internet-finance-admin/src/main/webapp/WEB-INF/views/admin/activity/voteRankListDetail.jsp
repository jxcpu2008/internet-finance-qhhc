<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">
	<!-- 查找带回结束 -->
	<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
		<table>
			<c:forEach items="${voteRecordList}" var="item">
				<tr>
					<td width="100px" height="20px">${item.votedId}</td>
					<td width="100px" height="20px">${item.totalNum}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="reset" class="close">确定</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>