<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerPlank-search-panel span.om-combo,
	#customerPlank-search-panel  span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/costomer/customerPlank.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerPlank-search-panel">
		<div>
			<form action="" method="post" id="customerPlankListSearchFrom">
				<span class="label">投资时间：</span> <input  name="authIpsTime" id="start-time-plank" readonly="readonly"  style="width: 118px" />
                <span class="label">至：</span> <input name="createTime" id="end-time-plank" readonly="readonly"   style="width: 118px" /> 
                <span class="label">搜索类型：</span>		   		
			   	<input  name="userType" id="customerPlanKCom" />
                <span  id="customerPlankList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" id="outCustomerPlank"><span>导出</span> </a></li>
		</ul>
	</div>
	<table id="customerPlank"></table>
</div>