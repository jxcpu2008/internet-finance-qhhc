<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
 .p_div_01{width:20%; float: left; margin-top: 10px; margin-left:10%;}
  .p_div_02{width:100%; float:left; margin-top: 10px; margin-left:10%;}
 </style>
 <script type="text/javascript">
 $(function(){
		/* 计算融资总额 */
		$('#priority,#sandwich,#afterBad').blur(function() {
					var priorityal = $('#priority').val();
					var sandwich = $('#sandwich').val();
					var afterBad = $('#afterBad').val();
					
					if (priorityal > 0 && sandwich > 0  &&  afterBad >0)
						$('#Loan_issueLoan').val(parseInt(priorityal)+parseInt(sandwich)+parseInt(afterBad));
					else
						$('#Loan_issueLoan').val(0);
				});
 })
 
 </script>
 
 <h2 class="contentTitle">项目众筹详细信息</h2>
<div class="pageContent" >
  <form action="/loanSign/updateLoangins" method="post"  class="pageForm required-validate"  onsubmit="return validateCallback(this, dialogAjaxDone)"> 
		<div class="pageFormContent" layoutH="56">
				<div class="p_div_01"><p>
				<label>借款人：</label>
					<span >${loan.userbasicsinfo.userName}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>项目名称：</label>
					<span >${loan.name}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>项目类型：</label>
					<span >
						<c:if test="${loan.loansignbasics.loanType==1}">酒店</c:if>
						<c:if test="${loan.loansignbasics.loanType==2}">能源</c:if> 
						<c:if test="${loan.loansignbasics.loanType==3}">文化产业</c:if>
					    <c:if test="${loan.loansignbasics.loanType==4}">互联网创新</c:if>
					    <c:if test="${loan.loansignbasics.loanType==5}">其他</c:if></span>
				</p></div>
				<div class="p_div_01"><p>
					<label>项目所属行业：</label>
						<span >${loan.loansignbasics.proindustry}
				    </span>
				</p></div>
					<div class="p_div_01"><p>
					<label>项目标签：</label>
						<span >${loan.loansignbasics.loanNumber}
				    </span>
				</p></div>
				<div class="p_div_01"><p>
					<label>项目所属阶段：</label>
					<span >
						<c:if test="${loan.loansignbasics.projectState==0}">未启动</c:if> 
						<c:if test="${loan.loansignbasics.projectState==1}">产品开发中</c:if> 
						<c:if test="${loan.loansignbasics.projectState==2}">产品已上市或已上线</c:if>
					    <c:if test="${loan.loansignbasics.projectState==3}">已经有收入</c:if>
					    <c:if test="${loan.loansignbasics.projectState==4}">已经盈利</c:if>
				    </span>
				</p></div>
				<div class="p_div_01"><p>
					<label>企业成立时间：</label>
					<span>${loan.loansignbasics.enteruptime1}年${loan.loansignbasics.enteruptime2}月</span>
				</p></div>
				<div class="p_div_01"><p>
					<label> 企业员工人数：</label>
					<span >${loan.loansignbasics.person} 人</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>公司所在城市：</label>
					<span>${loan.loansignbasics.city}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>公司是否成立：</label>
					<span>
						<c:if test="${loan.loansignbasics.isUp==1}">是</c:if>
						<c:if test="${loan.loansignbasics.isUp==0}">否</c:if>
					</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>是否有其他项目：</label>
					<span>
						<c:if test="${loan.loansignbasics.haveOther==1}">是</c:if>
						<c:if test="${loan.loansignbasics.haveOther==0}">否</c:if>
					</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>拨款方式：</label>
					<c:if test="${loan.appropriation==1}">每季度一次，每次25%</c:if>
				    <c:if test="${loan.appropriation==2}">每半年一次，第次50%</c:if>
				    <c:if test="${loan.appropriation==3}">一次性全额到账</c:if>
				</p></div>
				<div class="p_div_01"><p>
					<label>办公地址：</label>
					<span>${loan.loansignbasics.address}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>剩余金额：</label>
					<span>${loan.restMoney} 元人民币</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>项目总额：</label>
					<span>
					<input id="Loan_issueLoan" type="text" name="issueLoan" size="10" value="${loan.issueLoan}" readonly="readonly">&nbsp;元人民币</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>最低投资金额：</label>
					<span>${loan.loanUnit} 元</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>债权转让：</label>
					<span>${loan.outDay}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>第三方担保：</label>
					<span>${loan.escrow.name}</span>
				</p></div>
				<div class="p_div_01"><p>
					<label>分红方式：</label>
					<span>
						<c:if test="${loan.refunway==1}">月份红</c:if>
						<c:if test="${loan.refunway==2}">季度分红</c:if>
					</span>
				</p></div>
				<div class="p_div_01" style="width: 75%">
			   <fieldset style="width: 1200px;">
				<legend>投资模式</legend>
					<input type="hidden" name="id" value="${loan.loansignbasics.id}">
					<dl>
						<dt>优先：</dt>
						<dd>
						<input type="text" size="10" name="priority" value="${loan.priority}"> 元
						</dd>
					</dl>
					<dl>
						<dt>年化率：</dt>
						<dd><span>
							<input type="text" size="10"  name="prioRate" value="${loan.prioRate*100}">%
						
						 </span></dd>
					</dl>
					<dl>
						<dt>奖励：</dt>
						<dd><span>
						<input type="text" size="10"   name="prioAwordRate" value="${loan.prioAwordRate*100}">% </span></dd>
					</dl>
					<dl>
						<dt>夹层：</dt>
						<dd>
						<input type="text" name="middle" id="sandwich" size="10" value="${loan.middle}"> 元</dd>
					</dl>
					<dl>
						<dt>夹层百分比：</dt>
						<dd><span>
						<input type="text" name="midRate" size="10" value="${loan.midRate*100}"> %</span></dd>
					</dl>
					<dl>
						<dt></dt>
						<dd><span></span></dd>
					</dl>
					<dl>
						<dt>劣后：</dt>
						<dd>
						<input type="text" name="after" id="after" size="10" value="${loan.after}"> 元</dd>
					</dl>
					<dl>
						<dt>劣后百分比：</dt>
						<dd><span>
						
							<input type="text" name="afterRate" size="10" value="${loan.afterRate*100}">%</span></dd>
					</dl>
					<dl >
					</dl>
			   </fieldset>
			</div>
			<div class="p_div_01" style="width: 75%;" >
			  <fieldset>
			   			<legend>项目简介</legend>
			   		<dl>
			   			<dd><span>${loan.loansignbasics.remark}</span></dd>
			   		</dl>		
				</fieldset>
			</div>
			 	<div class="p_div_01" style="width: 75%;" >
			   <fieldset>
			   			<legend>商业模式介绍</legend>
			   		<dl>
			   			<dd><span>${loan.loansignbasics.businessIntro}</span></dd>
			   		</dl>		
				</fieldset>
			</div>
			<div class="p_div_01" style="width: 75%;" >
			   <fieldset>
			   			<legend>创业团队介绍</legend>
			   		<dl>
			   			<dd><span>${loan.loansignbasics.teamsIntro}</span></dd>
			   		</dl>		
				</fieldset>
			</div>
			<div class="p_div_01" style="width: 75%;" >
			   <fieldset>
			   			<legend>历史情况</legend>
			   		<dl>
			   			<dd><span>${loan.loansignbasics.history}</span></dd>
			   		</dl>		
				</fieldset>
			</div>
			<div class="p_div_01" style="width: 75%;" >
			  <fieldset>
			   			<legend>未来计划</legend>
			   		<dl>
			   			<dd><span>${loan.loansignbasics.futurePlan}</span></dd>
			   		</dl>		
				</fieldset>
			</div>
			<div  class="formBar">
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
		</div>
	</form>	
</div>
