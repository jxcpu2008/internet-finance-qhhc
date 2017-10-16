<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action="<%=basePath %>ShopComment/uptShopComment"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" style="height: 200px">	
				  <dl>
				   <dt>评论内容：</dt>
					<dd>
					      <input type="hidden" name="id" value="${shopComment.id}" />
					    <textarea  rows="10" cols="60"  name="cmtContent"   class="required"  readonly="readonly" >${shopComment.cmtContent}</textarea>
					</dd>
				</dl>
			</div>
			<div class="pageFormContent" style="height: 200px">	
			  <dl>
			   <dt>回复评论：</dt>
				<dd>
				    <textarea  rows="10" cols="60"  name="cmtReply"   class="required" >${shopComment.cmtReply}</textarea>
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">确认</button>
						</div>
					</div></li>
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