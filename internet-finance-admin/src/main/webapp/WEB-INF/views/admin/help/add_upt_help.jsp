<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageContent">
	<form id="form1" action="/helper/addOrUpdateHelp"
		enctype="multipart/form-data" method="post"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, navTabAjaxDone)">
		<div class="pageFormContent" layoutH="56">
			<input type="hidden" name="id" value="${help.id }" /> <input
				type="hidden" name="operation" value="${operation}" /> <input
				type="hidden" id="columName" name="levelOne" />
			<div style="width: 600px; margin: 0 auto;">
				<div style="width: 100%; float: left; margin-top: 10px;">
					<p>
						<label>一级标题：</label> <select id="helpColum" name="level_Id"
							style="width: 135px;">
							<option value="">请选择</option>
							<c:forEach items="${helpList}" var="helplist">
								<c:if test="${operation == 'upt'}">
									<option value="${helplist.level_Id}"
										<c:if test="${helplist.level_Id eq help.level_Id}">selected="selected"</c:if>>${helplist.levelOne}</option>
								</c:if>
								<c:if test="${operation == 'add'}">
									<option value="${helplist.level_Id}">${helplist.levelOne}</option>
								</c:if>
							</c:forEach>
						</select>
					</p>
				</div>
				<div style="width: 100%; float: left; margin-top: 10px;">
					<p>
						<label>二级标题：</label> <input style="width: 135px;" class="required"
							type="text" name="secondary" value="${help.secondary }">
					</p>
				</div>
				<div style="width: 100%; float: left; margin-top: 10px;">
					<p>
						<label>内容编辑器：</label>
						<textarea class="editor" name="remark" rows="13" cols="80"
							id="context" upImgUrl="/admincolum/uploadFile"
							upImgExt="jpg,jpeg,gif,png">${help.remark}</textarea>
					</p>
				</div>

			</div>

		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>

</div>
<script type="text/javascript">
	$(function() {
		$("#columName").val($("#helpColum").find("option:selected").text());
		$("#helpColum").change(
				function() {

					$("#columName").val(
							$("#helpColum").find("option:selected").text());
				});
		
	});
</script>