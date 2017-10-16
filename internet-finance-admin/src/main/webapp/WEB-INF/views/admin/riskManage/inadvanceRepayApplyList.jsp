<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/riskManage/inadvanceRepayApplyList.js"></script>
<div id="user-search-panel">
	<div>
		<form action="" method="post" id="searchfrom">
			<span class="label">手机号码：</span> 
			<input type="text" name="phone" class="input-text" id="phone"/>
			<span class="label">姓名：</span> 
			<input type="text" name="name" class="input-text" id="name"/> 
			<span id="user-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" href="javascript:void(0);" id="approvalInadvanceRepay"><span>通过</span></a></li>
			<li><a class="edit" href="javascript:void(0);" id="refuseInadvanceRepay"><span>不通过</span></a></li>
		</ul>
	</div>
	<table id="inadvance_repay_list"></table>
</div>