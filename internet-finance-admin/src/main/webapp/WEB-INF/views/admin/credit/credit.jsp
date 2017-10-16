
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#myloanlist-search-panel span.om-combo,#myloanlist-search-panel span.om-calendar {
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

.sms_ctx table tr td, .sms_cre table tr td {
	 height: 40px;
}
</style>
<script type="text/javascript" src="/resources/js/credit/credit.js"></script>
<div style="overflow-y: scroll; height: 650px;">
	<div class="sms_ctx">
		<form action="" method="post" id="myloanlistsearchfrom">
			<table style="margin-left: 30px; margin-top: 20px;">
				<tr>
					<td width="100px"><span class="label">渠道选择</span></td>
					<td width="330px" colspan="2"><input name="chnlId" id="typeChannel" /></td>
					<td width="10px"><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td><span class="label">姓名</span></td>
					<td colspan="2"><input name="name" id="name" type="text" class="input-text" style="width: 195px;" /></td>
					<td><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td><span class="label">证件号</span></td>
					<td><input name="idType" id="issueLoanfind" />&nbsp;&nbsp;</td>
					<td><input name="idNo" id="idNo" type="text" class="input-text" /></td>
					<td><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td><span class="label">手机号码</span></td>
					<td colspan="2"><input name="mobileNo" id="mobileNo" type="text" class="input-text" style="width: 195px;" /></td>
					<td><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td><span class="label">银行卡号</span></td>
					<td colspan="2"><input name="cardNo" id="cardNo" type="text" class="input-text" style="width: 195px;" /></td>
					<td><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td><span class="label">查询原因</span></td>
					<td colspan="2"><input name="reasonNo" id="recommendfind" /></td>
					<td><span style="color:red;">*</span></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="2"><span id="myloanlist-button-search">查询</span></td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<!-- 
			<span class="label">渠道选择</span>&nbsp;&nbsp;&nbsp;
			<input name="chnlId" id="typeChannel" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label">姓名</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="name" type="text" class="input-text" style="width: 195px;" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label">证件号</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="idType" id="issueLoanfind" />
			<input name="idNo" type="text" class="input-text" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label">手机号码</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="mobileNo" type="text" class="input-text" style="width: 195px;" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label">银行卡号</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="cardNo" type="text" class="input-text" style="width: 195px;" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label">查询原因</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="reasonNo" id="recommendfind" />
			<span style="color:red;">*</span>
			<br/><br/>
			<span class="label"></span>		   		
			<span id="myloanlist-button-search">查询</span>
			 -->
		</form>
	</div>
	<div class="sms_cre" style="margin-top: 20px; margin-left: 100px;">
		<table style="ppadding 8px;">
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
			<th colspan="4">前海征信查询结果</th>
			<tr>
				<td>黑名单:</td>
				<td id="blachList"></td>
				<td>可度分:</td>
				<td id="credooScore"></td>
			</tr>
			<tr>
				<td>金融需求评分:</td>
				<td id="finRequireScore"></td>
				<td>行业数据评分:</td>
				<td id="actionScore"></td>
			</tr>
			<tr>
				<td>还款能力评分:</td>
				<td id="payAbilityScore"></td>
				<td>虚拟资产评分:</td>
				<td id="virAssetScore"></td>
			</tr>
			<tr>
				<td>信用履约评分:</td>
				<td id="performScore"></td>
				<td>成长性评分:</td>
				<td id="trendScore"></td>
			</tr>
		</table>
	</div>
</div>