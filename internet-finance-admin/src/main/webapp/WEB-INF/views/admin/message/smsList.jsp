<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
var plan_type = "${type}";  // 获取列表页面显示的类型
function editPlan(id) {
	navTab.closeTab("main105");
	navTab.openTab("main105", "/messageManager/toModifyPlanPage?msgType="+plan_type+"&planId="+id, 
			{ title:"编辑计划", fresh:true});
}
function copyMsgSendplan(id) {
	navTab.closeTab("main105");
	navTab.openTab("main105", "/messageManager/copyMsgSendplan.htm?planId="+id, 
			{ title:"复制计划", fresh:true});
}
function addPlan(type) {
	navTab.closeTab("main105");
	navTab.openTab("main105", "/messageManager/addPlanPage?type="+type, 
			{ title:"添加计划", fresh:true});
}
function breakSend(id,status,no) {
	alertMsg.confirm("确定终止该计划？", {
		okCall: function() {
			updStatus(id,status,no);
		}
	});
}
function reSend(id,status,no) {
	alertMsg.confirm("确定重新发送该计划？", {
		okCall: function() {
			updStatus(id,status,no);
		}
	});
}
function updStatus(id,status,no) {
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
				navTab.reload("/messageManager/smsList?no="+no+"&type="+plan_type, "", 101);
				$(window).scrollTop(data);
			}
		}
	});
}
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}

	navTab.reload("/messageManager/smsList?no=" + pageno+"&type="+plan_type, "", 101);
}
</script>
<link href="/resources/assets/css/admin/send_plan.css" rel="stylesheet" type="text/css"/>
<div style="overflow-y: scroll; height: 650px;">
	<div class="sms_ctx">
		<p style="margin:10px 0 10px 1200px;">
			<input type="button" value="添加<c:if test="${type eq 1 }">短信</c:if><c:if test="${type eq 2 }">邮件</c:if>" class="ctx_btn" 
			 onclick="addPlan(${type})" />
		</p>
		<table>
			<thead>
				<tr class="t_head">
					<td><c:if test="${type eq 1 }">短信</c:if><c:if test="${type eq 2 }">邮件</c:if>ID</td>
					<td><c:if test="${type eq 1 }">短信</c:if><c:if test="${type eq 2 }">邮件</c:if>名称</td>
					<td>预计开始发送时间</td>
					<td>预计发送完毕时间</td>
					<td>已发送数量（封）</td>
					<td>剩余数量（封）</td>
					<td>任务状态</td>
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
						<td>${sms[6] }</td>
						<td>${sms[7] }</td>
						<td>
							<c:if test="${sms[5] eq 1}">等待发送</c:if>
							<c:if test="${sms[5] eq 2}">正在发送</c:if>
							<c:if test="${sms[5] eq 3}">发送终止</c:if>
							<c:if test="${sms[5] eq 4}">发送完毕</c:if>
							<c:if test="${sms[5] eq 5}">发送失败</c:if>
							<c:if test="${sms[5] eq 6}">暂停发送</c:if>
						</td>
						<td style="width: 260px;height: 50px;">
							<c:if test="${sms[5] eq 1}">
								<input type="button" value="终止" class="ctx_btn" onclick="breakSend(${sms[0]},3,${page.pageNum })" />
								<input type="button" value="复制" class="ctx_btn" onclick="copyMsgSendplan(${sms[0]})"/>
								<input type="button" value="编辑" class="ctx_btn" onclick="editPlan(${sms[0]})" />
							</c:if>
							<c:if test="${sms[5] eq 2}">
								<input type="button" value="终止" class="ctx_btn" onclick="breakSend(${sms[0]},3,${page.pageNum })" />
								<input type="button" value="复制" class="ctx_btn" onclick="copyMsgSendplan(${sms[0]})"/>
								<input type="button" value="暂停发送" class="ctx_btn" onclick="updStatus(${sms[0]},6,${page.pageNum })" />
							</c:if>
							<c:if test="${sms[5] eq 3}">
								<input type="button" value="复制" class="ctx_btn" onclick="copyMsgSendplan(${sms[0]})"/>
								<c:if test="${sms[6] le 0 }">
									<input type="button" value="编辑" class="ctx_btn" onclick="editPlan(${sms[0]})" />
								</c:if>
							</c:if>
							<c:if test="${sms[5] eq 4}">
								<input type="button" value="复制" class="ctx_btn" onclick="copyMsgSendplan(${sms[0]})"/>
							</c:if>
							<c:if test="${sms[5] eq 5}">
								<input type="button" value="重新发送" class="ctx_btn" onclick="reSend(${sms[0]},2,${page.pageNum })" />
								<c:if test="${sms[6] le 0 }">
									<input type="button" value="编辑" class="ctx_btn" onclick="editPlan(${sms[0]})" />
								</c:if>
							</c:if>
							<c:if test="${sms[5] eq 6}">
								<input type="button" value="终止" class="ctx_btn" onclick="breakSend(${sms[0]},3,${page.pageNum })" />
								<input type="button" value="复制" class="ctx_btn" onclick="copyMsgSendplan(${sms[0]})"/>
								<input type="button" value="开始发送" class="ctx_btn" onclick="updStatus(${sms[0]},2,${page.pageNum })" />
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="/WEB-INF/views/admin/channel/pageRedone.jsp"></jsp:include>
	</div>
</div>