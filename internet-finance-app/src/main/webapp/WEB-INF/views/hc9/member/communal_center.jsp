
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="clearfix">
	<c:if test="${session_user.name eq '您好，您还没填写真实姓名'}">
		<p class="smmedium-font text-label">请先实名认证</p>
	</c:if>
	<c:if test="${session_user.name ne '您好，您还没填写真实姓名'}">
		<p class="smmedium-font text-label">
			亲爱的<span class="text-danger">${session_user.name}</span>，欢迎您回来！
		</p>
	</c:if>
	<input type="hidden" id="cardStatus"
		value="${session_user.cardStatus }"> <input type="hidden"
		id="is_open_baofu" value="${session_user.isAuthIps }"> <input
		type="hidden" id="baofu_no" value="${session_user.hasIpsAccount }">
	<ul class="list-unstyled list-inline cleargap">
		<li>
			<c:if test="${session_user.cardStatus!=2 }">
				<a href="javascript:;" data-id="vcard" data-container="body"
					data-toggle="popover" data-placement="top" data-trigger="hover"
					data-content="实名认证"><span
					class="icon-ucenter icon-vcard center-block"></span></a>
			</c:if> 
			<c:if test="${session_user.cardStatus==2 }">
				<a href="javascript:;" data-id="vcard" data-container="body"
					data-toggle="popover" data-placement="top" data-trigger="hover"
					data-content="实名认证"> <span
					class="icon-ucenter icon-revvcard center-block"></span></a>
			</c:if>
		</li>
		<li>
			<c:if test="${session_user.userrelationinfo.phonePass eq 0 }">
				<a href="/member_index/selfInfo.htm?index=0_5_2&nav=5"
					data-id="phone" data-container="body" data-toggle="popover"
					data-placement="top" data-trigger="hover" data-content="绑定手机"><span
					class="icon-ucenter icon-phone center-block"></span></a>
			</c:if> 
			<c:if test="${session_user.userrelationinfo.phonePass eq 1 }">
				<a href="javascript:;" data-id="phone" data-container="body"
					data-toggle="popover" data-placement="top" data-trigger="hover"
					data-content="绑定手机"><span
					class="icon-ucenter icon-revphone center-block"></span></a>
			</c:if>
		</li>
		<li>
			<c:if test="${session_user.userrelationinfo.emailisPass==0}">
				<a href="/member_index/selfInfo.htm?index=0_5_1&nav=5"
					data-id="envelope" data-container="body" data-toggle="popover"
					data-placement="top" data-trigger="hover" data-content="绑定邮箱"><span
					class="icon-ucenter icon-envelope center-block"></span></a>
			</c:if> 
			<c:if test="${session_user.userrelationinfo.emailisPass==1}">
				<a href="javascript:;" data-id="envelope" data-container="body"
					data-toggle="popover" data-placement="top" data-trigger="hover"
					data-content="绑定邮箱"> <span
					class="icon-ucenter icon-revenvelope center-block"></span>
				</a>
			</c:if>
		</li>
		<li>
			<c:if test="${session_user.hasIpsAccount ne 1}">
				<a href="#baofuModal" data-id="baofu" data-container="body"
					data-toggle="modal" data-toggle="popover" data-placement="top"
					data-trigger="hover" data-content="宝付账户"> <span
					class="icon-ucenter icon-baofu center-block"></span></a>
			</c:if> 
			<c:if test="${session_user.hasIpsAccount eq 1}">
				<a href="javascript:;" data-id="baofu" data-container="body"
					data-toggle="popover" data-placement="top" data-trigger="hover"
					data-content="宝付账户"><span
					class="icon-ucenter icon-revbaofu center-block"></span> </a>
			</c:if>
		</li>
			<c:if test="${session_user.userType eq 1 }">
				<li><a href="javascript:;" data-id="vcard" data-container="body"
						data-toggle="popover" data-placement="top" data-trigger="hover"
						data-content="普通会员"><span
						class="icon-ucenter icon-member center-block"></span></a></li>
			</c:if>
			<c:if test="${session_user.userType eq 3 }">
				<li><a href="javascript:;" data-id="vcard" data-container="body"
						data-toggle="popover" data-placement="top" data-trigger="hover"
						data-content="企业用户"><span
						class="icon-ucenter icon-member center-block"></span></a></li>
			</c:if>
			<c:if test="${session_user.userType eq 6 }">
				<li><a href="/member_index/selfInfo.htm?index=0_5_2&nav=5"
							data-id="phone" data-container="body" data-toggle="popover"
							data-placement="top" data-trigger="hover" data-content="理财师"><span
							class="icon-ucenter icon-planner center-block"></span></a>
				</li>
			</c:if>
			<c:if test="${session_user.userType eq 4 }">
				<li>
					<a href="/member_index/selfInfo.htm?index=0_5_2&nav=5"
						data-id="phone" data-container="body" data-toggle="popover"
						data-placement="top" data-trigger="hover" data-content="居间人"><span
						class="icon-ucenter icon-broker center-block"></span></a>
				</li>
			</c:if>
			<c:if test="${session_user.userType eq 2 }">
				<li><a href="javascript:;" data-id="baofu" data-container="body"
						data-toggle="popover" data-placement="top" data-trigger="hover"
						data-content="员工"><span
						class="icon-ucenter icon-employee center-block"></span> </a>
				</li>
			</c:if>
	</ul>
	<c:if test="${newerFlag }">
		<a href="/neweractivity/totask.htm"><img alt="精彩活动" src="${oss }/resources/public/images/activity/bravo.png" style="height: 158px;position: fixed;right: 62px;top: 190px;width: 120px;z-index: 2;"/></a>
	</c:if>
	<div class=" animated wave infinite" style="position: fixed;right: 62px;top: 0;z-index: 20;">
		<a href="/activity201605/tofeedback.htm" target="_blank" style="height: 123px;position: fixed;right: 62px;top: 350px;width: 117px;z-index: 3;"><img alt="精彩活动" src="${oss }/resources/public/images/activity/bravo02.png" /></a>
	</div>
