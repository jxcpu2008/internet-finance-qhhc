<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action="demo/common/ajaxDone.html"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this)">
	<div class="pageContent">
		<div class="pageFormContent sortDrag">
			<dl>
				<dt>融资金额：</dt>
				<dd>
					<input readonly="readonly" value="${shopRewardOption.shop.raiseFunds}" type="text">
				</dd>
			</dl>
			<dl>
				<dt>项目方出资：</dt>
				<dd>
					<input readonly="readonly" value="${shopRewardOption.shop.selfFunds}"
						type="text" />
				</dd>
			</dl>
			<dl>
				<dt>出资比例：</dt>
				<dd>
					<input readonly="readonly" value="${shopRewardOption.shop.bis}"
						type="text" />
				</dd>
			</dl>
		</div>	
	<div class="pageFormContent sortDrag" >		
			<dl>
				<dt>奖励金额：</dt>
				<dd>
					<input type="text"
						value="${shopRewardOption.money}"
						readonly="readonly" />
				</dd>
			</dl>
			<dl>
				<dt>奖励时间：</dt>
				<dd>
					<input type="text" size="10" value="${shopRewardOption.awardTime}"
						readonly="readonly" />  天后
				</dd>
			</dl>
		</div>	
	<div class="pageFormContent sortDrag" style="height: 200px">	
			<dl>
				<dt>奖励说明：</dt>
				<dd>
					<textarea  rows="10" cols="60"
						readonly="readonly" >${shopRewardOption.remark}</textarea>
				</dd>
			</dl>
			</div>
	<div class="pageFormContent sortDrag" style="height: 200px">			
			<dl>
				<dt>开店计划：</dt>
				<dd>
					<textarea  rows="10" cols="60"
						readonly="readonly" >${shopRewardOption.shop.plan}</textarea>
				</dd>
			</dl>
		</div>
	</div>
</form>
