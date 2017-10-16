<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--[if lt IE 8]>
  <div class="cmpt_bar">
      您现在使用的浏览器版本过低，可能会导致浏览效果和信息的缺失。建议立即升级到 <a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" target="_blank" title="免费升级至IE8浏览器">Internet Explorer 8</a> 或 <a href="http://baoku.360.cn/soft/show/appid/100923" target="_blank" title="免费升级至360安全浏览器">360安全浏览器</a> ，安全更放心！
  </div>
  <![endif]-->
<!--header-->

<div id="header" role="contentinfo">
	<div class="top-bar">
		<div class="inner clearfix">
			<div class="fl-l">客服热线：400-822-3499</div>
            <div class="line fl-l"></div>
        	<div class="fl-l">
            	<a href="javascript:;" class="icon wechat">
                	<div class="hide"><img src="${oss }/resources/assets/images/home/qrcode.jpg" width="108" height="108" id="qrcode" /></div>
                </a>
                <a href="http://weibo.com/p/1006065344998136/home?from=page_100606&mod=TAB#place" target="_blank" class="icon sina"></a>
                <a href="http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzkzODA2MTM0OV8zNTYzOTJfNDAwODIyMzQ5OV8yXw" target="_blank" class="icon tencent"></a>
                <a href="javascript:;" class="icon quns">
                	<div class="hide">
                    	<div id="qunsBox">                                
                            <a target="_blank" href="http://jq.qq.com/?_wv=1027&k=27IDYp7" target="_blank"><img src="${oss }/resources/assets/images/home/QQqun.png" style="margin-right:10px" /><span  style="padding-bottom:5px; border-bottom:1px dashed #efefef;">前海红筹新手群</span></a><br>
                            <a target="_blank" href="http://jq.qq.com/?_wv=1027&k=2A5vLra" target="_blank"><img src="${oss }/resources/assets/images/home/QQqun.png" style="margin-right:10px" />前海红筹官方交流群</a>
                        </div>
                    </div>
                </a>
            </div>
            <div class="line fl-l"></div>
            <div class="fl-l">
            	<a href="/visitor/appDownloadExplain.htm" class="icon app"><span></span><em>红筹钱包APP</em>
                	<div class="hide"><img src="${oss }/resources/assets/images/home/app-qrcode.png" width="186" height="100" id="qrcodeApp" /></div>
                </a>
            </div>
			
			<p class="fl-r">
				<c:if test="${empty session_user }">
					<a href="${https }/visitor/to-login">登录</a>
					<span class="pl10 pr10">|</span>
					<a href="${https }/visitor/to-regist">免费注册</a>
					<span class="pl10 pr10">|</span>
					<a href="/helper/toHelper.htm?sign=1">新手指引</a>
					<span class="pl10 pr10">|</span>
					<a href="javascript:;">精彩活动</a>
					<span class="pl10 pr10">|</span>
					<a href="/neweractivity/totask.htm">新手任务</a>
				</c:if>
				<c:if test="${!empty session_user }">
					<span id="sayHello"></span>，
                	[<a href="/member_index/member_center.htm?index=0_0"
						style="color: #d9534f; margin: 0;"><c:set var="name"
							value="${session_user.userName}" />${name.substring(0,2)}***${name.substring(name.length()-2,name.length()) }</a>]<span
						class="pl10 pr10"></span><a href="javascript:;" id="loginOut_new">退出</a>
					<span class="pl10 pr10">|</span>
					<a href="/recharge/openRecharge.htm?index=8_8"
						style="color: #d9534f;">充值</a>
					<span class="pl10 pr10">|</span>
					<a href="/withdraw/openWithdrawCash.htm?index=8_8"
						style="color: #d9534f;">提现</a>
					<span class="pl10 pr10">|</span>
					<a href="/helper/toHelper.htm?sign=1">帮助中心</a>
					<span class="pl10 pr10">|</span>
					<a href="javascript:;">精彩活动</a>
					<span class="pl10 pr10">|</span>
					<a href="/neweractivity/totask.htm">新手任务</a>
				</c:if>
			</p>
		</div>
	</div>
	<div class="inner clearfix pt40 pb40">
		<a href="/index.htm" class="fl-l"><img
			src="${oss }/resources/assets/images/home/logo.png" alt="前海红筹" /></a>
		<nav role="navigation" id="navigation" class="fl-r">
			<a href="/index.htm">首页</a> <a href="/loaninfo/loanList.htm?nav=2">我要众持</a>
			<a href="/visitor/toSafeSecurity.htm?nav=3">安全保障</a> <a
				href="/toUserGuide.htm">新手指引</a> <a
				href="/member_index/member_center.htm?index=0_0&nav=5">我的账户</a> <a
				href="/to/single-6-5.htm?nav=6">关于我们</a>
		</nav>
	</div>
</div>
<div style="display: none">
	<div id="loginOutBox">
		<div class="tc-title">
			<span class="text">是否退出</span><span class="ico-X"><a
				href="javascript:$.fancybox.close();">×</a></span>
		</div>
		<div class="tc-content">是否确认安全退出？</div>
		<div class="tc-btn">
			<a class="tc-btn-red" href="/update_info/login_out">确定</a><a
				class="tc-btn-yellow" href="javascript:$.fancybox.close();">取消</a>
		</div>
	</div>
</div>
<!--header end-->

<script>
$(function(){
	
	$("#header .wechat").poshytip({
		content: $("#qrcode"),
		alignX: "center",
		alignY: "top"
	});
	$("#header .quns").poshytip({
		content: $("#qunsBox"),
		alignX: "center",
		alignY: "top"
	});
	$("#header .app").poshytip({
		content: $("#qrcodeApp"),
		alignX: "center",
		alignY: "top"
	});
	
});
</script>