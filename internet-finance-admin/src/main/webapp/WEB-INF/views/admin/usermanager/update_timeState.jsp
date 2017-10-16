<%--    
创建时间：2014年1月27日下午2:01:33   
创 建 人：frank   
相关说明：   修改会员信息页面
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/usermanager/user_timeState.js"></script>
<div class="pageContent">
<form method="post" action="<%=basePath %>userinfo/ipsSelTimeUser.htm"   class="pageForm required-validate"   onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageFormContent" layoutH="50">
			<p>
				<label>注册起始时间：</label>
				<input  type="text" name="startTimeState"    id="start-timeState" class="required"/> 
			</p>
			<p>
				<label>结束时间：</label>
				<input  type="text" name="endTimeState"  id="end_timeState" class="required" />
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

