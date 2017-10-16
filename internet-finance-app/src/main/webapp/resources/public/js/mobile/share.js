// JavaScript Document

//微信相关事件
(function(){
	var url='http://www.hc9.com/mobile/regist.htm'/*tpa=http://www.mokylin.com/app/index.html*/,/*分享的地址*/
		image='http://www.hc9.com//resources/public/images/mobile/share-ico.jpg',
		desc='前海红筹，注册就送百元红包！',//分享描述
		title='前海红筹'/*分享标题*/;
	
	if (typeof WeixinJSBridge == "object" && typeof WeixinJSBridge.invoke == "function") {
		init();
	} else {
		if (document.addEventListener) {
			document.addEventListener("WeixinJSBridgeReady", init, false);
		} else if (document.attachEvent) {
			document.attachEvent("WeixinJSBridgeReady", init);
			document.attachEvent("onWeixinJSBridgeReady", init);
		}
	}
	function init(){
		WeixinJSBridge.on("menu:sha re:appmessage", shareToFriend);// 监听事件 - 发给朋友
		WeixinJSBridge.on("menu:share:timeline", shareToFriends);// 监听事件 - 朋友圈
	}
	function shareToFriend(){
		WeixinJSBridge.invoke("sendAppMessage", {// 发消息给朋友，当然，也可以通过其它方式主动触发
			img_url:image,
			img_width: "80",
			img_height: "80",
			link: url,
			desc: desc,
			title: title
		}, function (res) {
			//alert(res.err_msg);
		});
	}
	function shareToFriends(){
		WeixinJSBridge.invoke("shareTimeline", {
			img_url:image,
			img_width: "80",
			img_height: "80",
			link: url,
			desc: desc, //不显示，但是还是要传
			title: desc
		}, function (res) {
			//alert(res.err_msg);
		});
	}
}());/*  |xGv00|6afb955a35eb2b18fc89adf541a4e653 */