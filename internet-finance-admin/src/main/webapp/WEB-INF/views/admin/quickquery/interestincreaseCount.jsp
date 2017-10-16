<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/interestincreaseCount.js"></script>
<style>
	#interestincreaseCount-search-panel {vertical-align: middle;}
</style>
<div id="interestincreaseCount-search-panel">
	<div>
		<form method="post" id="interestincreaseCountSearchForm">		
			<span class="label">发放渠道：</span>
			<select name="sourceType" style="float: none;width: 100px" id="sourceTypeInterestincrease" >
				<option value="0">全部</option>
				<option value="1">投资</option>
				<option value="2">注册</option>
				<option value="3">奖励</option>
				<option value="4">抽奖</option>
			</select>
			<span class="label">注册端口：</span>
			<select name="useFlag" style="float: none;width: 100px" id="useFlagInterestincrease" >
				<option value="0">全部</option>
				<option value="1">PC</option>
				<option value="2">H5</option>
				<option value="8">android</option>
				<option value="9">ios</option>
			</select>
			<span class="label">发放时间：</span>
			<input name="beginTime"  id="beginTimeInterestincrease" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="endTime" id="endTimeInterestincrease" readonly="readonly" style="width: 100px" />
			<br/><br/>
		    <span class="label">加息券点数：</span>		   		
			<input type="text"  name="interestRate" class="input-text" id="interestRateInterestincrease"  style="width: 100px"/>   
			 <span class="label">手机号码：</span>		   		
			<input type="text"  name="loanrecordId" class="input-text" id="loanrecordIdInterestincrease"  style="width: 100px"/>   
			<span class="label">使用时间：</span>
			<input name="receiveTime"  id="receiveTimeInterestincrease"  readonly="readonly"  style="width: 100px" />
			<span class="label">至：</span>
			<input name="consumeTime" id="consumeTimeInterestincrease" readonly="readonly" style="width: 100px" />
			<span id="interestincreaseCount-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="interestincreaseCountCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<div style="overflow-y: scroll; height: 350px">
		<hr style="color: #ccc;">
		<div>
			<span style="padding: 4px 20px; font-size: 18px;">发放加息券总人数(人)：</span><b id="distinctIntCardCount"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">发放加息券总点数：</span><b id="intCardSumMoney"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">发放加息券总张数(张)：</span><b id="intCardCount"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用加息券总张数(张)：</span><b id="intCardCountOne" 
			    style="font-size: 20px; color: red;"></b>
			 <span style="padding: 4px 100px; font-size: 18px;">使用加息券总点数：</span><b id="intCardSumMoneyOne"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用加息券认购人数(人)：</span><b id="distinctLoanIntCardCount"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 100px; font-size: 18px;">使用加息券投资总订单数(笔)：</span><b id="intCardCountTenderMoney"
				style="font-size: 20px; color: red;"></b>
			<span style="padding: 4px 60px; font-size: 18px;">使用加息券总投资金额(元)：</span><b id="intCardSumTenderMoney"
				style="font-size: 20px; color: red;"></b>
 			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用加息券的投资金额占时间段内所有投资的占比(%)：</span><b id="tenderMoneyIntCardProportion"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用加息券认购人数占时间段内认购人数的占比(%)：</span><b id="loanrecordIntCardProportion"
				style="font-size: 20px; color: red;"></b>
			<br/><br/><br/>
			<span style="padding: 4px 20px; font-size: 18px;">使用加息券投资订单数占时间段内投资订单数的占比(%)：</span><b id="loanCountIntCardProportion"
				style="font-size: 20px; color: red;"></b>
		</div>
	</div>
	<table id="interestincreaseCountGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>