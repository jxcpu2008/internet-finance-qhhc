<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerGPlank-search-panel span.om-combo,
	#customerGPlank-search-panel  span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/costomer/customerGPlank.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerGPlank-search-panel">
		<div>
			<form action="" method="post" id="customerGPlankListSearchFrom">
				<span class="label">投资时间：</span> <input  name="authIpsTime" id="start-time-plankG" readonly="readonly"  style="width: 118px" />
                <span class="label">至：</span> <input name="createTime" id="end-time-plankG" readonly="readonly"   style="width: 118px" /> 
                <span class="label">搜索类型：</span>		   		
			   	<input  name="userType" id="customerGPlanKCom" />
                <span  id="customerGPlankList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" id="outCustomerGPlank"><span>导出</span> </a></li>
		</ul>
	</div>
	<table id="customerGPlank"></table>
</div>