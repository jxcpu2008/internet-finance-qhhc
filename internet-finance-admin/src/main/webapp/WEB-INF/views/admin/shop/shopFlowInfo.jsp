<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#shopFlow-search-panel span.om-combo,#shopFlow-search-panel span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/shopManager/shopFlowInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shopFlow-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchShopFlowForm">		   		
		   				<span class="label">流标时间：</span>
			   			<input type="text" id="createTimeFlow" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesFlow" style="width: 88px;"  name="teamProfiles" class="input-text"/>			
			   			<span id="shopFlow-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="add"  id="selFlowShop"><span>查询流标</span></a></li>
		    <li class="line">line</li>
		</ul>
	</div>
	<table id="myGridShopFlow"></table>
	<table id="myRecordFlow"></table>
	<div id="shopFlow-tab">
		<ul>
			<li><a id="shopFlow" href="javascript:void(0);">店铺信息</a></li>
			<li><a id="shopFileFlow" href="javascript:void(0);">店铺资料</a></li>
			<li><a id="shopRewardOptionFlow" href="javascript:void(0);">融资信息</a></li>
		</ul>

		<div id="shopFlowInfo">
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