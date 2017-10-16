<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
 	
<form method="post" action="/loansigntype/edit" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
	<div class="pageContent">
			<div class="pageFormContent" style="height: 80px">	
			<dl>
			   <dt>项目类型Key：</dt>
				<dd>
				   <input type="text"  name="typeKey" value="${loansigntype.typeKey}"  class="required"  maxlength="20">(字母大写)
				    <input type="text" style="display: none;" name="id" value="${loansigntype.id}"/>
				</dd>
			</dl>
			<dl>
			   <dt>项目类型名称：</dt>
				<dd>
				   <input type="text"  name="typeName" value="${loansigntype.typeName}"  class="required"  maxlength="20">
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">确认</button>
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