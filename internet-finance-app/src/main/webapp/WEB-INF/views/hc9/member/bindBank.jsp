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
<link href="${oss}/resources/assets/css/center/center.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="center bg-snow clearfix">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<div class="nav-right col-md-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="text-para">银行卡绑定</h4>
							<button type="button" class="btn btn-danger pull-right"
								style="margin-top: -38px;" id="refreshBank">
								<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
								同步宝付银行卡
							</button>
						</div>
						<div class="panel-body bank">
							<div class="row">
								<c:forEach items="${userbanks}" var="bank">
									<div class="col-xs-6 col-md-4">
										<div class="thumbnail">
											<!-- <img src="${oss}/resources/assets/images/center/bank_1.png" alt=""> -->
											<h5 class="text-label" style="padding-left: 8px;">${bank.bank_name }</h5>
											<div class="caption clearfix">
												<c:set var="card" value="${bank.bank_no }" />
												<p class="well-card text-center">${fn:replace(card, fn:substring(card,5, fn:length(card)-5),'*****')}</p>
												<%-- <a role="button" class="btn btn-link pull-right text-danger"
													href="#" data-toggle="modal"
													onclick="deleteDiro(${bank.id},'${card}')">删除</a> --%>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="col-xs-6 col-md-4">
									<a href="#bankModal" class="thumbnail text-center"
										data-toggle="modal"> <span
										class="glyphicon glyphicon-plus text-label plus lg2-font"
										aria-hidden="true"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 银行卡绑定模态框 -->
	<div class="modal fade" id="bankModal" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">个人银行卡</h4>
				</div>
				<div class="modal-body">
					<p class="text-center text-label">注：提现银行卡只支持储蓄卡，提现银行卡不必开通网银，支持企业银行卡。</p>
					<form class="form-horizontal text-dark" id="form1">
						<input type="hidden" name="proValue" /> 
						<input type="hidden" name="cityValue" />
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">卡类型 :</label>
							<div class="control-div">储蓄卡</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">银行开户名
								:</label>
							<div class="control-div">${session_user.name }</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">银行卡号
								:</label>
							<div class="col-sm-5 cleargap">
								<input type="text" name="bankCardNo" class="form-control input-sm"
									id="" onkeyup="value=value.replace(/[^\d\.]/g,'')">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">开户地址
								:</label>
							<div class="col-sm-9 cleargap">
								<select class="form-control select-control input-sm"
									id="loc_province">
								</select> <select class="form-control select-control input-sm"
									id="loc_city">
								</select> <select id="bankName"
									class="form-control select-control input-sm" name="bankName">
									<option value="">请选择</option>
									<c:forEach items="${bankType }" var="bank">
										<option value="${bank.name }">${bank.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-7 offset-22">
								<input type="text" class="form-control input-sm" id=""
									name="bankAddress" placeholder="请输入开户支行详细">
								<p class="help-block">例：福田中心区时代金融中心支行</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">手机号 :</label>
							<div class="control-div">${fn:replace(session_user.userrelationinfo.phone, fn:substring(session_user.userrelationinfo.phone,3, fn:length(session_user.userrelationinfo.phone)-3),'*****')}</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">
								手机验证码 :</label>
							<div class="col-sm-2 cleargap">
								<input type="text" class="form-control input-sm" id=""
									name="validCode" placeholder="" maxlength="6">
							</div>&nbsp;
							<button type="button" class="btn btn-danger btn-sm getPhoneCode">获取手机验证码</button>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight"> 验证码
								:</label>
							<div class="col-sm-2 cleargap">
								<input type="text" class="form-control input-sm" id=""
									name="imageCode" placeholder="">
							</div>
							<div class="" style="display: inline-block; margin-left: 10px;">
								<img id="code" class="imgcapt" src="/cic/code?name=user_login"
									onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();"
									title="看不清，点击换一张"
									style="cursor: pointer; width: 69px; height: 30px;" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="mysub">确认并保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 银行卡删除模态框 -->
	<div class="modal fade" id="deleteModel" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">删除银行卡</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal text-dark" id="form2">
						<input type="hidden" name="id" id="bankId" />
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">卡类型 :</label>
							<div class="control-div" style="margin-top: 7px;">储蓄卡</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">银行卡号
								:</label>
							<div class="col-sm-5 cleargap" style="margin-top: 7px;">
								<span></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">手机号 :</label>
							<div class="control-div" style="margin-top: 7px;">${fn:replace(session_user.userrelationinfo.phone, fn:substring(session_user.userrelationinfo.phone,3, fn:length(session_user.userrelationinfo.phone)-3),'*****')}</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">
								手机验证码 :</label>
							<div class="col-sm-2 cleargap">
								<input type="text" class="form-control input-sm" id=""
									name="validate_code" placeholder="" maxlength="6">
							</div>
							<button type="button" class="btn btn-danger btn-sm getPhoneCode">获取手机验证码</button>
						</div>
					</form>
				</div>
				<div class="modal-footer" style="text-align: right;">
					<button type="button" class="btn btn-danger" onclick="delectBank()">确认并删除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<script src="${oss}/resources/assets/js/src/location.js"></script>
	<script src="${oss}/resources/assets/js/src/area.js"></script>
	<script src="${oss}/resources/assets/js/src/binbank.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>