<%-- 	<c:if test="${session_user.isAuthIps ne 1}">
		<a href="javascript:;"
			class="btn btn-default bg-muted micmedium-font text-snow pull-right"
			role="button" id="accredit">宝付授权</a>
	</c:if> --%>
	<c:if test="${session_user.hasIpsAccount ne 1}">
		<a href="#baofuModal"
			class="btn btn-default bg-muted micmedium-font text-snow pull-right"
			data-toggle="modal" role="button" id="open_bf">开通宝付</a>
	</c:if>
	<c:if test="${unReadNum > 0 && session_user.isAuthIps eq 1 }">
		<a href="/member_index/messageBox.htm?index=0_7&nav=5" class="pull-right" style="background: url(${oss}/resources/assets/images/center/news/news-bg-26x26.png) 0 0 no-repeat;width:26px;height:26px;position: relative;">
			<span style="background: url(${oss}/resources/assets/images/center/news/news-ico-22x22.png) 0 0 no-repeat; width:22px; height:21px; display: block;text-align: center;line-height: 21px;font-size:12px;color: white;position: absolute;top:-10px;left:50%;margin-left: 4px;">${unReadNum }</span>
		</a>
	</c:if>
	<c:if test="${birthdayTipFlag eq 1 }">
		<a href="javascript:favorable();" class="pull-right birthbtn" style="background: url(${oss}/resources/assets/images/center/news/birthday-ico-60x55.png) 0 0 no-repeat;width:60px;height:55px; margin:-20px 20px 0 0;"></a>
	</c:if>
</div>
<div class="clearfix">
	<ul class="list-unstyled list-inline col-md-8 cleargap"
		style="padding-top: 20px;">
		<li class="col-md-6"><span class="icon-welthy icon-storage"></span>
			<div>
				<h4 class="micmedium-font text-label">账户余额：</h4>
				<p class="medium-font text-danger">
					&yen;
					<span data-id="fm" id="balance"><fmt:formatNumber type="number"
						value="${session_user.userfundinfo.cashBalance}" pattern="0.00" /></span>
					<span class="text-label normal-font">元</span>
				</p>
				<p class="text-label">
					您有 <span class="badge bg-danger top-align" data-id="fm">${comData.backCount }</span>
					笔待回款
				</p>
				<a href="/recharge/openRecharge.htm?index=8_8"
					class="btn btn-danger btn-sm normal-font" role="button">充值</a> <a
					href="/withdraw/openWithdrawCash.htm?index=8_8"
					class="btn btn-warning btn-sm normal-font" role="button" style="margin:0 10px">提现</a> 
					<c:if test="${session_user.isAuthIps eq 1}">
					<a href="javascript:checkbalance()" class="btn btn-primary btn-sm normal-font"  role="button">余额查询</a>
					</c:if>
			</div></li>
		<li class="col-md-6"><span class="icon-welthy icon-timer"></span>
			<div>
				<h4 class="micmedium-font text-label">历史总收益：</h4>
				<p class="medium-font text-danger">
					&yen;
					<span data-id="fm"><fmt:formatNumber type="number" value="${comData.hostIncome}"
						pattern="0.00" /></span>
					<span class="text-label normal-font">元</span>
				</p>
				<p class="text-label">
					您已经累计 <span class="badge bg-danger top-align" data-id="fm">${comData.loanCount }</span>
					笔投资收益
				</p>
				<c:choose>
					<c:when test="${session_user.userType eq 2}">
						<p class="text-label normal-font">
							推广码：<span class="label label-success top-align">${session_user.staffNo}</span><a
								href="/member_index/friendRecommend.htm?index=3_0&nav=5"
								class="text-label">推广码赚钱？</a>
						</p>
					</c:when>
					<c:otherwise>
						<p class="text-label normal-font">
							推广码：<span class="label label-success top-align">${session_user.id}</span><a
								href="/member_index/friendRecommend.htm?index=3_0&nav=5"
								class="text-label">推广码赚钱？</a>
						</p>						
					</c:otherwise>
				</c:choose>
			</div></li>
	</ul>
	<div class="center-tree"></div>
	<ul class="list-unstyled col-md-4 cleargap">
		<li><span
			class="icon-ucenter icon-calculator center-block texttop-align"></span>
			<p class="text-label micmedium-font">
				资产总额：&yen;
				<span data-id="fm" id="allMoney"><fmt:formatNumber type="number" value="${comData.allMoney}"
					pattern="0.00" /></span>
				元
			</p></li>
		<li class="text-label">-- <span
			class="icon-navlist icon-database center-block texttop-align"></span>
			<p class="micmedium-font">
				账户余额：&yen;
				<span data-id="fm" id="cash_balance"><fmt:formatNumber type="number"
					value="${session_user.userfundinfo.cashBalance}" pattern="0.00" /></span>
				元
			</p>
		</li>
		<li class="text-label">-- <span
			class="icon-navlist icon-dashboard center-block texttop-align"></span>
			<p class="text-label micmedium-font">
				待收本金：&yen;
				<span data-id="fm" id="expectMoney"><fmt:formatNumber type="number" value="${comData.expectMoney }"
					pattern="0.00" /></span>
				元
			</p>
		</li>
		<li class="text-label">-- <span
			class="icon-navlist icon-coin-yen center-block texttop-align"></span>
			<p class="text-label micmedium-font">
				待收收益：&yen;
				<span data-id="fm" id="expectIncome"><fmt:formatNumber type="number" value="${comData.expectIncome }"
					pattern="0.00" /></span>
				元
			</p>
		</li>
		<li class="text-label">-- <span
			class="icon-navlist icon-pig center-block texttop-align"></span>
			<p class="text-label micmedium-font">
				待收佣金：&yen;
				<span data-id="fm" id="expectBonus"><fmt:formatNumber type="number" value="${comData.expectBonus }"
					pattern="0.00" /></span>
				元
			</p>
		</li>
	</ul>
