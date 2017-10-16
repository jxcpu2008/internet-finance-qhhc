<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerRegister-search-panel span.om-combo,
	#customerRegister-search-panel  span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/costomer/customerRegister.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerRegister-search-panel">
		<div>
			<form action="" method="post" id="customerRegisterListSearchFrom">
				<span class="label">注册时间：</span> <input  name="authIpsTime" id="start-time-register" readonly="readonly"  style="width: 118px" />
                <span class="label">至：</span> <input name="createTime" id="end-time-register" readonly="readonly"   style="width: 118px" /> 
                <span class="label">搜索类型：</span>		   		
			   	<input  name="userType" id="customerRegisterCom" />
                <span  id="customerRegisterList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" id="outCustomerRegister"><span>导出</span> </a></li>
		</ul>
	</div>
	<table id="customerRegister"></table>
</div>