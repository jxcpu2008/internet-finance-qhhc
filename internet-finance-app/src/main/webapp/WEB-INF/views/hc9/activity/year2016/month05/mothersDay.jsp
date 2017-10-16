<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="Description" content="" />
<meta name="author" content="Bille.Feng">
<title>前海红筹-中国首家众持平台</title>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<link rel="stylesheet" href="${oss}/resources/public/js/layer/skin/layer.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<script src="${oss}/resources/public/js/layer/layer.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<style>
#motherDay .tag{
	display:block;
	position:absolute;
	left:50%;
}
#motherDay .part_1{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/bgimg_01.jpg) top center no-repeat;
	height:800px;
	position:relative;
	outline-width:0px;  
  	vertical-align:top;
}
#motherDay .part_2{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/bgimg_02.jpg) top center no-repeat;
	height:1200px;
	position:relative;
}
#motherDay .part_3{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/bgimg_03.jpg) top center no-repeat;
	height:426px;
	position:relative;
}
#motherDay .part_1 .spirit{
	background-image:url(${oss }/resources/activity/year2016/month05/mothersDay/images/sprite.png);
	background-repeat:no-repeat;
	width:139px;
	height:164px;
}
#motherDay .part_1 .tag1{
	background-position:0 0;
	margin-left:-250px;
	top:62px;
}
#motherDay .part_1 .tag2{
	background-position:-139px 0;
	margin-left:-110px;
	top:78px;
}
#motherDay .part_1 .tag3{
	background-position:-278px 0;
	margin-left:30px;
	top:62px;
}
#motherDay .part_1 .tag4{
	background-position:-417px 0;
	margin-left:155px;
	top:90px;
}
#motherDay .part_1 .tag5{
	background-position:0 -164px;
	margin-left:-264px;
	top:194px;
}
#motherDay .part_1 .tag6{
	background-position:-139px -164px;
	margin-left:-128px;
	top:224px;
}
#motherDay .part_1 .tag7{
	background-position:-278px -164px;
	margin-left:2px;
	top:224px;
}
#motherDay .part_1 .tag8{
	background-position:-417px -164px;
	margin-left:137px;
	top:228px;
}
#motherDay .part_1 .tag9{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/love-ico.png) 0 0 no-repeat;
	width:686px;
	height:279px;
	margin-left:-346px;
	top:88px;
}
#motherDay .text{
	background-image:url(${oss }/resources/activity/year2016/month05/mothersDay/images/text-ico.png);
	background-repeat:no-repeat;
}
#motherDay .part_1 .tag10{
	width:232px;
	height:16px;
	background-position:0 0;
	margin-left:-116px;
	top:428px;
}
#motherDay .part_1 .tag11{
	width:534px;
	height:30px;
	background-position:0 -18px;
	margin-left:-267px;
	top:462px;
}
#motherDay .part_1 .tag12{
	width:394px;
	height:72px;
	background-position:0 -48px;
	margin-left:-192px;
	top:520px;
}
#motherDay .part_1 .tag13{
	width:135px;
	height:38px;
	background-position:0 -133px;
	margin-left:-65px;
	top:620px;
}
#motherDay .part_1 .tag14{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/title.png) 0 0 no-repeat;
	width:1322px;
	height:62px;
	margin-left:-661px;
	top:700px;
}


