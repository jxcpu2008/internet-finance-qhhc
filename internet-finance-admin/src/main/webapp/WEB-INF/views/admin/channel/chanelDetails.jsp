<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="/resources/assets/js/admin/channelAdv.js"></script>
<div style="overflow-y: auto; height: 600px;">
	<input type="hidden" id="flagId" value="${sId }" /> <input
		type="hidden" id="flagcode" value="${code }" />
	<div style="padding: 40px 50px;">
		<button type="button" class="addAdv" data-sid="${sId }"
			data-id="${code }" data-name="${name}"
			style="padding: 10px 35px; background-color: #0099FF; color: #fff; border-style: none; cursor: pointer;">新增广告位</button>
	</div>
	<div
		style="border: 1px solid #ccc; padding: 15px; margin-left: 30px; margin-right: 10px; clear: both;">
		<h1 style="font-size: 16px;">${name}</h1>

	</div>
	<div
		style="margin-left: 40px; margin-right: 56px; padding: 20px 10px; min-height: 100px;">
		<ul style="overflow: hidden;">
			<c:forEach items="${page.list }" var="advList">
				<li
					style="height: 25px; line-height: 25px; color: #0099FF; clear: both;"><span
					style="font-size: 14px;" class="advst" data-id="${sId}"
					data-uid="${advList[1]}" data-sid="${advList[0]}">${advList[2] }</span>
					<hr
						style="width: 80%; margin: -15px auto auto; color: #efefef; line-height: 25px;" />
					<button type="button" class="adv_edit" data-id="${advList[1]}"
						data-sid="${advList[0]}" data-pid="${sId}" data-uid="${code}"
						data-name="${name}"
						style="border-style: none; color: #0099FF; float: right; background-color: #fff; font-size: 14px; margin-top: -13px; cursor: pointer;">编辑</button>
					<button type="button" class="adv_code" data-id="${advList[1]}"
						data-sid="${advList[0]}"
						style="border-style: none; color: #0099FF; float: right; background-color: #fff; font-size: 14px; margin-top: -13px; cursor: pointer;">代码</button></li>
			</c:forEach>
		</ul>
	</div>
	<jsp:include page="/WEB-INF/views/admin/channel/pageRedtwo.jsp"></jsp:include>
</div>
<!-- ----弹出框 -->
<div id="domelChannelAdv"
	style="border: 1px solid #CCC; background-color: #fff; width: 350px; height: 200px; position: absolute; top: 150px; left: 450px; display: none; z-index: 9999;">

</div>
