<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="table-responsive text-label related">
	<h4 class="text-para padding20">我的推荐</h4>
	<button type="button" class="btn btn-danger pull-right"
		data-toggle="modal" data-target="#findmenModal">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		关联我的客户
	</button>
	<!-- <div class="popover top related bg-danger" role="tooltip">
		<div class="arrow"></div>
		<div class="popover-content micmedium-font text-snow">关联我的客户</div>
	</div> -->
	<table class="table">
		<thead>
			<tr class="bg-panel">
				<th class="text-center">姓名</th>
				<th class="text-center">手机</th>
				<th class="text-center">推广日期</th>
				<th class="text-center">状态</th>
				<th class="text-center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list }" var="generlize" varStatus="status">
				<tr>
					<c:if
						test="${!empty generlize.byUser.name && generlize.byUser.name ne '您好，您还没填写真实姓名'}">
						<c:if test="${session_user.userType eq 2 }">
							<td class="text-center">${generlize.byUser.name }</td>
						</c:if>
						<c:if test="${session_user.userType ne 2 }">
							<c:set var="name" value="${generlize.byUser.name }" />
							<td class="text-center">${name.substring(0,1) }***</td>
						</c:if>
					</c:if>
					<c:if
						test="${empty generlize.byUser.name || generlize.byUser.name eq '您好，您还没填写真实姓名'}">
						<td class="text-center">暂未实名认证</td>
					</c:if>

					<c:set var="name" value="${comlist[10] }" />
					<td class="text-center"><c:set var="phone"
							value="${generlize.byUser.userrelationinfo.phone }" />
						***${phone.substring(phone.length()-4,phone.length()) }</td>
					<td class="text-center">${generlize.adddate.substring(0,10) }</td>
					<td class="text-center">
						<c:set var="state" value="${generlize.state }"></c:set>
						<c:if test="${state eq 0 }">正在审核</c:if>
						<c:if test="${state eq 1 or state eq 2 }">关联成功</c:if>
						<c:if test="${state eq 3 }">未通过</c:if></td>
					<td class="text-center"><c:if
							test="${empty generlize.remark }">--</c:if> <c:if
							test="${!empty generlize.remark }">${generlize.remark }</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${empty page.list }">
		<p class="text-center medium-font margin40">暂无数据</p>
	</c:if>
</div>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<!-- 关联我的客户模态框 -->
<div class="modal fade" id="findmenModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">关联我的客户</h4>
			</div>
			<div style="background-color: #f5f5f5;border-bottom: 1px solid #e5e5e5;padding-bottom: 15px;">
				<div class="modal-body" style="overflow: hidden;padding: 42px 15px 35px 15px;">
					<div style="font-size: 38px;color: #f1817f; width:80px; float: left;margin-left: 30px;">
						找回流程
					</div>
					<div>
						<ul style="overflow: hidden;padding-left: 34px;color: #f1817f;">
							<li style="float: left;list-style: none;">
								<dl>
									<dt  class="text-center" style="margin-bottom: 20px;"><img src="/resources/public/images/member/ico-1.png" /></dt>
									<dd style="padding: 0px;">提交关联申请</dd>
								</dl>
							</li>
							<li style="float: left;list-style: none;margin: 30px 0 0 -8px;">
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
							</li>
							<li style="float: left;list-style: none;">
								<dl>
									<dt class="text-center" style="margin-bottom: 20px;"><img src="/resources/public/images/member/ico2.png"/></dt>
									<dd>客服审核</dd>
								</dl>
							</li>
							<li style="float: left;list-style: none;margin: 30px 0 0 3px;">
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
								<em style="width: 5px;height: 1px;background-color: #c7c7c7;float: left; margin-right:4px;"></em>
							</li>
							<li style="float: left;list-style: none;">
								<dl>
									<dt class="text-center" style="margin-bottom: 20px;"><img src="/resources/public/images/member/ico3.png"/></dt>
									<dd>找回成功</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div>
				<div style="width: 540px;font-size: 14px;padding-left: 45px;color: #999999;">
					关联申请提交成功后，客服会在2个工作日内进行审核，审核通过后好友名单会直接显示在列表，审核未通过请认真核实一下再申请。
				</div>
			</div>
			<div class="modal-body" style="padding-top: 30px;">
				<form class="form-horizontal" id="retrieve_form">
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">真实姓名 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="realName"
								name="realName" placeholder="" data-id="baofu-name"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"
								data-content="请输入您的真实姓名"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">手机号码 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="phone"
								name="phone" placeholder="" data-id="baofu-phone"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">身份证号 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="identity"
								name="identity" placeholder="" data-id="baofu-id"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"
								data-content="请输入您的身份证号"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer" style="padding:20px 15px;">
				<button type="button" class="btn btn-danger" style="margin:0 auto;display:block;padding: 10px 30px;" id="retrieve">立即申请</button>
			</div>
		</div>
	</div>
</div>
<script src="${oss}/resources/assets/js/src/center/baofu-modules.js"></script>
<script src="${oss}/resources/assets/js/center.js"></script>