<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/redenvelopedetailCount.js"></script>
<style>
	#redenvelopeDetailCount-search-panel {vertical-align: middle;}
</style>
<div id="redenvelopeDetailCount-search-panel">
	<div>
		<form method="post" id="redenvelopeDetailCountSearchForm">		
			<span class="label">发放渠道：</span>
			<select name="sourceType" style="float: none;width: 100px" id="sourceType" >
				<option value="0">全部</option>
				<option value="1">投资</option>
				<option value="2">注册</option>
				<option value="3">奖励</option>
				<option value="4">抽奖</option>
				<option value="5">老用户回馈</option>
				<option value="6">节日福利</option>
				<option value="7">补发奖励</option>
				<option value="8">登顶红包</option>
			</select>
			<span class="label">注册端口：</span>
			<select name="useFlag" style="float: none;;width: 100px" id="useFlag" >
				<option value="0">全部</option>
				<option value="1">PC</option>
				<option value="2">H5</option>
				<option value="8">android</option>
				<option value="9">ios</option>
			</select>
			<span class="label">发放时间：</span>
			<input name="beginTime"  id="beginTimeRedenvelope" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="endTime" id="endTimeRedenvelope" readonly="readonly" style="width: 100px" />
			<br/><br/>
		    <span class="label">红包金额：</span>		   		
			<input type="text"  name="money" class="input-text" id="money"  style="width: 100px"/>   
			 <span class="label">手机号码：</span>		   		
			<input type="text"  name="createTime" class="input-text" id="createTime"  style="width: 100px"/>   
			<span class="label">使用时间：</span>
			<input name="receiveTime"  id="receiveTimeRedenvelope"  readonly="readonly"  style="width: 100px" />
			<span class="label">至：</span>
			<input name="consumeTime" id="consumeTimeRedenvelope" readonly="readonly" style="width: 100px" />
			<span id="redenvelopeDetailCount-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="redenvelopeDetailCountCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<div style="overflow-y: scroll; height: 350px">
		<hr style="color: #ccc;">
		<div>
			<span style="padding: 4px 20px; font-size: 18px;">发放红包总人数(人)：</span><b id="distinctRedCount"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">发放红包总金额(元)：</span><b id="redSumMoney"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">发放红包总张数(张)：</span><b id="redCount"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用红包总张数(张)：</span><b id="redCountOne" 
			    style="font-size: 20px; color: red;"></b>
			 <span style="padding: 4px 100px; font-size: 18px;">使用红包总金额(元)：</span><b id="redSumMoneyOne"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用红包认购人数(人)：</span><b id="distinctLoanCount"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">使用红包投资总订单数(笔)：</span><b id="redCountTenderMoney"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 60px; font-size: 18px;">使用红包总投资金额(元)：</span><b id="redSumTenderMoney"
				style="font-size: 20px; color: red;"></b>
 			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用红包的投资金额占时间段内所有投资的占比(%)：</span><b id="tenderMoneyProportion"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用红包认购人数占时间段内认购人数的占比(%)：</span><b id="loanrecordProportion"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用红包投资订单数占时间段内投资订单数的占比(%)：</span><b id="loanCountProportion"
				style="font-size: 20px; color: red;"></b>
		</div>
	</div>
	<table id="redenvelopeDetailCountGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>