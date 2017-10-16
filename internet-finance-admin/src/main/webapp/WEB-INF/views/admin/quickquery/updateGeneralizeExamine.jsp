<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
 <script type="text/javascript">
 function showSelectValue(){
	 var textobj=document.getElementById('remark');
     var selectvalue=document.myForm.state.value;  
     if(selectvalue=='4'){
    	     textobj.value="";
             textobj.style.display="block";
     }else{
             textobj.style.display="none";
     }
 }
 </script>
<form method="post" id="frm" name="myForm" action="<%=basePath %>generalizeExamine/auditGeneralizeNotExamine?examine=2"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">	
			<dl>
			   <dt>选择拒绝原因：</dt>
				<dd>
				   <select name="state" onchange="showSelectValue(this)">
					<option value="1" <c:if test="${state==1}">selected="selected"</c:if>>提交信息有误</option>
					<option value="2" <c:if test="${state==2}"> selected="selected" </c:if>>用户拒绝被关联</option>
					<option value="3" <c:if test="${state==3}"> selected="selected" </c:if>>用户对关联人无印象</option>
					<option value="4" <c:if test="${state==4}"> selected="selected" </c:if>>其他</option>
				</select>
				</dd>
			</dl>
			<dl>
			  <dt>&nbsp;&nbsp;&nbsp;</dt>
				<dd>
			     	<input type="hidden" name="id" value="${id}"/>
				    <textarea rows="3"  cols="20"  id="remark" name="remark"    style="display:none;" class="required"  >描述详情</textarea>
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent" >
							<button type="submit" >确认</button>
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
	</div>
</form>