</div>
<!-- 开通宝付模态框 -->
<div class="modal fade" id="baofuModal" tabindex="-1" role="dialog"
	aria-hidden="true">
<style>
.ym-body {
	padding: 30px 35px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
	font-size: 14px;
	color: #d9534f;
}
</style>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">开通宝付</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="ipsForm"
					action="/member/ipsRegistration" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">手机号码 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id=""
								value="${session_user.userrelationinfo.phone }"
								readonly="readonly" placeholder="" data-id="baofu-phone"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">真实姓名 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="my_realName"
								name="name" placeholder="" data-id="baofu-name"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"
								data-content="请输入您的真实姓名"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">身份证号 :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" id="my_cardId"
								name="cardId" placeholder="" data-id="baofu-id"
								data-container="body" data-toggle="popover"
								data-placement="right" data-trigger="focus"
								data-content="请输入您的身份证号"><span
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="now_open">现在开通</button>
			</div>
		</div>
	</div>
</div>
<div style="display: none;">
	<div class="popup-record" id="record">
		<div style="font-size: 18px; position: relative;background: url(${oss}/resources/assets/images/center/news/news-popupBg.png) 0 0 no-repeat;width: 498px;height:705px;">
			<div style="position: absolute;top:114px;left:50%;margin-left: -135px;"><img src="${oss }/resources/assets/images/center/news/birthday-img.png" /></div>
			<div style="position: absolute;top:405px;left:50%;margin-left: -160px;">
				<p style="text-align: center; line-height: 35px; color: #666666;"><span style="font-size: 24px; color: #444444;">恭喜您</span><br>亲爱的<c:choose><c:when test="${session_user.hasIpsAccount eq 1}">${session_user.name}</c:when><c:otherwise>${session_user.userName}</c:otherwise></c:choose>，祝您生日快乐！<br>以下是前海红筹为您准备的投资理财大礼<br><font color="#ff6d6d">提现劵，0.5加息劵，60元红包</p>
			</div>
			<a style="position: absolute;top:590px;left:50%;margin-left: -130px;background-color: #f15252; color:#ffffff; text-decoration: none; padding: 10px 100px;border-radius:25px;" href="/member_index/favorable.htm?index=0_3&nav=5">去查看</a>
		</div>
	</div>
</div>
<script src="${oss}/resources/assets/js/src/center/baofu-modules.js?v=1.0.4"></script>
<script type="text/javascript">
function favorable() {
	$.ajax({
		type : 'post',
		url : '/member_index/receiveBirthday.htm',
		dataType : 'json',
		success : function(jsonObj) {
			var code = jsonObj.code;
			if (code == 0) {
				$.fancybox.open({
					href : "#record",
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
			              closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:30px;top:25px;background:url(/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
			          }
			    });
			} else {
				ymPrompt.alert('您已领取生日礼包了哦',380,180,'提示');
			}
		},
		error : function() {
			ymPrompt.alert('领取时出现错误，请稍后领取！',380,180);
		}
	});
}
</script>