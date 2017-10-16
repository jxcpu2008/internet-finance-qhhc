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

<form method="post" action="demo/common/ajaxDone.html"  class="pageForm required-validate"
	onsubmit="return validateCallback(this)">
	<div class="pageContent">
		<div class="pageFormContent sortDrag" style="height: 200px;">
			<dl>
				<dt>法人代表身份证：</dt>
				<dd>
					<img src="${shopFile.facardimg}" class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
			<dl>
				<dt>营业执照：</dt>
				<dd>
					<img src="${shopFile.yyzz}" class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
				
			<dl>
			<dt>税务登记证：</dt>
				<dd>
					<img src="${shopFile.swdj}" class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
		</div>
		<div class="pageFormContent sortDrag"  style="height: 200px;">
			
			<dl>
			<dt>组织机构代码证：</dt>
				<dd>
					<img src="${shopFile.zzjg}"  class="pick" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
			<dl>
			<dt>公司照片：</dt>
				<dd>
					<img src="${shopFile.companyimg}" onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
			<dl>
			<dt>场地租赁合同：</dt>
				<dd>
					<img src="${shopFile.contrantimg}"  onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
		</div>
		<div class="pageFormContent sortDrag"    style="height: 200px;">
			<dl>
			<dt>卫生许可证：</dt>
				<dd>
					<img src="${shopFile.wsxk}"  onclick="showpick(this.src)" width="150" height="150" />
				</dd>
			</dl>
		</div>
	</div>
</form>
