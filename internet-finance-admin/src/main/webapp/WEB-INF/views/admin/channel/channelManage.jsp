<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="/resources/assets/js/admin/chanManage.js"></script>
<div style="overflow-y: auto; height: 600px;">
	<div style="padding: 50px;">
		<button type="button" id="addChannel"
			style="padding: 10px 35px; background-color: #0099FF; color: #fff; border-style: none; cursor: pointer;">新增渠道</button>
	</div>
	<c:forEach items="${page.list }" var="channel">
		<div
			style="border: 1px solid #ccc; padding: 15px; margin-left: 30px; margin-right: 10px; clear: both;">
			<h1 style="font-size: 16px;">${channel[2]}</h1>
			<div style="float: right; margin-top: -19px; margin-right: 40px;">
				<button type="button" class="code" data-id="${channel[1]}"
					style="border-style: none; color: #0099FF; background-color: #fff; font-size: 14px; cursor: pointer;">代码</button>
				<button type="button" class="addAdv" data-id="${channel[1]}"
					data-sid="${channel[0]}" data-name="${channel[2]}"
					style="border-style: none; color: #0099FF; background-color: #fff; font-size: 14px; cursor: pointer;">添加广告位</button>
				<button type="button" class="edit" data-id="${channel[1]}"
					data-sid="${channel[0]}" 
					style="border-style: none; color: #0099FF; background-color: #fff; font-size: 14px; cursor: pointer;">编辑</button>
			</div>
		</div>
		<c:set var="num" value="1"></c:set>
		<div
			style="margin-left: 40px; margin-right: 56px; padding: 20px 10px; min-height: 100px;">
			<ul style="overflow: hidden;">
				<c:forEach items="${list }" var="list">
					<c:if test="${channel[0] eq list[5] }">
						<c:if test="${num lt 6 }">
							<li
								style="height: 25px; line-height: 25px; color: #0099FF; clear: both;"><span
								style="font-size: 14px;" data-id="${channel[1]}"
								data-uid="${list[1]}" data-sid="${list[0]}"
								data-name="${list[2] }" class="advst">${list[2] }</span>
								<hr
									style="width: 80%; margin: -15px auto auto; color: #efefef; line-height: 25px;" />
								<button type="button" class="adv_edit" data-id="${list[1]}"
									data-sid="${list[0]}" data-pid="${channel[0]}"
									data-uid="${channel[1]}" data-name="${channel[2]}"
									style="border-style: none; color: #0099FF; float: right; background-color: #fff; font-size: 14px; margin-top: -13px; cursor: pointer;">编辑</button>
								<button type="button" class="adv_code" data-id="${list[1]}"
									style="border-style: none; color: #0099FF; float: right; background-color: #fff; font-size: 14px; margin-top: -13px; cursor: pointer;">代码</button>
							</li>
						</c:if>
						<c:set var="num" value="${num+1 }"></c:set>
					</c:if>

				</c:forEach>
			</ul>
			<button type="button" class="seeDetail" data-id="${channel[1]}"
				data-sid="${channel[0]}" data-name="${channel[2] }"
				style="padding: 8px 30px; background-color: #0099FF; color: #fff; border-style: none; margin-top: 10px; cursor: pointer;">查看更多</button>
		</div>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/admin/channel/pageRedone.jsp"></jsp:include>
</div>

<!-- ----弹出框 -->
<div id="domelChannel"
	style="border: 1px solid #CCC; background-color: #fff; width: 350px; height: 200px; position: absolute; top: 150px; left: 450px; display: none; z-index: 9999;">

</div>


