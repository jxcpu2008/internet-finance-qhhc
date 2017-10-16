<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css" media="screen">
.my-uploadify-button {
	background:none;
	border: none;
	text-shadow: none;
	border-radius:0;
}

.uploadify:hover .my-uploadify-button {
	background:none;
	border: none;
}

.fileQueue {
	width: 400px;
	height: 150px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript" src="/resources/dwz/uploadify/scripts/jquery.uploadify.min.js"></script>
<div class="pageContent" style="margin: 0 10px" layoutH="50">
	<div class="unit">
				<input type="hidden" id="loanId" name="loansign.id"  value="${id}"/>
				<input type="hidden" id="type" name="id" value="${type}"> 
				<input type="hidden" id="ooxx" name="ooxx" value="${ooxx}"> 
		</div>
	<div class="unit">
				<label>所属类型：</label>
					<select id="attachmentTypeID" name="attachmentTypeID" style="width: 133px;">
						<c:forEach items="${listAttachmentType}" var="type">
							    <option value="${type.id}" >${type.attachmentName}</option>
						</c:forEach>
					</select>
			</div>
<script>
	$(function() {
		$('#attachmentTypeID').on('change',function() {
		    var  optionId=	$('#attachmentTypeID option:selected') .val();
		    $('#fileInput').uploadify('settings','formData',{'attachmentTypeID':optionId,'loanId':$('#loanId').val()});
	    });
	});
</script>
	<div class="divider"></div>

	<input id="fileInput" type="file" name="fileurl"
		uploaderOption="{
			swf:'/resources/dwz/uploadify/scripts/uploadify.swf',
			uploader:'/attachment/uploadAttchment',
			queueID:'fileQueue',
			formData:{attachmentTypeID:$('#attachmentTypeID option:selected').val(), loanId:$('#loanId').val(),ooxx:$('#ooxx').val()},
			buttonImage:'/resources/dwz/uploadify/img/add.jpg',
			buttonClass:'my-uploadify-button',
		    fileTypeDesc:'*.jpg;*.gif;*.png;',
			fileTypeExts:'*.jpg;*.gif;*.png;',
			width:102,
			auto:false
		}"
	/>
	
	<div id="fileQueue" class="fileQueue"></div>
	
	<input type="image" src="/resources/dwz/uploadify/img/upload.jpg" onclick="$('#fileInput').uploadify('upload', '*');"/>
</div>
