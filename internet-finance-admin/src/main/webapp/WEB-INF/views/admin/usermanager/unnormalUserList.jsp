<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/usermanager/unnormalUserlist.js"></script>
<div id="user-search-panel">
	<div>
		<form action="" method="post" id="searchfrom">
			<span class="label">手机号码：</span> 
			<input type="text" name="phone" class="input-text" id="phone"/> 
			<span id="user-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" href="javascript:void(0);" id="queryRemoteUserInfo"><span>补录</span></a></li>
		</ul>
	</div>
	<table id="unnormal_user_list"></table>
</div>