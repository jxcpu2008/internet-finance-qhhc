<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
 <script type="text/javascript">
 $(function(){
		/*  员工手机验证*/
		$('#staffPhoneCopy').blur(function() {
					var staffPhone = $('#staffPhone').val();
					var staffPhoneCopy = $('#staffPhoneCopy').val();
					if (staffPhone!=staffPhoneCopy){
						$('#staffPhoneCopy').val('');
						alert("两次输入的员工手机不一致");
					}
	     });
        /***员工身份证验证*/
		$('#staffIdcardCopy').blur(function() {
			var staffIdcard = $('#staffIdcard').val();
			var staffIdcardCopy = $('#staffIdcardCopy').val();
			if (staffIdcard!=staffIdcardCopy){
				$('#staffIdcardCopy').val('');
				alert("两次输入的员工身份证不一致");
			}
 });
		
 })
 </script>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<div class="pageContent">                                                                            
<form method="post" action="<%=basePath %>escrow/addOrUptEscrow"   class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" >
			<dl>
				<dt>担保公司名称：</dt>
				<dd>
					<input class="required" name="name" value="${escrow.name}" type="text">
					<input type="hidden" name="id" value="${ escrow.id}" />
				</dd>
			</dl>
			<dl>
				<dt>公司电话号码：</dt>
				<dd>
					<input type="text" name="phone" value="${escrow.phone}"  maxlength="13"   class="required number" />
				</dd>
			</dl>
			<dl>
				<dt>公司地址：</dt>
				<dd>
					<input type="text" name="address" value="${escrow.address}" class="required" />
				</dd>
			</dl>
		</div>
		<div  class="pageFormContent" >
			  <dl>
					<dt>员工姓名：</dt>
					<dd>
					   <c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text" name="staffName" value="${escrow.staffName}"  class="required" /></c:if>
					   <c:if test="${uptState eq '1'}"><input type="text" name="staffName" value="${escrow.staffName}"  class="required"  readonly="readonly" /></c:if>
					</dd>
				</dl>
			   <dl>
				<dt>注册用户名：</dt>
					<dd>
					   <c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text" name="staffUserName"  alt ="必须是字母" value="${escrow.staffUserName}"  class="required  lettersonly textInput"  minlength="5" maxlength="15" /></c:if>
					   <c:if test="${uptState eq '1'}"><input type="text" name="staffUserName" value="${escrow.staffUserName}"  class="required"  readonly="readonly" /></c:if>
					</dd>
				</dl>
	            <dl>
					<dt>员工邮箱：</dt>
					<dd>
						<c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text" name="staffEmail" value="${escrow.staffEmail}"    class="required email"/></c:if>
						<c:if test="${uptState eq '1'}"><input type="text" name="staffEmail" value="${escrow.staffEmail}"   class="required email" readonly="readonly" /></c:if>
					</dd>
				</dl>
		</div>
		<div  class="pageFormContent" >
				<dl>
					<dt>员工手机：</dt>
					<dd>
						 <c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text"   id="staffPhone"  name="staffPhone" value="${escrow.staffPhone}"  maxlength="13"   class=" phone required" /></c:if>
						 <c:if test="${uptState eq '1'}"><input type="text" name="staffPhone" value="${escrow.staffPhone}"  maxlength="13"  class=" phone required"  readonly="readonly"  /></c:if>
					</dd>
				</dl>
				<dl>
					<dt>员工手机：</dt>
					<dd>
						 <c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text"  id="staffPhoneCopy"  alt ="再次输入员工手机"  name="staffPhoneCopy"   maxlength="13"   class=" phone required" /></c:if>
						 <c:if test="${uptState eq '1'}"><input type="text" name="staffPhone" value="${escrow.staffPhone}"  maxlength="13"  class=" phone required"  readonly="readonly"  /></c:if>
					</dd>
				</dl>
		</div>
		<div  class="pageFormContent" >
				<dl>
					<dt>员工身份证：</dt>
					<dd>
						<c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text"  id="staffIdcard"  name="staffIdcard" value="${escrow.staffIdcard}"  class="required"  /></c:if>
						<c:if test="${uptState eq '1'}"><input type="text" name="staffIdcard" value="${escrow.staffIdcard}"  class="required"  readonly="readonly" /></c:if>
					</dd>
				</dl>
	             <dl>
					<dt>员工身份证：</dt>
					<dd>
						<c:if test="${uptState eq '0'||uptState eq '-1'}"><input type="text"   id="staffIdcardCopy"  alt ="再次输入员工身份证" name="staffIdcardCopy"  class="required"  /></c:if>
						<c:if test="${uptState eq '1'}"><input type="text" name="staffIdcard" value="${escrow.staffIdcard}"  class="required"  readonly="readonly" /></c:if>
					</dd>
				</dl>
		</div>
		<div class="pageFormContent"  style="height: 80px">
			<dl>
				<dt>简介：</dt>
				<dd>
					  <textarea  rows="4" cols="60"  name="brief"   class="required"   >${escrow.brief}</textarea>
				</dd>
			</dl>
		</div>
		<div class="pageFormContent"  style="height: 80px">
			<dl>
				<dt>发展历史：</dt>
				<dd>
					  <textarea  rows="4" cols="60"  name="history"   class="required"   >${escrow.history}</textarea>
				</dd>
			</dl>
				</div>
		<div class="pageFormContent"  style="height: 80px">
			<dl>
				<dt>管理团队：</dt>
				<dd>
					  <textarea  rows="4" cols="60"  name="team"   class="required"   >${escrow.team}</textarea>
				</dd>
			</dl>
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
