<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

.fancy-packets {
	width: 760px;
	padding-top: 300px;
	background: url(${oss}/resources/public/images/packets-background.png) center
		top no-repeat;
}

.fancy-packets .button {
	position: relative;
	z-index: 1;
	display: block;
	cursor: pointer;
	width: 174px;
	height: 46px;
	background: #eb363b;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-ms-border-radius: 5px;
	-o-border-radius: 5px;
	border-radius: 5px;
	border-bottom: solid #b12125 3px;
	margin: 20px auto 0;
	text-align: center;
	color: #ffce24;
	text-decoration: none;
	font: normal 18px/46px 'Microsoft YaHei', Verdana, Geneva, sans-serif;
}

.fancy-packets .button:after {
	content: '';
	position: absolute;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	transition: all .3s;
	background: rgba(0, 0, 0, .1);
	z-index: -1;
	width: 100%;
	height: 0;
	left: 0;
	top: 0;
}

.fancy-packets .button:hover:after {
	height: 100%;
}

.fancy-packets .button:active {
	border: none;
	padding: 2px 0 1px 0;
	-webkit-box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, 0.2), inset 0 5px 10px
		4px rgba(0, 0, 0, 0.2), inset 0 0 2px 2px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, 0.2), inset 0 5px 10px
		4px rgba(0, 0, 0, 0.2), inset 0 0 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: inset 0 2px 0 0 rgba(0, 0, 0, 0.2), inset 0 5px 10px 4px
		rgba(0, 0, 0, 0.2), inset 0 0 2px 2px rgba(0, 0, 0, 0.3);
}

.fancy-packets dl {
	margin-top: 20px;
}

.fancy-packets dt {
	color: #ffce24;
	font: normal 18px/46px 'Microsoft YaHei', Verdana, Geneva, sans-serif;
}

.fancy-packets dd {
	color: #ffffff;
	font: normal 14px/24px 'Microsoft YaHei', Verdana, Geneva, sans-serif;
	padding: 0 0 0 50px;
	margin: 0;
}
</style>
</head>
<body>
	<div class="fancy-packets">
		<div
			style="font: normal 18px/24px 'Microsoft YaHei', Verdana, Geneva, sans-serif; color: #ffce24; text-align: center">
			恭喜顺利完成注册<br>获得100元红包
		</div>
		<a href="/member_index/member_center.htm?index=0_0_3&nav=5" target="_top" class="button">去开通宝付</a>
		<dl>
			<dt>如何使用红包？</dt>
			<dd>
				1、新用户注册即送100元红包，红包立马到账，但不能直接提现；<br> 2、开通第三方支付渠道后即可激活红包； <br>
				3、激活后，100元红包=无门槛10元红包+投3000元可立即使用30元红包+投8000元可立即使用60元红包；<br>
				4、红包期限为两个月，过期红包失效；<br> 5、红包只有投资优先层可使用；<br>
				6、前海红筹有权根据实际情况暂停或终止本活动；<br> 7、本次活动最终解释权归前海红筹所有；<br>
			</dd>
		</dl>
	</div>
</body>
</html>