<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/vendor/css/calendar.css" rel="stylesheet">
<link href="${oss}/resources/assets/css/center/center.css" rel="stylesheet"><jsp:include
	page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- 页头 -->
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="center bg-snow clearfix">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<div class="nav-right col-md-10 clearfix">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center" style="padding-bottom: 10px;">
                                <h4 class="text-para text-left">中奖记录<c:if test="${!empty showRealAuth }"><span style="font-size: 12px;color:#787878;float: right; overflow: hidden;"><em style="float: left; font-style: normal;line-height: 24px;">完成</em><a id="realAuth" href="#realModal" data-toggle="modal" style="tecolor:#ffffff;background-color: #ce251f;padding: 5px 10px;float:left;border-radius:3px;margin: 0 5px;text-decoration: none;color:#ffffff;
                               ">实名认证</a><em style="float: left; font-style: normal;line-height: 24px;">后发放金桃奖励</em></span></c:if></h4>
                            </div>
                            <div class="panel-body">
                            	<div class="account-view w100-view bg-snow">
									<div class="tab-content">
										<div class="tab-pane fade in active" id="monkey_list">
											
										</div>
									</div>
                            	</div>
                            </div>
                        </div>    
                    </div>
			</div>
		</div>
	</div>
	<!-- 开通宝付模态框 -->
	<div class="modal fade" id="realModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">实名认证</h4>
				</div>
				<div class="modal-body" style="padding-bottom:0px;">
					<form class="form-horizontal" id="ipsFormBaof"
						action="/member/ipsRegistration" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">真实姓名 :</label>
							<div class="col-sm-6">
								<c:choose>
									<c:when test="${!empty session_user.pMerBillNo }">
										<input type="text" class="form-control input-sm" id="realName"
										name="name" value="${session_user.name }" data-id="baofu-name" readonly="readonly"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="请输入您的真实姓名"><span
										class="glyphicon form-control-feedback"></span>
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control input-sm" id="realName"
										name="name" placeholder="" data-id="baofu-name"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="请输入您的真实姓名"><span
										class="glyphicon form-control-feedback"></span>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">手机号码 :</label>
							<div class="col-sm-6">
								<input type="text" class="form-control input-sm" value="${session_user.userrelationinfo.phone }"
									readonly="readonly" placeholder="" data-id="baofu-phone"
									data-container="body" data-toggle="popover"
									data-placement="right" data-trigger="focus"><span
									class="glyphicon form-control-feedback"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">身份证号 :</label>
							<div class="col-sm-6">
								<c:choose>
									<c:when test="${!empty session_user.pMerBillNo }">
										<input type="text" class="form-control input-sm" id="cardId"
										name="cardId" value="${session_user.userrelationinfo.cardId }"  readonly="readonly" data-id="baofu-id"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="请输入您的身份证号"><span
										class="glyphicon form-control-feedback"></span>
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control input-sm" id="cardId"
										name="cardId" data-id="baofu-id"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="请输入您的身份证号"><span
										class="glyphicon form-control-feedback"></span>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight" style="text-align: right;">上传身份证件 :</label>
							<div class="col-sm-6" style="overflow: hidden;">
								<input id="text_upload" type="text" readonly="readonly" style="width:181px; float: left;" class="form-control input-sm" value="请浏览文件"/>
								<input id="upload" type="button" style="width:67px; float: left; margin-left:5px; height:30px;" value="上传" />
							</div>
						</div>
						<div class="form-group" style="margin-bottom:0;">
							<label class="col-sm-3 control-label normal-weight"></label>
							<p style="color:#d9534f; font-size:14px; margin: 0;">*上传身份证照片，审核通过后可领取金桃礼金！</p>
							<div style="text-align: center; padding:30px 0 20px;">
								<button type="button" class="btn btn-danger" id="realAuthenticate" style="font-size:16px; padding:10px 35px;">实名认证</button>
							</div>
						</div>
					</form>
				</div>
				<div style="padding:20px 40px;border-top:1px solid #e5e5e5;">
					<p>注：所提交的身份证务必确保身份证清晰且边缘皆可看到，支持格式: jpg,png,jpeg<br>文件大小200KB以内，证件信息需要与开通宝付时的信息一致，上传样式如下：</p>
					<div style="text-align: center; padding:10px 0 30px 0;"><img id="showCardImg" width="184" height="115" src="${oss }/resources/assets/images/center/identity.png" /></div>
				</div>
				
				<input id="isAuthIps" type="hidden" value="${isAuthIps }" />
				<form action="/update_info/upload_identity" method="post" id="myform" enctype="multipart/form-data">
					<input id="file_upload" type="file" name="cardImg" style="display: none;"/>
					<input id="cardImg" type="hidden" /> 
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/My97DatePicker/WdatePicker.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<script src="${oss}/resources/js/jquery.form.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
	<script type="text/javascript">
	function Age(sn){
		if(!sn){return false;}
		var bstr = sn.substring(6,14)
		var _now = new Date();
		var _bir = new Date(bstr.substring(0,4),bstr.substring(4,6),bstr.substring(6,8));
		_bir.setFullYear(_bir.getFullYear()+18);
		_bir.setMonth(_bir.getMonth()-1);
		return _now > _bir;
	}
	$(function(){
		// 根据参数弹出实名认证框
		var url = window.location.search.split("&")[0];
		url = url.substring(url.length,url.length-2);
		if (url == "al") {
			$("#realAuth").trigger('click');
		}
		$.ajax({
			url : '/member_index/monkey_list',
			type : 'post',
			success : function(data) {
				$("#monkey_list").html(data);
			}
		});
		$("#upload").click(function(){
			$("#file_upload").trigger('click');
		});
		$("#file_upload").change(function() {
			var srcc = $(this).val();
			start = srcc.lastIndexOf(".");
			end = srcc.length;
			ts = srcc.substring(start + 1, end);
			nts = ts.toLowerCase();
			if (srcc.length > 0) {
				if (nts != 'jpg' && nts != 'png' && nts != 'jpeg') {
					document.getElementById("myform").reset();
					ymPrompt.errorInfo('请按照标准格式重新上传图片！', 300, 180 ,"上传错误");
				} else {
					$("#myform").ajaxSubmit({
						url : "/update_info/upload_identity",
						type : "post",
						data : {cardImg:srcc},
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						success : function(_msg) {
							$("#cardImg").val(_msg);
							$("#text_upload").val(srcc);
						}
					});
				}
			}
		});
		// 实名认证（来通宝付以及上传身份证）
		$("#realAuthenticate").click(function(){
			var realName = /^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
			if (!realName.test($("#realName").val())){
				BaofuModal.getErrorInfo('真实姓名无效',3);
				return;
			}
			var idcard = /^((\d{18})|(\d{17}[Xx]))$/;
			if (!idcard.test($("#cardId").val())){
				BaofuModal.getErrorInfo('身份证号无效',2);
				return;
			}
			if(!Age($("#cardId").val())){
				BaofuModal.getErrorInfo('未年满18周岁',2);
				return;
			}
			var cardImg = $("#text_upload").val();
			if (cardImg == '' || cardImg == '请浏览文件' && $("#isAuthIps") == 1) {
				ymPrompt.errorInfo('请先上传身份证', 300,180, '提示');
				return;
			}
			// 宝付注册
			$('body').spinner('正在提交...');
			$.ajax({
				url : '/registration/registRealBaofoo.htm',
				type : 'post',
				data : {
					cardId : $("#cardId").val(),
					name : $("#realName").val(),
					cardImg : $("#cardImg").val()
				},
				success : function(data) {
					$('body').removerSpinner();
					if (data == 1) {
						ymPrompt.succeedInfo("您的宝付开通成功，窗口关闭后跳转到宝付授权。",400,200,"成功",function(result) {
							if (result=="ok") {
								accredit();
							} else {
								accredit();
							}
						});
					} else if (data == 10) { 
						ymPrompt.succeedInfo("您已开通宝付，关闭后跳转到宝付授权页..",400,200,"成功",function(result) {
							if (result=="ok") {
								accredit();
							} else {
								accredit();
							}
						});
					} else if (data == 11) { 
						ymPrompt.succeedInfo("实名认证信息提交成功，客服会尽快审核完成",400,200,"成功",function(result) {
							if (result=="ok") {
								$("#realModal").modal('hide');
							}
						});
					} else if (data == 12) { 
						ymPrompt.errorInfo('您提交的身份信息正在审核，请勿重新操作', 400,200, '提示',function(result) {
							if (result=="ok") {
								$("#realModal").modal('hide');
							}
						});
					} else if (data == 0){
						ymPrompt.errorInfo('系统异常，请稍后重试', 400,200, '失败');
					} else if (data == 4){
						ymPrompt.errorInfo('参数为空！', 400,200, '失败');
					} else if (data == 6){
						ymPrompt.errorInfo('身份证号无效！', 400,200, '失败');
					} else if (data == 7){
						ymPrompt.errorInfo('未年满18周岁！', 400,200, '失败');
					} else if (data == 3){
						ymPrompt.errorInfo('不是宝付注册返回的数据！', 400,200, '失败');
					} else {
						var flag=data.split('_')[0];
						if(flag=="BD009"){
							ymPrompt.win({message:'您的宝付账号已经存在，即将引导你进入宝付完成绑定操作。',title:'提示',closeBtn:false});
							setTimeout(bind,3000); 
						}else{
							ymPrompt.win({message:data.split('_')[1],title:'提示',closeBtn:false});
							setTimeout(bind,3000);
						}
					}
				}
			});
		});
		// 授权
		var accredit = function () {
			$.ajax({
				url : '/member/ipsInAccreditUser.htm',
				type : 'post',
				success : function(data) {
					if (data != 1) {
						window.location.href = "/member/callcentralInAccredit.htm";
					} else {
						ymPrompt.errorInfo('授权信息获取失败，请联系客服', 400,200, '失败');
					}
				}
			});
		}
		
		//绑定
		var bind = function () {
			$("#ipsFormBaof").submit();
		}
	});
	</script>
</body>
</html>