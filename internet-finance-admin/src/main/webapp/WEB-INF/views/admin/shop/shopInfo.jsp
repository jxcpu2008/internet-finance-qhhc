<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function showpick(data){
		 $.pdialog.open('/userinfo/to_bigpic?pic='+data, 'update_user_relation', '图片浏览' , { width:612,height:400,mask:false,maxable:false,resizable:false });
}
</script>
<style>
img{
	cursor: pointer;
}
</style>
<form method="post" action="demo/common/ajaxDone.html"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this)">
	<div class="pageContent">
		<div class="pageFormContent sortDrag" >
			<dl>
				<dt>地址：</dt>
				<dd>
					<input readonly="readonly" value="${shop.province}${shop.city}${shop.county}${shop.street}" type="text" >
				</dd>
			</dl>
			<dl>
				<dt>一句话介绍：</dt>
				<dd>
					<input readonly="readonly" value="${shop.introduct}"
						type="text" />
				</dd>
			</dl>
			</div>
		<div class="pageFormContent sortDrag" >
			<dl>
				<dt>新浪微博：</dt>
				<dd>
					<input readonly="readonly" value="${shop.optOut}" type="text" >
				</dd>
			</dl>
			<dl>
				<dt>网址：</dt>
				<dd>
					<input readonly="readonly" value="${shop.website}"
						type="text" />
				</dd>
			</dl>
			</div>
		<div class="pageFormContent sortDrag" style="height: 200px">
			<dl>
				<dt>创始人头像：</dt>
				<dd>
					<img src="${shop.founderPic}" class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
			<dl>
				<dt>店铺封面：</dt>
				<dd>
					<img src="${shop.shopCoverImage}" class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
		</div>	
		<div class="pageFormContent sortDrag" style="height: 200px">			
			  <dl>
				<dt>创始人简介：</dt>
				<dd>
				    <textarea  rows="10" cols="60"  readonly="readonly" >${shop.founderBrief}</textarea>
				</dd>
			</dl>
		</div>
		<div class="pageFormContent sortDrag" style="height: 200px">			
			  <dl>
				<dt>店铺简介：</dt>
				<dd>
				   <textarea  rows="10" cols="60"  readonly="readonly" >${shop.shopDescription}</textarea>
				</dd>
			</dl>
		</div>
	</div>
</form>
