<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerGRegister-search-panel span.om-combo,
	#customerGRegister-search-panel  span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/costomer/customerGRegister.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerGRegister-search-panel">
		<div>
			<form action="" method="post" id="customerGRegisterListSearchFrom">
				<span class="label">注册时间：</span> <input  name="authIpsTime" id="start-time-registerG" readonly="readonly"  style="width: 118px" />
                <span class="label">至：</span> <input name="createTime" id="end-time-registerG" readonly="readonly"   style="width: 118px" /> 
                <span class="label">搜索类型：</span>		   		
			   	<input  name="userType" id="customerGRegisterCom" />
                <span  id="customerGRegisterList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" id="outCustomerGRegister"><span>导出</span> </a></li>
		</ul>
	</div>
	<table id="customerGRegister"></table>
</div>