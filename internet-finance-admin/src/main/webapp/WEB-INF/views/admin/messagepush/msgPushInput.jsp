<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<!-- <script type="text/javascript" src="/resources/js/pushmessage/addMsg.js"></script> -->
<div class="pageContent">
	<form id="form1" action="/msgPush/pushMsg" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone, '确定推送消息？')" >
		<div class="pageFormContent" layoutH="56">
			<div style="width:600px; margin:0 auto;">
				<div style="width:100%; float: left; margin-top: 10px;">
					<p>
						<label>推送目标</label>
						<select name="pushTo">
					 		<option value="1">全部注册用户</option>
					 		<option value="2">已认购用户</option>
					 		<option value="3">已宝付授权未认购</option>
					 		<option value="4">女性用户</option>
					 		<option value="5">男性用户</option>
					 		<option value="6">当日生日客户</option>
						</select>
					</p>
				</div>
				<div style="width:100%; float: left; margin-top: 10px;">
					<p>
						<label>推送方式</label>
						<select name="pushNow">
					 		<option value="1">立即推送</option>
						</select>
					</p>
				</div>
				<div style="width:100%; float: left; margin-top: 10px;">
					<p style="width:435px;">
						<label>消息标题</label>
						<input style="width: 200px;" class="required" maxlength="15" type="text" name="title" id="title"/>
						<span class="info">(最多20个字)</span>
					</p>
				</div>
				<div style="width:100%; float: left; margin-top: 10px;">
					<p style="width:435px;">
						<label>消息内容</label>
						<textarea name="content" id="content" style="width: 200px;" class="required" cols="50" maxlength="50" rows="3"/>
						<span class="info">(最多50个字)</span>
					</p>
				</div>
			</div>
		</div>
		
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit" id="submit">推送</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>