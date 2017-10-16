<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#shopList-search-panel span.om-combo,#shopList-search-panel span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/shopManager/shopListInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shopList-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchShopListForm">		   			
			   			<span class="label">状态：</span>
			   			<input name="state" id="search-prostate" />
			   				<span class="label">发布时间：</span>
			   			<input type="text" id="createTimeList" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesList" style="width: 88px;"  name="teamProfiles" class="input-text"/>		
			   			<span id="shopList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="add"  id="financingSuccess"><span>融资成功</span></a></li>
		    <li class="line">line</li>
		    <li><a class="add"  id="bidShopFull"><span>放款</span></a></li>
		    <li class="line">line</li>
		    <li><a class="add"  id="flowShop"><span>流标</span></a></li>
		
		</ul>
	</div>
	<table id="myGridShopList"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
			     <a class="icon" id="getShopRecordState"><span>获取投资记录状态</span> </a>
			</li>
		</ul>
	</div>
	<table id="myRecord"></table>
	<div id="shopList-tab">
		<ul>
			<li><a id="shopList" href="javascript:void(0);">店铺信息</a></li>
			<li><a id="shopFileList" href="javascript:void(0);">店铺资料</a></li>
			<li><a id="shopRewardOptionLIst" href="javascript:void(0);">融资信息</a></li>
		</ul>

		<div id="shopListInfo">
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