<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#shopState-search-panel span.om-combo,#shopState-search-panel span.om-calendar {
	vertical-align: middle;
}
.unit {
	clear: both;
	text-align: left;
}
.unit label {
	text-align: right;
	float: left;
	width: 100px;
}
.unit textarea {
	width: 280px;
	height: 5em;
}
</style>
<script type="text/javascript" src="/resources/js/shopManager/shopState.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shopState-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchShopStateForm">		   	
		   				<span class="label">申请提现时间：</span>
			   			<input type="text" id="createTimeState" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesState" style="width: 88px;"  name="teamProfiles" class="input-text"/>		
			   			<span id="shopState-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>

	<table id="myGridShopState"></table>
	<div id="shopState-tab">
		<ul>
			<li><a id="shopInfoState" href="javascript:void(0);">店铺状态信息</a></li>
		</ul>
		<div id="shopState">
			<table>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</div>