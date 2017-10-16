<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action=""  class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" >	
				  <dl>
				   <dt>用户名：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.userbasicsinfo.userName}" />
					</dd>
				</dl>
				 <dl>
				   <dt>真实姓名：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.userbasicsinfo.name}" />
					</dd>
				</dl>
			   <dl>
				   <dt>银行账号：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.bank_no}" />
					</dd>
				</dl>
					   <dl>
				   <dt>开户名称：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.bank_name}" />
					</dd>
				</dl>
					  <dl>
				   <dt>开户省会：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.pro_value}" />
					</dd>
				</dl>
				<dl>
				   <dt>开户城市：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.city_value}" />
					</dd>
				</dl>
					  <dl>
				   <dt>开户支行：</dt>
					<dd>
					 <input type="text" name="cashBalance"  readonly="readonly"  value="${userBank.bank_address}" />
					</dd>
				</dl>
			</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>