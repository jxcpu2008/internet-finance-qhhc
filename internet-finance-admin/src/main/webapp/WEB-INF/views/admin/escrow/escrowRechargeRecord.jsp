<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#escrowRecharge-search-panel span.om-combo,#escrowRecharge-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/escrow/escrowRechargeRecord.js"></script>
<div layoutH="0" class="pageContent">
	<div id="escrowRecharge-search-panel">
		   			<div >
		   				<form action="" method="post" id="escrowRechargeListSearchFrom">		   			
			   				 <span class="label">担保公司名称：</span>
				   			<input type="text" name="name" class="input-text" />
				   			<span class="label">身份证号：</span>
				   			<input type="text" name="staffIdcard" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
				   			 <span class="label">员工手机：</span>
				   			<input type="text" name="staffPhone" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
				   			 <span class="label">充值状态：</span> 
				   			<input name="inAccredit" id="search-escrowRecharge" />
			   			<span id="escrowRechargeList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		      <li> <a class="add" id="selEscrowRechargeRecord"><span>查询充值</span> </a></li> 
				<li class="line">line</li>
		</ul>
	</div>
	<table id="myGridEscrowRecharge"></table>
</div>