<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
function switchSend(id,obj) {
	$.ajax({
		url : "/messageManager/switchSend",
		type : "post",
		data : {
			id : id,
			status : status
		},
		success : function(data) {
			if (data == "0") {
				$(obj).text('开启');
			} else if (data == "1") {
				$(obj).text('关闭');
			} else {
				alert(data);
			}
		}
	});
}
</script>
<style type="text/css">
.out_div {
	margin: 70px 160px;
}

.set_list {
	padding: 12px 26px;
	height: 26px;
	width: 800px;
	border: 1px solid #C3C3C3;
	margin-bottom: 10px;
}

.btn {
	border: 1px solid #C3C3C3;
	width: 74px;
	height: 30px;
	background-color: #33CCFF;
	cursor: pointer;
}

.font {
	font-size: 16px;
	font-family: "微软雅黑";
}

.ctx_spacing {
	display:inline-block;
	min-width:89%;
}
</style>
<div style="overflow-y: scroll; height: 700px;">
	<div class="out_div">
		<c:forEach items="${scList }" var="sc">
			<div class="set_list">
				<span class="font ctx_spacing">${sc.switchZhName }</span>
				<c:if test="${sc.switchStatus eq 0 }">
					<button type="button" class="btn font" onclick="switchSend(${sc.id},this)">开启</button>
				</c:if>
				<c:if test="${sc.switchStatus eq 1 }">
					<button type="button" class="btn font" onclick="switchSend(${sc.id},this)">关闭</button>
				</c:if>
			</div>		
		</c:forEach>
	</div>
</div>