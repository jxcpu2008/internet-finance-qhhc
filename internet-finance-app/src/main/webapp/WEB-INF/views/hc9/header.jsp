<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <script>

         var sUserAgent = navigator.userAgent.toLowerCase();  
         var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";  
         var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";  
         var bIsMidp = sUserAgent.match(/midp/i) == "midp";  
         var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";  
         var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";  
         var bIsAndroid = sUserAgent.match(/android/i) == "android";  
         var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";  
         var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";  
         if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM ){  
             window.location.href="/h5/index.htm";
         } 

</script> -->
<!-- 页头 -->
<header class="cleargap">
	<div class="container clearfix">
		<div class="pull-left" style="border-right:none;">
			<ul class="list-unstyled list-inline">
				<li style="border-right:1px solid #ccc;">客服热线：400-822-3499</li>
				<li><a href="javascript:;" class="icon-contact icon-wechat"></a> <a
					href="http://weibo.com/p/1006065344998136/home?from=page_100606&mod=TAB#place"
					target="_blank" class="icon-contact icon-sina"></a> <a
					href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODA2MTM0OV8zNTYzOTJfNDAwODIyMzQ5OV8yXw"
					target="_blank" class="icon-contact icon-qq"></a> <a
					href="javascript:;" class="icon-contact icon-quns"></a></li>
				<li style="border-right:none;"><a href="/visitor/appDownloadExplain.htm" class="icon-contact icon-app"></a><a class="fl-l pl5 icon-app" href="/visitor/appDownloadExplain.htm" style="text-decoration: none;"><font color="#999999">红筹钱包APP</font></a></li>
			</ul>
			<div class="ewm"></div>
			<div class="ewm_app"></div>
			<div class="ewm_quns">
				<a target="_blank" href="http://qm.qq.com/cgi-bin/qm/qr?k=rTrHVPsw3_VSuviYS8x0U0A53xn1POv0" class="one" style="overflow: hidden; *zoom:1;">
					<em></em><span>前海红筹新手群</span>
				</a>
				<div class="clear"></div>
				<a target="_blank"  href="http://qm.qq.com/cgi-bin/qm/qr?k=tkdcfNjfvGN5z4VmuoowBgFMkkCOpVlP" style="overflow: hidden; *zoom:1;">
					<em></em><span class="border">前海红筹官方交流群</span>
				</a>
				<div class="clear"></div>
			</div>
		</div>
		<c:if test="${empty session_user }">
			<div class="pull-right">
				<a href="${https }/visitor/to-login">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="${https }/visitor/to-regist">免费注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="/helper/toHelper.htm?sign=1">帮助中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript:;">精彩活动</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a
					href="/neweractivity/totask.htm">新手任务</a>
			</div>
		</c:if>
		<c:if test="${!empty session_user }">
			<div class="pull-right">
				<span id="sayHello"></span>，[<a
					href="/member_index/member_center.htm?index=0_0" class="whoami"><c:set
						var="name" value="${session_user.userName}" />${name.substring(0,2)}***${name.substring(name.length()-2,name.length()) }</a>]&nbsp;&nbsp;
				<a href="javascript:;" id="loginOut">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="/recharge/openRecharge.htm?index=8_8" class="whoami">充值</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="/withdraw/openWithdrawCash.htm?index=8_8" class="whoami">提现</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="/helper/toHelper.htm?sign=1">帮助中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript:;">精彩活动</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a
					href="/neweractivity/totask.htm">新手任务</a>
			</div>
		</c:if>
	</div>
</header>
<!-- 导航 -->
<main class="container clearfix"> <a href="/index.htm"><img
	src="${oss}/resources/assets/images/home/logo.png"
	class="img-responsive" alt="前海红筹"></a>
<nav class="menu-hamburger pull-right">
	<button type="button" class="btn btn-lg bg-danger text-snow">
		<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
	</button>
</nav>
<nav class="pull-right cleargap">

	<ul class="nav nav-pills">
		<li><a href="/index.htm">首页</a></li>
		<li><a href="/loaninfo/loanList.htm?nav=2">我要众持</a></li>
		<li><a href="/visitor/toSafeSecurity.htm?nav=3">安全保障</a></li>
		<li><a href="/toUserGuide.htm">新手指引</a></li>
		<li><a href="/member_index/member_center.htm?index=0_0&nav=5">我的账户</a></li>
		<li><a href="/to/single-6-5.htm?nav=6">关于我们</a></li>
	</ul>
</nav>
</main>
<!-- 计算器  -->
<div class="modal fade" id="calculateModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">投标收益计算器</h4>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label text-label">投标金额：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="loan-1"> <small
								class="help-block text-danger error-tips"></small>
						</div>
						<div class="input-group-addon">元</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label text-label">年化收益：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="loan-2"> <small
								class="help-block text-danger error-tips"></small>
						</div>
						<div class="input-group-addon">%</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label text-label">投资期限：</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="loan-3"> <small
								class="help-block text-danger error-tips"></small>
						</div>
						<div class="input-group-addon">
							<span class="date">个月</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label text-label">投标类型：</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="LoanType" value="2" checked="checked" /> 普通
							</label> <label class="radio-inline"> <input type="radio"
								name="LoanType" value="1" /> 短期
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label smmedium-font">本息合计(元)：</label>
						<div class="col-sm-8 medium-font all-money">0</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger calculate">立即计算收益</button>
			</div>
		</div>
	</div>
</div>
<script>
	//隐藏收益计算器
	/* var currentUrl = location.pathname;
	if (currentUrl.substring(0, 14) != "/find_password") {
		document
				.write('<script type=\"text\/javascript\" src=\"\/resources\/js\/talkUser.js\"><\/script>');
	} else {
		$("#calculateModal").hide();
	} */
	// 注销
	/* $("#loginOut").click(function() {
		ymPrompt.confirmInfo('是否确认安全退出？', 320, 160, '是否退出', function(tp) {
			if (tp == 'ok') {
				window.location.href = '/update_info/login_out';
			}
		});
	}); */
</script>