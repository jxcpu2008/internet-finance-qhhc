<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h2 class="contentTitle">费用比列设置</h2>

<div class="pageFormContent" layoutH="60" style="height: 400px;">
	<form action="/expenseRatio/add.htm" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input name="id" type="hidden" value="${costratio.id}" /> 
		<fieldset>
			<legend>充值费用</legend>
			<dl>
			<dt>手续费收取方式：</dt>
			<dd>
				<select name="rechargeMethod">
					<option 
					      <c:if test="${costratio.rechargeMethod==1}">
					            selected="selected"
					</c:if>
				        	value="1">平台支付</option>
					<option value="2"
					      <c:if test="${costratio.rechargeMethod==2}">
				         	selected="selected"
					     </c:if>
					  >用户支付</option>
				</select>
			</dd>
		</dl>
		<dl></dl>
		<dl></dl>
			<dl>
				<dt>会员：</dt>
				<dd>
					<input class="required number" name="recharge" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.recharge*100}"/>" />%
				</dd>
			</dl>
		</fieldset>
		<fieldset>
			<legend>提现费用</legend>
					<dl>
						  <dt>手续费收取方式：</dt>
						   <dd>
								<select name="withdrawMethod">
									<option   value="1" <c:if test="${costratio.withdrawMethod==1}"> selected="selected"</c:if>>平台支付</option>
							        <option value="2" <c:if test="${costratio.withdrawMethod==2}">   selected="selected" </c:if>>用户支付</option>
						</select>
					</dd>
			    </dl>
			<dl></dl>
			<dl></dl>
			<dl>
				<dt>会员：</dt>
				<dd>
					<input class="required number" name="withdraw" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.withdraw}"/>" />&nbsp;/笔
				</dd>
			</dl>
         <dl>	
              <dt>平台收取手续费</dt>
				<dd>
				    <input class="required number" name="withdrawRate" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.withdrawRate*100}"/>" />%
				</dd>
		</dl>
		<dl>	
              <dt>提现收费起始时间</dt>
				<dd>
				    <input class="required number" name="timeDate"  type="text"  value="${costratio.timeDate}" / >yyyymmdd
				</dd>
		</dl>
		</fieldset>		
		<fieldset>		
			<legend>投资手续费</legend>
					<dl>
						  <dt>投资手续费：</dt>
						   <dd>
					<input class="required number" name="loanInvestment" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.loanInvestment*100}"/>" />%
					</dd>
			    </dl>	
				<dl>
				<dt>股权手续费：</dt>
				<dd>
					<input class="required number" name="conveyFee" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.conveyFee*100}"/>" />%
				</dd>
			</dl>			    		
		</fieldset>

		<fieldset>
			<legend>违约金(借款人)</legend>
			<dl>
				<dt>逾期还款利率：</dt>
				<dd>
					<input class="required number" name="overdueRepayment" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.overdueRepayment*100}"/>" />%
				</dd>
			</dl>
			<dl>
				<dt>等本等息逾期利率：</dt>
				<dd>
					<input class="required number" name="matchingInterest" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.matchingInterest*100}"/>" />%
				</dd>
			</dl>
		</fieldset>
		<fieldset>
			<legend>分批分红人数</legend>
			<dl>
				<dt>分批分红人数：</dt>
				<dd>
					<input class="required number" name="repayNum" type="text"  value="${costratio.repayNum}" />
				</dd>
			</dl>
		</fieldset>
		<fieldset>
			<legend>项目费用</legend>
			<dl>
				<dt>众持借款人手续费：</dt>
				<dd>
					<input class="required number" name="borrowerFee" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.borrowerFee*100}"/>" />%
				</dd>
			</dl>	
			<dl></dl>
			<dl></dl>			
				<dl>
				<dt>优先利息管理费：</dt>
				<dd>
					<input class="required number" name="prioInvest" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.prioInvest*100}"/>" />%
				</dd>
			</dl>
			<dl>
				<dt>夹层分红管理费：</dt>
				<dd>
					<input class="required number" name="midInvest" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.midInvest*100}"/>" />%
				</dd>
			</dl>
			<dl>
				<dt>劣后分红管理费：</dt>
				<dd>
					<input class="required number" name="afterInvest" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.afterInvest*100}"/>" />%
				</dd>
			</dl>
		
		</fieldset>
		<fieldset>
			<legend>店铺费用</legend>
			<dl>
				<dt>店铺融资服务费：</dt>
				<dd>
					<input class="required number" name="shopOwerFee" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.shopOwerFee*100}"/>" />%
				</dd>
			</dl>			
			<dl>
				<dt>分红手续费：</dt>
				<dd>
					<input class="required number" name="shopDividends" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.shopDividends*100}"/>" />%
				</dd>
				</dl>
		</fieldset>
		<fieldset>
			<legend>第三方担保费用</legend>
			<dl>
				<dt>管理费比例：</dt>
				<dd>
					<input class="required number" name="voucherFee" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.voucherFee*100}"/>" />%
				</dd>
			</dl>
		</fieldset>
	  <fieldset>
			<legend>第三方担保充值费用</legend>
				<dl>
						<dt>手续费收取方式：</dt>
						<dd>
							<select name="escrowRechargeMethod">
								<option 
								      <c:if test="${costratio.escrowRechargeMethod==1}">
								            selected="selected"
								</c:if>
							        	value="1">平台支付</option>
								<option value="2"
								      <c:if test="${costratio.escrowRechargeMethod==2}">
							         	selected="selected"
								     </c:if>
								  >用户支付</option>
							</select>
						</dd>
			   </dl>
		<dl></dl>
		<dl></dl>
			<dl>
				<dt>手续费：</dt>
				<dd>
					<input class="required number" name="escrowRecharge" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.escrowRecharge*100}"/>" />%
				</dd>
			</dl>
		</fieldset>
		<fieldset>
			<legend>第三方担保提现费用</legend>
					<dl>
						  <dt>手续费收取方式：</dt>
						   <dd>
								<select name="escrowWithdrawMethod">
									<option   value="1" <c:if test="${costratio.escrowWithdrawMethod==1}"> selected="selected"</c:if>>平台支付</option>
							        <option value="2" <c:if test="${costratio.escrowWithdrawMethod==2}">   selected="selected" </c:if>>用户支付</option>
						</select>
					</dd>
			    </dl>
			<dl></dl>
			<dl></dl>
			<dl>
				<dt>手续费：</dt>
				<dd>
					<input class="required number" name="escrowWithdraw" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.escrowWithdraw}"/>" />&nbsp;/笔
				</dd>
			</dl>
		</fieldset>	
	   <fieldset>
			<legend>夹层利率</legend>
			<dl>
				<dt>夹层利率：</dt>
				<dd>
					<input class="required number" name="middleRate" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.middleRate*100}"/>" />%
				</dd>
			</dl>
		</fieldset>	
	    <fieldset>
			<legend>满标短信通知(用小写逗号,隔开)</legend>
			<dl>
				<dt>满标短信通知：</dt>
				<dd>
					<input class="required " name="bidPhone" type="text"value="${costratio.bidPhone}" />&nbsp;
				</dd>
			</dl>
		</fieldset>
		<fieldset>
			<legend>清盘天数</legend>
			<dl>
				<dt>清盘天数：</dt>
				<dd>
					<input class="required number" name="windingNum" type="text"value="${costratio.windingNum}" />&nbsp;天
				</dd>
			</dl>
		</fieldset>
	  <fieldset>
			<legend>推广奖励提成(按年利率计)</legend>
			<dl>
				<dt>基金经理</dt>
				<dd>
					<input class="required number" name="business" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.business*100}"/>" />%;
				</dd>
			</dl>
			<dl>
				<dt>普通会员</dt>
				<dd>
					<input class="required number" name="member" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.member*100}"/>" />%;
				</dd>
			</dl>
			<dl>
				<dt>红筹理财师</dt>
				<dd>
					<input class="required number" name="financial" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.financial*100}"/>" />%;
				</dd>
			</dl>			
			<dl>
				<dt>会员注册送现金</dt>
				<dd>
					<input class="required number" name="regBonu" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.regBonu}"/>" />;
				</dd>
			</dl>			
		</fieldset>
		<fieldset>
			<legend>其它费用</legend>
			<dl>
				<dt>升级VIP：</dt>
				<dd>
					<input class="required number" name="vipUpgrade" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.vipUpgrade}"/>" />&nbsp;元
				</dd>
			</dl>
			<dl>
				<dt>实名认证费用</dt>
				<dd>
					<input class="required number" name="nameAuth" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.nameAuth}"/>" />&nbsp;元/次
				</dd>
			</dl>	
		</fieldset>
	<fieldset>
			<legend>普通用户佣金启用标识：</legend>
					<dl>
						  <dt>启用标识：</dt>
						   <dd>
								<select name="generalizeState">
									<option   value="1" <c:if test="${costratio.generalizeState==1}"> selected="selected"</c:if>>开</option>
							        <option value="2" <c:if test="${costratio.generalizeState==2}">   selected="selected" </c:if>>关</option>
						</select>
					</dd>
			    </dl>
			    <dl>
				<dt>至7月31号奖励开关：</dt>
						   <dd>
								<select name="bonusState">
									<option   value="1" <c:if test="${costratio.bonusState==1}"> selected="selected"</c:if>>开</option>
							        <option value="2" <c:if test="${costratio.bonusState==2}">   selected="selected" </c:if>>关</option>
						</select>
					</dd>
			    </dl>
		</fieldset>
		<fieldset>
		<legend>奖励红包</legend>
			    <dl>
				 <dt>奖励红包开关：</dt>
						   <dd>
								<select name="redState">
									<option   value="1" <c:if test="${costratio.redState==1}"> selected="selected"</c:if>>开</option>
							        <option value="2" <c:if test="${costratio.redState==2}">   selected="selected" </c:if>>关</option>
						</select>
					</dd>
			    </dl>
				<dl>	
              <dt>活动起始时间：</dt>
				<dd>
				    <input class="required number" name="starTime"  type="text"  value="${costratio.starTime}" / >yyyymmdd
				</dd>
		      </dl>
		      <dl>	
              <dt>活动结束时间：</dt>
				<dd>
				    <input class="required number" name="endTime"  type="text"  value="${costratio.endTime}" / >yyyymmdd
				</dd>
		      </dl>
		</fieldset>	
		<fieldset>
			<legend>红筹币利率</legend>
				<dl>
				<dt>红筹币利率：</dt>
				<dd>
					<input class="required number" name="hccoinRate" type="text"
						value="<fmt:formatNumber pattern="0.00" value="${costratio.hccoinRate*100}"/>" />%
				</dd>
			</dl>	
			<dl></dl>
		</fieldset>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="reset" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
