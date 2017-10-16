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
     if(selectvalue=='9'){
    	     textobj.value="";
             textobj.style.display="block";
     }else{
             textobj.style.display="none";
     }
 }
 </script>
<form method="post" id="frm" name="myForm" action="<%=basePath %>hccoindetailQuery/saveHccoindetailQT"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">	
			<dl>
			   <dt>编辑事由：</dt>
				<dd>
				   <select name="state" onchange="showSelectValue(this)">
					<option value="4" <c:if test="${state==4}">selected="selected"</c:if>>微课堂</option>
					<option value="5" <c:if test="${state==5}"> selected="selected" </c:if>>全勤奖</option>
					<option value="6" <c:if test="${state==6}"> selected="selected" </c:if>>图书馆</option>
					<option value="7" <c:if test="${state==7}"> selected="selected" </c:if>>活动奖励</option>
					<option value="8" <c:if test="${state==8}"> selected="selected" </c:if>>拍卖会</option>
					<option value="9" <c:if test="${state==9}"> selected="selected" </c:if>>其他</option>
				</select>
				</dd>
			</dl>
			<dl>
			  <dt>&nbsp;&nbsp;&nbsp;</dt>
				<dd>
				    <input type="text"  id="remark" name="remark"    style="display:none;" class="required"  value="1"/>
				</dd>
			</dl>
			<dl>
			   <dt>操作类型：</dt>
				<dd>
				    <input type="hidden" name="userId" value="${user.id}" />
				   <select name="jjstate">
					<option value="1"  <c:if test="${jjstate==1}">selected="selected"</c:if>>+</option>
					<option value="2" <c:if test="${jjstate==2}"> selected="selected" </c:if>>-</option>
				</select>
				</dd>
			</dl>
			<dl>
			   <dt>红筹币：</dt>
				<dd>
				     <input type="text"  name="number"    class="required number" />
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