#motherDay .part_2 .tag1{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/phone01-178x339.png) 0 0 no-repeat;
	width:178px;
	height:339px;
	margin-left:-434px;
	top:0;
}
#motherDay .part_2 .tag2{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/qrcode-234x192.png) 0 0 no-repeat;
	width:234px;
	height:192px;
	margin-left:-364px;
	top:89px;
}
#motherDay .part_2 .title{
	background-image:url(${oss }/resources/activity/year2016/month05/mothersDay/images/tilte-175x50.png);
	background-repeat:no-repeat;
	width:175px;
	height:50px;
}
#motherDay .part_2 .tag3{
	margin-left:-76px;
	top:62px;
	background-position:0 0;
}
#motherDay .part_2 .tag4{
	font-size:18px;
	color:#663300;
	margin-left:-70px;
	top:120px;
}
#motherDay .part_2 .tag5{
	margin-left:-229px;
	top:404px;
	background-position:0 -50px;
}
#motherDay .part_2 .tag6{
	font-size:18px;
	color:#663300;
	margin-left:-225px;
	top:465px;
	background-position:0 -50px;
}
#motherDay .part_2 .tag7{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/chat-343x219.png) 0 0 no-repeat;
	width:343px;
	height:219px;
	margin-left:110px;
	top:374px;
}
#motherDay .part_2 .tag8{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/nav-133x190.png) 0 0 no-repeat;
	width:133px;
	height:190px;
	margin-left:80px;
	top:384px;
}
#motherDay .part_2 .tag9{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/phone02-178x339.png) 0 0 no-repeat;
	width:178px;
	height:339px;
	margin-left:-434px;
	top:525px;
}
#motherDay .part_2 .tag10{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/wish-204x125.png) 0 0 no-repeat;
	width:204px;
	height:125px;
	margin-left:-330px;
	top:630px;
}
#motherDay .part_2 .tag11{
	background-position:0 -100px;
	margin-left:-65px;
	top:648px;
}
#motherDay .part_2 .tag12{
	font-size:18px;
	color:#663300;
	margin-left:-60px;
	top:712px;
}
#motherDay .part_2 .tag13{
	background-position:0 -150px;
	margin-left:-284px;
	top:946px;
}
#motherDay .part_2 .tag14{
	font-size:18px;
	color:#663300;
	margin-left:-280px;
	top:1006px;
}
#motherDay .part_2 .tag15{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/phone03-178x339.png) 0 0 no-repeat;
	width:178px;
	height:339px;
	margin-left:262px;
	top:850px;
}
#motherDay .part_2 .tag16{
	background:url(${oss }/resources/activity/year2016/month05/mothersDay/images/chat02-253x131.png) 0 0 no-repeat;
	width:253px;
	height:131px;
	margin-left:102px;
	top:968px;
}
#motherDay .part_3 .tag1{
	font-size:14px;
	color:#663300;
	line-height:20px;
	margin-left:-470px;
	top:40px;
}
#motherDay .part_3 .tag2{
	width:394px;
	height:72px;
	background-position:0 -48px;
	margin-left:-192px;
	top:255px;
}
</style>
</head>
<body>
	<!--Container begin-->
    <div id="container"> 
  	 <jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
      <!--[if lt IE 8]>
      <div class="cmpt_bar">
          您现在使用的浏览器版本过低，可能会导致浏览效果和信息的缺失。建议立即升级到 <a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" target="_blank" title="免费升级至IE8浏览器">Internet Explorer 8</a> 或 <a href="http://baoku.360.cn/soft/show/appid/100923" target="_blank" title="免费升级至360安全浏览器">360安全浏览器</a> ，安全更放心！
      </div>
      <![endif]-->
  
  <!--Main begin-->
 <main id="motherDay" role="main">
        <div class="part_1 scene">
        	<span class="spirit tag tag1 animated bounceIn" data-delay="300"></span>
        	<span class="spirit tag tag2 animated bounceIn" data-delay="450"></span>
        	<span class="spirit tag tag3 animated bounceIn" data-delay="600"></span>
        	<span class="spirit tag tag4 animated bounceIn" data-delay="750"></span>
        	<span class="spirit tag tag5 animated bounceIn" data-delay="900"></span>
        	<span class="spirit tag tag6 animated bounceIn" data-delay="1050"></span>
        	<span class="spirit tag tag7 animated bounceIn" data-delay="1200"></span>
        	<span class="spirit tag tag8 animated bounceIn" data-delay="1350"></span>
            <span class="tag tag9 animated bounceIn" data-delay="1350"></span>
            <span class="text tag tag10 animated fadeInUp" data-delay="1650" data-easing="ease-out"></span>
            <span class="text tag tag11 animated fadeInUp" data-delay="1800" data-easing="ease-out"></span>
            <a id="ljzc" href="javascript:;" class="text tag tag12 animated fadeInUp" data-delay="1950"></a>
            <span  class="text tag tag13 animated fadeInUpDes infinite" data-delay="2500"></span>
            <span  class="text tag tag14 animated bounceIn" data-delay="2500" data-easing="ease-out"></span>
        </div>
        
        <div class="part_2 scene">
            <span class="tag tag1 animated bounceInLeft" data-delay="400"></span>
            <span class="tag tag2 animated bounceInLeft" data-delay="200"></span>
            <span class="tag tag3 title animated fadeInDown" data-delay="500"></span>
            <span class="tag tag4 animated fadeInUp" data-delay="600">扫描二维码，关注【前海红筹】微信公众号</span>
            <span class="tag tag5 title animated fadeInDown" data-delay="700"></span>
            <span class="tag tag6 animated fadeInUp" data-delay="800">参加”为爱发声“活动 </span>
            <span class="tag tag7 animated bounceInRight" data-delay="1200"></span>
            <span class="tag tag8 animated bounceInRight" data-delay="900"></span>
            <span class="tag tag9 animated bounceInLeft" data-delay="1300"></span>
            <span class="tag tag10 animated bounceInLeft" data-delay="1500"></span>
            <span class="tag tag11 title animated fadeInDown" data-delay="1600"></span>
            <span class="tag tag12 animated fadeInUp" data-delay="1700">把对母亲的爱说出来</span>
            <span class="tag tag13 title animated fadeInDown" data-delay="1800"></span>
            <span class="tag tag14 animated fadeInUp" data-delay="1900">把分享后的截图+注册手机号发送至微信后台</span>
            <span class="tag tag15 animated bounceInRight" data-delay="2000"></span>
            <span class="tag tag16 animated bounceInRight" data-delay="2100"></span>
        </div>
        
        <div class="part_3">
        	<span class="tag tag1">
            	活动规则：<br>
                    1.活动时间为2016.05.07-05.10<br>
                    2.在完成弹幕墙后，请进行关注并分享到您的微信朋友圈里；<br>
                    3.活动时间内，新老用户进行微信转发后，通过“截图+回复注册手机号码”的形式发送至前海红筹官方微信号，即可获得的母亲节专享红包，每位参与用户可领取一次；<br>
                    4.客服接收并完成审核后，将在3-5个工作日内发放专享红包，用户可在“会员中心” - “我的优惠券”中进行查询；<br>
                    5.温馨提示：为红包顺利领取，请务必关注微信公众号；
            </span>
            <a id="register" href="javascript:;" class="text tag tag2"></a>
        </div>
  </main>
  <!--Main end--> 
  
 	<!--footer-->
  	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
  <!--Footer end--> 
  
  
