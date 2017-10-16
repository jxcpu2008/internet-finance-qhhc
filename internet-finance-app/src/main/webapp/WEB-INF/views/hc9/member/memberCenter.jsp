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
<link href="${oss}/resources/assets/css/center/center.css?ver=2015112301" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
<style type="text/css">
.bg-panel {
    background-color: #FFFFFF;
}
.bg-panel>tr>th {
	height: 50px;
	size: 14px;
	color: #787878;
}
.tbody>tr>td {
	size: 14px;
	color: #333333;
	margin-top: 12px;
	margin-bottom: 12px;
}
</style>
</head>
<body>
	<!-- 页头 -->
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<c:if test="${!empty msgContent }">
				<div style="background-color: #fff4da; border-radius:4px; border:1px solid #efe1bf; padding: 15px 18px; margin-top:20px; font-size: 14px; color: #83776b;">
					<span style="padding-right: 15px;"><img src="${oss }/resources/assets/images/center/news/news-ico-14x18.png"/></span>${msgContent }
					<a href="javascript:touse(${msgId });" style="background-color: #d7524e; color: white; border-radius:4px; padding: 5px 20px; margin-left: 80px;text-decoration:none;">去使用</a>
				</div>
			</c:if>
			<div class="center bg-snow clearfix" style="margin-top:20px;">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<div class="nav-right col-md-10 clearfix">
					<h4 class="text-para">投资日记</h4>
					<div class="pull-left">
						<div id="newDate">
							<div id="nowDate"></div>
						</div>
						<div id="win">
							<div id="otitle">
								<div id="close">
									<span id="dateView"></span><span id="rightBtn">&gt;</span>
								</div>
								<div id="otitlestr"></div>
							</div>
							<div id="line">&nbsp;</div>
							<div id="showstr"></div>
						</div>
					</div>
					<div class="pull-right account-view w47-view" role="tabpanel">
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation" class="active"><a href="#preview"
								aria-controls="preview" role="tab" data-toggle="tab">投资概况</a></li>
							<li role="presentation"><a href="#repaying"
								aria-controls="repaying" role="tab" data-toggle="tab">待回款</a></li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="preview">
								<div class="table-responsive text-label micmedium-font">
									<table class="table table-account text-center">
										<thead>
											<tr>
												<th class="text-center">时间</th>
												<th class="text-center">笔数</th>
												<th class="text-center">金额(元)</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${history}" var="his" varStatus="var">
												<tr>
													<c:if test="${var.index eq 0 }">
														<td>本月</td>
													</c:if>
													<c:if test="${var.index eq 1 }">
														<td>上个月</td>
													</c:if>
													<c:if test="${var.index eq 2 }">
														<td>本年</td>
													</c:if>
													<c:if test="${var.index eq 3 }">
														<td>总计</td>
													</c:if>
													<td><span data-id="fm">${his[0]}</span></td>
													<td><c:if test="${empty his[1]}">0</c:if> <c:if
															test="${!empty his[1]}">
															<span data-id="fm"><fmt:formatNumber type="number"
																	value="${his[1]}" pattern="#0.00#" /></span>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="repaying">
								<div class="table-responsive text-label micmedium-font">
									<table class="table table-account text-center">
										<thead>
											<tr>
												<th class="text-center">状态</th>
												<th class="text-center">笔数</th>
												<th class="text-center">金额</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${back}" var="back" varStatus="var">
												<tr>
													<c:if test="${var.index eq 0 }">
														<td>投标中</td>
													</c:if>
													<c:if test="${var.index eq 1}">
														<td>回款中</td>
													</c:if>
													<c:if test="${var.index eq 2 }">
														<td>总计</td>
													</c:if>
													<td><span data-id="fm">${back[0] }</span></td>
													<td><c:if test="${empty back[1]}">0.00</c:if> <c:if
															test="${!empty back[1]}">
															<span data-id="fm"><fmt:formatNumber type="number"
																	value="${back[1]}" pattern="#0.00#" /></span>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<%-- <c:if test="${!empty backAlsoRepayments }">
						<p style="white-space: nowrap;text-overflow: ellipsis;-o-text-overflow: ellipsis;overflow: hidden;width: 95%;"></p>
						<table width="100%" border="1" cellpadding="0" cellspacing="0" bgcolor="#e8e8e8" rules="rows" bordercolor="#dddddd" style="text-align:center;margin:10px 0;" >
				            <col width="25%"/>
				            <col width="25%"/>
				            <col width="25%"/>
				            <col width="25%"/>
				            <tr>
				            	<th bgcolor="#ffbdaf" height="35" class="clr-title" colspan="4" style="text-align:left; padding-left:20px;">待回款还款明细</th>
				            </tr>
			            	<tr bgcolor="#f1f1f1" height="35">
				                <td>时间</td>
				                <td>项目类型</td>
				                <td>项目名称</td>
				                <td>金额数</td>
				            </tr>
				            <c:forEach var="list" items="${backAlsoRepayments }">
				            	<tr bgcolor="#ffffff" height="35">
					                <td>${list[0] }</td>
					                <td><c:if test="${list[1] eq 1 }">待还款项目</c:if><c:if test="${list[1] eq 2 }">待回款项目</c:if></td>
					                <td class="clr-title">${list[2] }</td>
					                <td><fmt:formatNumber type="number" value="${list[3] }" pattern="#0.00#" /></td>
					            </tr>
				            </c:forEach>
				        </table>
				    </c:if> --%>
				    <div class="clearfix" style="padding-top:40px;clear:both;"></div>
				    <div class="account-view w100-view bg-snow" role="tabpanel" style="border:1px solid #ddd; margin-bottom: 10px;">
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<c:if test="${!empty backAlsoRepayments && !empty payAlsoRepayments }">
								<li role="presentation" style="width: 0.61%;" class="active"><a href="#backMoney" aria-controls="backMoney" role="tab" data-toggle="tab">待回款明细</a></li>
								<li role="presentation" style="width: 0.61%;"><a href="#payMoney" aria-controls="payMoney" role="tab" data-toggle="tab" style="border-left: 1px solid #ddd;">待还款明细</a></li>
								<li role="presentation" style="">&nbsp;</li>
							</c:if>
							<c:if test="${!empty backAlsoRepayments && empty payAlsoRepayments }">
								<li role="presentation" style="width: 0.61%;" class="active"><a href="#backMoney" aria-controls="backMoney" role="tab" data-toggle="tab">待回款明细</a></li>
								<li role="presentation" style="">&nbsp;</li>
								<li role="presentation" style="">&nbsp;</li>
							</c:if>
							<c:if test="${empty backAlsoRepayments && !empty payAlsoRepayments }">
								<li role="presentation" style="width: 0.61%;" class="active"><a href="#backMoney" aria-controls="backMoney" role="tab" data-toggle="tab">待还款明细</a></li>
								<li role="presentation" style="">&nbsp;</li>
								<li role="presentation" style="">&nbsp;</li>
							</c:if>
							<c:if test="${empty backAlsoRepayments && empty payAlsoRepayments }">
								<li role="presentation" style="">&nbsp;</li>
								<li role="presentation" style="">&nbsp;</li>
								<li role="presentation" style="">&nbsp;</li>
							</c:if>
						</ul>
						<div class="tab-content">
							<c:if test="${!empty backAlsoRepayments }">
								<div role="tabpanel" class="tab-pane fade in active" id="backMoney" style="margin: 0px 12px;">
									<div id="repayment10" class="table-responsive text-label">
										<table class="table text-center">
											<thead>
												<tr class="bg-panel">
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;padding-left: 40px; width: 35%; text-align: left;">投资项目</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">预计回款时间</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">回款总金额(元)</th>
												</tr>
											</thead>
											<tbody class="tbody">
												<c:forEach var="list" items="${backAlsoRepayments }" varStatus="i">
													<c:if test="${i.index < 10}">
													<tr bgcolor="#ffffff" height="35">
														<td align="left" style="padding-left: 40px; width: 35%">${list[2] }</td>
														<td class="clr-title">${list[0] }</td>
														<td><fmt:formatNumber type="number" value="${list[3] }" pattern="#0.00#" /></td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${fn:length(backAlsoRepayments)>=11}">
											<a href="javascript:void(0)" onclick="rechSearch(1,1,0)" class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" style="margin:20px auto;display:block;background-color:#FFF;" role="button">更多</a>
										</c:if>
									</div>
									<div id="repayment11" style="display: none;" class="table-responsive text-label">
										<table class="table text-center">
											<thead>
												<tr class="bg-panel">
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;padding-left: 40px; width: 35%; text-align: left;">投资项目</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">预计回款时间</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">回款总金额(元)</th>
												</tr>
											</thead>
											<tbody class="tbody">
											</tbody>
										</table>
										<c:if test="${fn:length(backAlsoRepayments)>=11}">
											<a href="javascript:void(0)" onclick="rechSearch(1,0,1)" class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" style="margin:20px auto;display:block;background-color:#FFF;" role="button">收起</a>
										</c:if>
									</div>
								</div>
							</c:if>
							<c:if test="${!empty payAlsoRepayments }">
								<c:if test="${empty backAlsoRepayments }">
								<div role="tabpanel" class="tab-pane fade active in" id="payMoney">
								</c:if>
								<c:if test="${!empty backAlsoRepayments }">
								<div role="tabpanel" class="tab-pane fade" id="payMoney" style="margin: 0px 12px;">
								</c:if>
									<div id="repayment20" class="table-responsive text-label">
										<table class="table text-center">
											<thead>
												<tr class="bg-panel">
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;padding-left: 40px; width: 35%; text-align: left;">融资项目</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">预计还款时间</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">还款总金额(元)</th>
												</tr>
											</thead>
											<tbody class="tbody">
												<c:forEach var="list" items="${payAlsoRepayments }" varStatus="i">
													<c:if test="${i.index < 10}">
													<tr bgcolor="#ffffff" height="35">
														<td align="left" style="padding-left: 40px; width: 35%">${list[2] }</td>
														<td class="clr-title">${list[0] }</td>
														<td><fmt:formatNumber type="number" value="${list[3] }" pattern="#0.00#" /></td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${fn:length(payAlsoRepayments)>=11}">
											<a href="javascript:void(0)" onclick="rechSearch(2,1,0)" class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" style="margin:20px auto;display:block;background-color:#FFF;" role="button">更多</a>
										</c:if>
									</div>
									<div id="repayment21" style="display: none;" class="table-responsive text-label">
										<table class="table text-center">
											<thead>
												<tr class="bg-panel">
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;padding-left: 40px; width: 35%; text-align: left;">融资项目</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">预计还款时间</th>
													<th class="text-center" style="border-bottom: 0px solid #ddd;line-height: 3;">还款总金额(元)</th>
												</tr>
											</thead>
											<tbody class="tbody">
											</tbody>
										</table>
										<c:if test="${fn:length(payAlsoRepayments)>=11}">
											<a href="javascript:void(0)" onclick="rechSearch(2,0,1)" class="btn btn-default btn-sm bg-gray-lighter text-label col-xs-1 nofloat" style="margin:20px auto;display:block;background-color:#FFF;" role="button">收起</a>
										</c:if>
									</div>
								</div>
							</c:if>
						</div>
				    </div>
			</div>
		</div>
	</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<div style="display:none;">
		<input id="cashRewardPrompt" type="hidden" value="${cashRewardPrompt }" />
		<input id="peachNum" type="hidden" value="${peachNum }" />
		<input id="realAuth" type="hidden" value="${realAuth }" />
		<input id="isAuthIps" type="hidden" value="${isAuthIps }" />
		<input id="auditReminds" type="hidden" value="${auditReminds }" />
		<input id="noPassRemark" type="hidden" value="${noPassRemark }" />
		<input id="climbResult" type="hidden" value="${climbActivityResult }" />
        <div style="width:490px;height:317px;background-color:#ffffff;text-align: center;border:6px solid #7e8078;" id="record">
            <ul style="font-size:18px;color:#575757;margin-bottom:40px;padding:50px 0 0 0;list-style: none;line-height: 34px;">
            	<li>恭喜您</li>
            	<li>您的推荐投资金额已达到</li>
            	<li>${cashRewardPrompt }，</li>
            	<li>推荐越多，奖励越多！</li>
            </ul>
            <a style="color:#ffffff;font-size:24px;background-color:#f65c5d;border-radius:20px;padding:5px 30px;" href="/member_index/friendRecommend.htm?index=3_0&nav=5">去推荐吧</a>
        </div>
    </div>
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/assets/js/center.js?v=1.0.2"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<script type="text/javascript">
	function touse(id) {
		$.ajax({
			url : '/member_index/updMsgStatus.htm?msgId='+id,
			type : 'post',
			success : function(result) {
				if (result == 0) {
					location.href = "/loaninfo/loanList.htm?nav=2";
				}
			},
			error : function() {
				ymPrompt.alert({ message : "出现错误，请稍后重试！",width : 420,height : 200,title : "提示" });
			}
		});
	}
	function rechSearch(type,all,part) {
		if(all == 1){
			$.ajax({
				url : '/member_index/queryRepayments.htm',
				type : 'post',
				dataType : 'json',
				data : {
					type : type
				},
				success : function(msg) {
					var str = "";
					if(msg){
						for(i=0;i<msg.length;i++){
							str += "<tr bgcolor=\"#ffffff\" height=\"35\">"
							 + "<td align=\"left\" style=\"padding-left: 40px; width: 35%\">"+msg[i][2]+"</td>"
							 + "<td class=\"clr-title\">"+msg[i][0]+"</td>"
							 + "<td>"+formatNumber(msg[i][3]+"",3)+"</td>"
							 + "</tr>";
						}
					}
					//var str =  "<tr bgcolor=\"#ffffff\" height=\"35\">"
							//+ "<td></td>"
							//+ "<td class=\"clr-title\"></td>"
							//+ "</tr>";
					$("#repayment"+type+all).find("tbody").html(str);
					
				}
			});
		}
		$("#repayment"+type+part).hide();
		$("#repayment"+type+all).show();
	}
	
	function formatNumber(numerical,number){
		if(numerical.indexOf(".")==-1)
			return numerical+".00";
		else if(numerical.length - numerical.indexOf(".") == 2)
			return numerical+"0";
		else
			return numerical.substr(0,numerical.indexOf(".")+number);   
	}
	function userReminds() {
		// 登顶活动中奖提醒
		var climbResult = $("#climbResult").val();
		var climbMsg = "";
		var _url = "/april/toclimbtop.htm";
		if (climbResult == 10) {  // 10元红包
			climbMsg = "10元红包！";
			_url = "/member_index/favorable.htm?index=0_3&nav=5";
		}
		if (climbResult == 13) {  // 50元京东购物卡
			climbMsg = "50元京东购物卡，<br/>客服会在5个工作日内联系发放";
		}
		if (climbResult == 14) {  // 飞利浦电动牙刷
			climbMsg = "飞利浦电动牙刷，<br/>客服会在5个工作日内联系发放";
		}
		if (climbResult == 15) {  // 富士相机
			climbMsg = "富士相机，客服会在5个<br/>工作日内联系发放";
		}
		if (climbResult == 16) {  // 小米套装
			climbMsg = "小米套装，客服会在5个<br/>工作日内联系发放";
		}
		if (climbMsg != "") {
			ymPrompt.alert({ message : "恭喜您在攀爬活动中获得"+climbMsg,width : 420,height : 200,title : "提示",handler : function(result) {
					if (result != "close") {
						window.location.href = _url;
					}
				},btn : "去查看",});
		}
		// 红筹理财师达标后提示
		var cashRewardPrompt = $("#cashRewardPrompt").val();
		if (cashRewardPrompt != '') {
			$.fancybox.open({
				href : '#record',
				padding : 0,
				margin:0,
				scrolling: 'no',
				closeBtn: true,
				wrapCSS: 'fancybox-transparent',
				helpers: {
					  overlay : {
						  closeClick : false
					  }
				  },
				  tpl:{
					  closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:22px;top:18px;background:url(/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
				  }
			});			
		}
		var flag = false;
		// 金桃朵朵开用户剩余抽奖次提醒
		var peachNum = $("#peachNum").val();
		if (peachNum > 0) {
			ymPrompt.alert({
				message : "您还有"+peachNum+"次抽奖机会，请点击使用吧",
				width : 420,
				height : 200,
				title : "提示",
				handler : function(result) {
					if (result != "close") {
						location.href = '/activity/peachActivity.htm';
					}
				},
				btn : "使用",
			});
			flag = true;
		}
		// 金桃朵朵开用户未认证领取“2元现金”提醒
		var realAuth = $("#realAuth").val();
		if (realAuth != '' && flag == false) {
			ymPrompt.alert({
				message : "您中奖记录中待收的2元现金奖励，需要<br>进行实名认证后才能顺利到账哦！",
				width : 420,
				height : 200,
				title : "提示",
				handler : function(result) {
					if (result != "close") {
						location.href = '/member_index/monkeyRecord.htm?index=0_6_al&nav=5';
					}
				},
				btn : "去实名认证",
			});
			flag = true;
		}
		var isAuthIps = $("#isAuthIps").val();
		if (isAuthIps != '' && flag == false) {
			ymPrompt.alert({
				message : "您还差完成宝付授权，完成宝付授权后，2元<br>现金在审核成功后才能顺利到账哦！",
				width : 420,
				height : 200,
				title : "提示",
				handler : function(result) {
					if (result != "close") {
						$("#accredit").trigger('click');
					}
				},
				btn : "宝付授权",
			});
			flag = true;
		}
		
		var auditReminds = $("#auditReminds").val();
		if (auditReminds == "pass" && flag == false) {
			ymPrompt.alert({
				message : "恭喜您通过验证身份审核",
				width : 400,
				height : 200,
				title : "提示"
			});
			flag = true;
		}
		if (auditReminds == "nopass" && flag == false) {
			var noPassRemark = $("#noPassRemark").val();
			if (noPassRemark != '') {
				ymPrompt.alert({
					message : "很抱歉您的验证身份审核未通过，原因为："+noPassRemark,
					width : 400,
					height : 200,
					title : "提示",
					handler : function(result) {
						if (result != "close") {
							location.href = '/member_index/monkeyRecord.htm?index=0_6_al&nav=5';
						}
					},
					btn : "重新上传",
				});
			} else {
				ymPrompt.alert({
					message : "很抱歉您的验证身份审核未通过，请重新上传身份证正面",
					width : 400,
					height : 200,
					title : "提示",
					handler : function(result) {
						if (result != "close") {
							location.href = '/member_index/monkeyRecord.htm?index=0_6_al&nav=5';
						}
					},
					btn : "重新上传",
				});
			}
			flag = true;
		}
		var newerFlag = "${loginRemindFlag}";
		if (newerFlag == "true") {
			ymPrompt.alert({
				message : "您的新手任务还未完成，<br>完成接下来的任务，收集更多的钥匙，<br>将有更多的奖励等着您！",
				width : 400,
				height : 210,
				title : "提示",
				handler : function(result) {
					if (result != "close") {
						location.href = '/neweractivity/totask.htm';
					}
				},
				btn : "去完成",
			});
		}
	}
	$(function(){
		userReminds();
		pyRegisterCvt("${session_user.id}");
	});
	function pyRegisterCvt(_orderno) {
		var w = window, d = document, e = encodeURIComponent;
		var b = location.href, c = d.referrer, f, g = d.cookie, h = g
				.match(/(^|;)\s*ipycookie=([^;]*)/), i = g
				.match(/(^|;)\s*ipysession=([^;]*)/);
		if (w.parent != w) {
			f = b;
			b = c;
			c = f;
		}
		;
		u = '//stats.ipinyou.com/cvt?a=' + e('qY.ww.Ul9jEpK_eOnHhCnmDW-GPP')
				+ '&c=' + e(h ? h[2] : '') + '&s='
				+ e(i ? i[2].match(/jump\%3D(\d+)/)[1] : '') + '&u=' + e(b)
				+ '&r=' + e(c) + '&rd=' + (new Date()).getTime() + '&OrderNo='
				+ e(_orderno) + '&e=';
		(new Image()).src = u;
	}

	</script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>