<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#shop-search-panel span.om-combo,#shop-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/shopManager/shopAudit.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shop-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchShopForm">		   	
		   				<span class="label">待审批时间：</span>
			   			<input type="text" id="createTimeAudit" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesAudit" style="width: 88px;"  name="teamProfiles" class="input-text"/>		
			   			<span id="prostate-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="auditShop()"  id="auditShop"><span>审批通过</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="notAuditShop()" id="notAuditShop"><span>审批不通过</span></a></li>
		</ul>
	</div>

	<table id="myGridShop"></table>
	<div id="autid-tab">
		<ul>
			<li><a id="shopInfo" href="javascript:void(0);">店铺信息</a></li>
			<li><a id="shopFileInfo" href="javascript:void(0);">店铺资料</a></li>
			<li><a id="shopRewardOptionInfo" href="javascript:void(0);">融资信息</a></li>
		</ul>
		<div id="shopAudit">
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