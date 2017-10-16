<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#escrow-search-panel span.om-combo,#escrow-search-panel span.om-calendar {
	vertical-align: middle;
}
</style>
<script type="text/javascript" src="/resources/js/escrow/escrow.js"></script>
<div layoutH="0" class="pageContent">
	<div id="escrow-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchEscrowForm">		   	
			   				<span class="label">担保公司名称：</span>
				   			<input type="text" name="name" class="input-text" />
				   			<span class="label">身份证号：</span>
				   			<input type="text" name="staffIdcard" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
				   			 <span class="label">员工手机：</span>
				   			<input type="text" name="staffPhone" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
			   			<span id="escrow-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		   <li><a class="add" onclick="javascript:void(0);"  id="addEscrow"><span>新增</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="javascript:void(0);"  id="uptEscrow"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="registerEscrow()"  id="registerEscrow"><span>注册宝付</span></a></li>
			<li class="line">line</li>
				<li><a class="add" onclick="selInAccredit()"  id="selInAccredit"><span>宝付授权</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="selEscrowMoney()"  id="selEscrowMoney"><span>查询余额</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="selEscrowRecharge()"  id="selEscrowRecharge"><span>充值</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="selEscrowWithdraw()"  id="selEscrowWithdraw"><span>提现</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="selEscrowBank()"  id="selEscrowBank"><span>查询银行账号</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="delEscrow()"  id="delEscrow"><span>删除</span></a></li>
		</ul>
	</div>
	<table id="myGridEscrow" ></table>
</div>