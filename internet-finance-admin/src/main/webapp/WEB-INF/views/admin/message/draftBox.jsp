<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
function updStatus(id,status,type) {
	$.ajax({
		url : "/messageManager/statusSend",
		type : "post",
		data : {
			id : id,
			sendStatus : status,
			scroll : $(window).scrollTop()
		},
		success : function(data) {
			if (data != "error") {
				navTab.closeCurrentTab();
				if (type == "1")  { // 短信
					navTab.openTab("main103","/messageManager/smsList?type=1",{title:'短信列表'});
				} else {  // 邮箱
					navTab.openTab("main102","/messageManager/smsList?type=2",{title:'邮箱列表'});
				}
				$(window).scrollTop(data);
			}
		}
	});
}

/** 草稿箱跳转到修改页面 */
function toModifyPlanPage(planId, msgType) {
	navTab.closeTab("main105");
	navTab.openTab("main105", "/messageManager/toModifyPlanPage?planId="+planId+"&msgType="+msgType, 
			{ title:"编辑计划", fresh:true});
}
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}

	navTab.reload("/messageManager/draftBox?no=" + pageno, "", 101);
}
</script>
<link href="/resources/assets/css/admin/send_plan.css" rel="stylesheet" type="text/css"/>
<div style="overflow-y: scroll; height: 700px;">
	<div class="sms_ctx" style="margin-top: 50px;">
		<table>
			<thead>
				<tr class="t_head">
					<td>计划ID</td>
					<td>计划名称</td>
					<td>预计开始发送时间</td>
					<td>预计发送结束时间</td>
					<td>已发送数量（封）</td>
					<td>剩余数量（封）</td>
					<td>保存时间</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list }" var="sms">
					<tr class="t_body">
						<td>${sms[0] }</td>
						<td>${sms[1] }</td>
						<td>${sms[3] }</td>
						<td>${sms[4] }</td>
						<td>0</td>
						<td>${sms[8] }</td>
						<td>${sms[6] }</td>
						<td style="width: 260px;height: 50px;">
								<input type="button" value="编辑" class="ctx_btn" onclick="toModifyPlanPage(${sms[0]},${sms[7]})"/>
								<input type="button" value="发送" class="ctx_btn" onclick="updStatus(${sms[0]},1,${sms[7] })" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="/WEB-INF/views/admin/channel/pageRedone.jsp"></jsp:include>
	</div>
</div>