</div>
<!--Container end-->

<script src="${oss }/resources/public/js/jquery.appear.js"></script>
<script>
//设置动画参数
function transferParam(){
	if(!$(".animated").size())return false;
	$(".animated").each(function(index, element) {
		var thisObj = $(this);
		if(typeof(thisObj.attr("data-delay")) != "undefined"){
			var delay = thisObj.attr("data-delay") + "ms";
			thisObj.css({'animation-delay':delay,'-webkit-animation-delay':delay,'-moz-animation-delay':delay});
		};
		if(typeof(thisObj.attr("data-duration")) != "undefined"){
			var duration = thisObj.attr("data-duration") + "ms";
			thisObj.css({'animation-duration':duration,'-webkit-animation-duration':duration,'-moz-animation-duration':duration});
		};
		if(typeof(thisObj.attr("data-easing")) != "undefined"){
			var easing = thisObj.attr("data-easing");
			thisObj.css({'animation-easing':easing,'-webkit-animation-delay':easing,'-moz-animation-delay':easing});
		};
	});
};
transferParam();
$(function(){
	//点击立即注册
    $("#ljzc").click(function(){
    	var url = "${https }/visitor/to-regist"; 
    	location.href = url;
    });
    $("#register").click(function(){
    	var url = "${https }/visitor/to-regist"; 
    	location.href = url;
    });
	$('.scene').appear();
	$('.scene').each(function(index, element) {
        if(index != 0){
			$(this).find(".animated").hide();
		}
    });
	$(document.body).on('appear', '.scene', function(e, $affected) {
		var _this=$(this);
		_this.find('.animated').show();
	});
	$(document.body).on('disappear', '.scene', function(e, $affected) {
		var _this=$(this);
		_this.find('.animated').hide();
	});
});
</script>
</body>
</html>