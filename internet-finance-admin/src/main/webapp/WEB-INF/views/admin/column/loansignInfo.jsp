<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.p_div_01 {
	width: 20%;
	float: left;
	margin-top: 10px;
	margin-left: 10%;
}
</style>
<h2 class="contentTitle">项目众持详细信息</h2>
<div class="pageContent" >
	<div class="pageFormContent"   layoutH="56" >
		<div class="p_div_01">
			<p>
				<label>借款人：</label> <span>${loan.userbasicsinfo.name}</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>项目名称：</label> <span>${loan.name}</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>项目编号：</label> <span>${loan.contractNo}</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>企业成立时间：</label> <span>${loan.loansignbasics.enteruptime1}年${loan.loansignbasics.enteruptime2}月</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>公司所在城市：</label> <span>${loan.loansignbasics.city}</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>办公地址：</label> <span>${loan.loansignbasics.address}</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>项目总额：</label> <span>${loan.issueLoan}元</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>剩余金额：</label> <span>${loan.restMoney}元</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>最低投资金额：</label> <span>${loan.loanUnit} 元</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>债权转让：</label> <span>${loan.outDay}个月</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>还款类型：</label> <span> <c:if test="${loan.refunway==1}">按月还款</c:if>
					<c:if test="${loan.refunway==2}">按季还款</c:if><c:if test="${loan.refunway==3}">按天还款</c:if><c:if test="${loan.refunway==4}">等本等息还款</c:if>
				</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>服务费收取：</label> <span> <c:if test="${loan.feeMethod==1}">本金中扣除</c:if>
					<c:if test="${loan.feeMethod==2}">额外支付</c:if><c:if test="${loan.feeMethod==0}">初始值0</c:if>
				</span>
			</p>
		</div>
		<div class="p_div_01">
			<p>
				<label>回购期限：</label> 
				<span> <c:if test="${loan.refunway==3}">${loan.remonth}天</c:if>
					<c:if test="${loan.type==2 }">${loan.remonth}个月</c:if>
				</span>
			</p>
		</div>
				<div class="p_div_01">
			<p>
				<label>放款日期：</label> 
				<span> 
					${loan.creditTime}
				</span>
			</p>
		</div>
			<div class="p_div_01">
			<p>
				<label>第三方担保：</label> <span>${loan.escrow.name}</span>
			</p>
		</div>
	   <div class="p_div_01">
			<p>
				<label>活动状态：</label> <span> <c:if test="${loan.activityStatus==1}">参与</c:if>
					<c:if test="${loan.activityStatus==0}">不参与</c:if>
				</span>
			</p>
		</div>
		<div class="p_div_01" style="width: 75%">
			<fieldset>
				<legend>投资模式</legend>
				<dl>
					<dt>借款利率：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.realRate}" pattern="0.00%"/></span>
					</dd>
				</dl>
				<dl>
					<dt>平台服务费年利率：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.companyFee}" pattern="0.00%"/></span>
					</dd>
				</dl>
				<dl>
					<dt>优先：</dt>
					<dd>
						<span>${loan.priority}元</span>
					</dd>
				</dl>
				<dl>
					<dt>优先剩余金额：</dt>
					<dd><span>${loan.prioRestMoney}元</span></dd>
				</dl>
				<dl>
					<dt>优先年利率：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.prioRate}" pattern="0.00%"/></span>
					</dd>
				</dl>
				<dl>
					<dt>奖励：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.prioAwordRate}" pattern="0.00%"/></span>
					</dd>
				</dl>
				<dl>
					<dt>夹层：</dt>
					<dd><span>${loan.middle}元</span></dd>
				</dl>
				<dl>
					<dt>夹层剩余金额：</dt>
					<dd><span>${loan.midRestMoney}元</span></dd>
				</dl>
				<dl>
					<dt>夹层百分比：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.midRate}" pattern="0.00%"/></span>
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<span></span>
					</dd>
				</dl>
				<dl>
				<dt>劣后：</dt>
					<dd>${loan.after}元</dd>
				</dl>
				<dl>
					<dt>劣后剩余金额：</dt>
					<dd>${loan.afterRestMoney}元</dd>
				</dl>
				<dl>
					<dt>劣后百分比：</dt>
					<dd>
						<span><fmt:formatNumber value="${loan.afterRate}" pattern="0.00%"/></span>
					</dd>
				</dl>
					<dl>
					<dt></dt>
					<dd>
						<span></span>
					</dd>
				</dl>
				<dl>
					<dt>红包使用总金额：</dt>
					<dd>
						<span>${loan.redEnvelopeMoney} 元</span>
					</dd>
				</dl>
				<dl>
				</dl>
			</fieldset>
		</div>
		<div class="p_div_01" style="width: 75%">
		<c:forEach  items="${listMsg}" var="listMsg">
		<c:if test="${listMsg.type==1}">
			<fieldset>
					<legend>客户基本信息</legend>
							<div class="p_div_01">
							<p>
								<label>接收人姓名：</label> <span>${listMsg.receiverName}</span>
							</p>
			        </div>
			        <div class="p_div_01">
							<p>
								<label>接收人手机：</label> <span>${listMsg.receiverPhone}</span>
							</p>
			        </div>
			        <div class="p_div_01">
							<p>
								<label>接收人邮箱：</label> <span>${listMsg.receiverEmail}</span>
							</p>
			        </div>
			</fieldset>
		</c:if>
		<c:if test="${listMsg.type==2}">
			<fieldset>
					<legend>项目消息提醒人</legend>
					<div class="p_div_01">
							<p>
								<label>提醒人姓名：</label> <span>${listMsg.receiverName}</span>
							</p>
			        </div>
			        <div class="p_div_01">
							<p>
								<label>提醒人手机：</label> <span>${listMsg.receiverPhone}</span>
							</p>
			        </div>
			        <div class="p_div_01">
							<p>
								<label>提醒人邮箱：</label> <span>${listMsg.receiverEmail}</span>
							</p>
			        </div>
			</fieldset>
		</c:if>
		</c:forEach>
		</div>
		<div class="p_div_01" style="width: 75%;">
			<p style="clear: both; height: 200px; width: 100%">
				<label>项目简介</label>
				<textarea name="remarkLoan"   rows="10" cols="80">${loan.loansignbasics.remark}</textarea>
			</p>
		</div>
		<div class="p_div_01" style="width: 75%;">
			<p style="clear: both; height: 200px; width: 100%">
				<label>借款方借款用途</label>
				<textarea  rows="10" cols="80" name="behoofLoan">${loan.loansignbasics.behoof}</textarea>
			</p>
		</div>
		<div class="p_div_01" style="width: 75%;">
			<p style="clear: both; height: 200px; width: 100%">
				<label>风控措施</label>
				<textarea rows="10" cols="80" name="historyLoan">${loan.loansignbasics.history}</textarea>
			</p>
		</div>
	</div>
</div>
