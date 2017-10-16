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
<form method="post" id="frm" name="myForm" action="<%=basePath %>dadabus/saveDadaBusFreeTicket"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<input type="hidden" id="dadabusId" name="dadabusId" value="${dadaBusTicket.id}">
	<div class="pageContent">
			<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">	
			<dl>
			   <dt>&nbsp;&nbsp;&nbsp;姓名：</dt>
				<dd>${dadaBusTicket.investName}</dd>
			</dl>
			<dl>
			   <dt>手机号：</dt>
				<dd>${dadaBusTicket.mobilePhone}</dd>
			</dl>
			<dl>
			   <dt>&nbsp;&nbsp;&nbsp;状态：</dt>
				<dd>
				   <select id="status" name="status">
					<option value="1" <c:if test="${dadaBusTicket.status==1}">selected="selected"</c:if>>待沟通</option>
					<option value="2" <c:if test="${dadaBusTicket.status==2}"> selected="selected" </c:if>>确定乘车</option>
					<option value="3" <c:if test="${dadaBusTicket.status==3}"> selected="selected" </c:if>>已提交信息</option>
					<option value="4" <c:if test="${dadaBusTicket.status==4}"> selected="selected" </c:if>>已收到票</option>
					<option value="5" <c:if test="${dadaBusTicket.status==5}"> selected="selected" </c:if>>放弃赠票</option>
				</select>
				</dd>
			</dl>
			<dl>
			   <dt>&nbsp;&nbsp;&nbsp;备注：</dt>
				<dd>
				     <textarea type="text"  name="lineRemark"    class="number" >${dadaBusTicket.lineRemark}</textarea>
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