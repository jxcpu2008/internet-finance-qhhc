<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#liquidation-search-panel span.om-combo,#liquidation-search-panel span.om-calendar {
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

<script type="text/javascript" src="/resources/js/loanSign/liquidation.js"></script>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="inputLiquidationMoney" href="javascript:void(0);" height="350" width="520"><span>生成清盘记录</span></a></li>
			<li><a class="add" id="liquidation" href="javascript:void(0);" height="350" width="520"><span>清盘</span></a></li>
			
		</ul>
	</div>
	<table id="myliquidation"></table>
	<table id="myAttachment"></table>
</div>




