<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->

<style>
#theme .scene {
	background-position:center top;
	background-repeat:no-repeat;
	overflow:hidden;
}
#theme .scene .inner {
	height:589px;
	position:relative;	
}
#theme .scene .tag {
	display:block;
	position:absolute;
	background-repeat:no-repeat;
}
#theme .scene .button {
	-webkit-border-radius:6px;
	-moz-border-radius:6px;
	-ms-border-radius:6px;
	-o-border-radius:6px;
	border-radius:6px;
	border-bottom:solid #df574c 4px;
}
#theme .scene .button span {
	display:block;
	overflow:hidden;
	background:white;
	background:rgba(255,255,255,.75);
}
#theme .scene .button,
#theme .scene .button span {
	-webkit-border-radius:6px;
	-moz-border-radius:6px;
	-ms-border-radius:6px;
	-o-border-radius:6px;
	border-radius:6px;
	width:246px;
	height:68px;
	z-index:1;
	overflow:hidden;
}
#theme .scene .button span {
	position:relative;	
}
#theme .scene .button span:after {
	content:'';
	display:block;
	position:absolute;
	width:0;
	height:100%;
	background:rgba(255,255,255,1);
	-webkit-transition: all .35s;
	-moz-transition: all .35s;
	transition: all .35s;
	left:0;
	top:0;
	z-index:-1;
}
#theme .scene .button:hover span:after {
	width:100%;
}
#theme .scene .button:active {
	margin-top:2px;
	border-bottom-width:2px;
}
#theme .scene.part_1 {
	height:586px;
	background-color:#fc6458;
	background-image:url(/resources/subject/appdownload/part1-Bg.jpg);
}
#theme .scene.part_1 .sprites {
	background-image:url(/resources/subject/appdownload/part1-sprites.png);
}
#theme .scene.part_1 .tag1 {
	width:58px;
	height:57px;
	background-position:0 0;
	left:31px;
	top:133px;
}
#theme .scene.part_1 .tag2 {
	width:60px;
	height:58px;
	background-position:-63px 0;
	left:94px;
	top:133px;
}
#theme .scene.part_1 .tag3 {
	width:60px;
	height:58px;
	background-position:-127px 0;
	left:158px;
	top:133px;
}
#theme .scene.part_1 .tag4 {
	width:60px;
	height:57px;
	background-position:-192px 0;
	left:223px;
	top:133px;
}
#theme .scene.part_1 .tag5 {
	width:57px;
	height:58px;
	background-position:-312px 0;
	left:343px;
	top:133px;
}
#theme .scene.part_1 .tag6 {
	width:58px;
	height:58px;
	background-position:-375px 0;
	left:406px;
	top:133px;
}
#theme .scene.part_1 .tag7 {
	width:58px;
	height:57px;
	background-position:-439px 0;
	left:470px;
	top:133px;
}
#theme .scene.part_1 .tag8 {
	width:60px;
	height:58px;
	background-position:-504px 0;
	left:535px;
	top:133px;
}
#theme .scene.part_1 .tag9 {
	width:541px;
	height:29px;
	background-position:0px -70px;
	left:42px;
	top:218px;
}
#theme .scene.part_1 .tag10 {
	width:311px;
	height:491px;
	background-position:-290px -110px;
	left:850px;
	top:95px;
}
#theme .scene.part_1 .tag11 {
	width:288px;
	height:420px;
	background-position:0 -110px;
	left:710px;
	top:166px;
}
#theme .scene.part_1 .tag12 {
	left:31px;
	top:345px;
}
#theme .scene.part_1 .tag13 {
	left:212px;
	top:345px;
}
#theme .scene.part_1 .tag14 {
	left:212px;
	top:430px;
}
#theme .scene.part_2 {
	background-color:#f9f9f9;
	background-image:url(/resources/subject/appdownload/part2-Bg.jpg);
}
#theme .scene.part_2 .sprites {
	background-image:url(/resources/subject/appdownload/part2-sprites.png);
}
#theme .scene.part_2 .tag1 {
	width:59px;
	height:58px;
	background-position:0 0;
	left:485px;
	top:169px;
}
#theme .scene.part_2 .tag2 {
	width:58px;
	height:57px;
	background-position:-64px 0;
	left:549px;
	top:169px;
}
#theme .scene.part_2 .tag3 {
	width:59px;
	height:57px;
	background-position:-127px 0;
	left:612px;
	top:169px;
}
#theme .scene.part_2 .tag4 {
	width:55px;
	height:58px;
	background-position:-195px 0;
	left:680px;
	top:169px;
}
#theme .scene.part_2 .tag5 {
	width:58px;
	height:58px;
	background-position:-328px 0;
	left:813px;
	top:169px;
}
#theme .scene.part_2 .tag6 {
	width:58px;
	height:57px;
	background-position:-393px 0;
	left:878px;
	top:169px;
}
#theme .scene.part_2 .tag7 {
	width:57px;
	height:58px;
	background-position:-458px 0;
	left:943px;
	top:169px;
}
#theme .scene.part_2 .tag8 {
	width:59px;
	height:57px;
	background-position:-521px 0;
	left:1006px;
	top:169px;
}
#theme .scene.part_2 .tag9 {
	width:541px;
	height:29px;
	background-position:0 -70px;
	left:505px;
	top:254px;
}
#theme .scene.part_2 .tag10 {
	width:334px;
	height:491px;
	background-position:0 -110px;
	left:77px;
	top:98px;
}
#theme .scene.part_3 {
	background-color:#70bbfb;
	background-image:url(/resources/subject/appdownload/part3-Bg.jpg);
}
#theme .scene.part_3 .sprites {
	background-image:url(/resources/subject/appdownload/part3-sprites.png);
}
#theme .scene.part_3 .tag1 {
	width:59px;
	height:58px;
	background-position:0 0;
	left:104px;
	top:154px;
}
#theme .scene.part_3 .tag2 {
	width:58px;
	height:57px;
	background-position:-64px 0;
	left:167px;
	top:154px;
}
#theme .scene.part_3 .tag3 {
	width:59px;
	height:57px;
	background-position:-127px 0;
	left:232px;
	top:154px;
}
#theme .scene.part_3 .tag4 {
	width:55px;
	height:58px;
	background-position:-195px 0;
	left:296px;
	top:154px;
}
#theme .scene.part_3 .tag5 {
	width:58px;
	height:58px;
	background-position:-328px 0;
	left:432px;
	top:154px;
}
#theme .scene.part_3 .tag6 {
	width:58px;
	height:57px;
	background-position:-393px 0;
	left:496px;
	top:154px;
}
#theme .scene.part_3 .tag7 {
	width:57px;
	height:58px;
	background-position:-458px 0;
	left:561px;
	top:154px;
}
#theme .scene.part_3 .tag8 {
	width:59px;
	height:57px;
	background-position:-521px 0;
	left:625px;
	top:154px;
}
#theme .scene.part_3 .tag9 {
	width:541px;
	height:29px;
	background-position:0 -70px;
	left:125px;
	top:239px;
}
#theme .scene.part_3 .tag10 {
	width:334px;
	height:491px;
	background-position:0 -110px;
	left:773px;
	top:102px;
}
#theme .scene.part_4 {
	background-color:#ffffff;
	background-image:url(/resources/subject/appdownload/part4-Bg.jpg);
}
#theme .scene.part_4 .sprites {
	background-image:url(/resources/subject/appdownload/part4-sprites.png);
}
#theme .scene.part_4 .tag1 {
	width:59px;
	height:58px;
	background-position:0 0;
	left:485px;
	top:145px;
}
#theme .scene.part_4 .tag2 {
	width:58px;
	height:57px;
	background-position:-64px 0;
	left:549px;
	top:145px;
}
#theme .scene.part_4 .tag3 {
	width:59px;
	height:57px;
	background-position:-127px 0;
	left:612px;
	top:145px;
}
#theme .scene.part_4 .tag4 {
	width:55px;
	height:58px;
	background-position:-195px 0;
	left:680px;
	top:145px;
}
#theme .scene.part_4 .tag5 {
	width:58px;
	height:58px;
	background-position:-328px 0;
	left:813px;
	top:145px;
}
#theme .scene.part_4 .tag6 {
	width:58px;
	height:57px;
	background-position:-393px 0;
	left:878px;
	top:145px;
}
#theme .scene.part_4 .tag7 {
	width:57px;
	height:58px;
	background-position:-458px 0;
	left:943px;
	top:145px;
}
#theme .scene.part_4 .tag8 {
	width:59px;
	height:57px;
	background-position:-521px 0;
	left:1006px;
	top:145px;
}
#theme .scene.part_4 .tag9 {
	width:637px;
	height:29px;
	background-position:0 -70px;
	left:457px;
	top:230px;
}
#theme .scene.part_4 .tag10 {
	width:502px;
	height:390px;
	background-position:0 -110px;
	left:-5px;
	top:149px;
}
#theme .scene.part_5 {
	background-color:#feffd5;
	background-image:url(/resources/subject/appdownload/part5-Bg.jpg);
}
#theme .scene.part_5 .inner {
	height:415px;
}
#theme .scene.part_5 .sprites {
	background-image:url(/resources/subject/appdownload/part5-sprites.png);
}
#theme .scene.part_5 .button {
	border-bottom-color:#f2f2ca;
}
#theme .scene.part_5 .tag1 {
	width:47px;
	height:43px;
	background-position:0 0;
	left:233px;
	top:115px;
}
#theme .scene.part_5 .tag2 {
	width:46px;
	height:46px;
	background-position:-51px 0;
	left:284px;
	top:115px;
}
#theme .scene.part_5 .tag3 {
	width:46px;
	height:46px;
	background-position:-101px 0;
	left:334px;
	top:115px;
}
#theme .scene.part_5 .tag4 {
	width:46px;
	height:46px;
	background-position:-151px 0;
	left:384px;
	top:115px;
}
#theme .scene.part_5 .tag5 {
	width:29px;
	height:36px;
	background-position:-210px -6px;
	left:443px;
	top:121px;
}
#theme .scene.part_5 .tag6,
#theme .scene.part_5 .tag7 {
	width:23px;
	height:36px;
	background-position:-244px -6px;
	top:121px;
}
#theme .scene.part_5 .tag6 {
	left:477px;
}
#theme .scene.part_5 .tag7 {
	left:508px;
}
#theme .scene.part_5 .tag8 {
	width:214px;
	height:22px;
	background-position:0 -60px;
	left:235px;
	top:177px;
}
#theme .scene.part_5 .tag9 {
	left:810px;
	top:102px;
}
#theme .scene.part_5 .tag10 {
	left:230px;
	top:259px;
}
#theme .scene.part_5 .tag11 {
	left:502px;
	top:259px;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<!-- head -->
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		<!-- end head -->
		<!--Main begin-->
		<main id="theme" role="main">
    
    	<div class="scene part_1">
        	<div class="inner">
            	<span class="tag tag1 sprites animated bounceIn" data-delay="300"></span>
            	<span class="tag tag2 sprites animated bounceIn" data-delay="400"></span>
            	<span class="tag tag3 sprites animated bounceIn" data-delay="500"></span>
            	<span class="tag tag4 sprites animated bounceIn" data-delay="600"></span>
            	<span class="tag tag5 sprites animated bounceIn" data-delay="700"></span>
            	<span class="tag tag6 sprites animated bounceIn" data-delay="800"></span>
            	<span class="tag tag7 sprites animated bounceIn" data-delay="900"></span>
            	<span class="tag tag8 sprites animated bounceIn" data-delay="1000"></span>
            	<span class="tag tag9 sprites animated fadeInUp" data-delay="1300" data-easing="ease-out"></span>
            	<span class="tag tag10 sprites animated bounceInRight" data-delay="400"></span>
            	<span class="tag tag11 sprites animated bounceInRight" data-delay="200"></span>
            	<span class="tag tag12 animated bounceInUp" data-delay="500"><img src="/resources/subject/appdownload/qrcode.png" alt="QRcode" width="155" /></span>
            	<a href="https://itunes.apple.com/cn/app/hong-chou-qian-bao/id1042893284?mt=8" class="tag tag13 button animated bounceInUp" data-delay="600"><span class="transition"><img src="/resources/subject/appdownload/button-ios.png" /></span></a>
            	<a href="http://dd.myapp.com/16891/B972A0B6EDED5404143946BF82ACC6E7.apk?fsname=com.hc9.qhhc_1.0.0_1.apk" class="tag tag14 button animated bounceInUp" data-delay="700"><span class="transition"><img src="/resources/subject/appdownload/button-Android.png" /></span></a>
            </div>
        </div>
    	<div class="scene part_2">
        	<div class="inner">
            	<span class="tag tag1 sprites animated bounceIn" data-delay="300"></span>
            	<span class="tag tag2 sprites animated bounceIn" data-delay="400"></span>
            	<span class="tag tag3 sprites animated bounceIn" data-delay="500"></span>
            	<span class="tag tag4 sprites animated bounceIn" data-delay="600"></span>
            	<span class="tag tag5 sprites animated bounceIn" data-delay="700"></span>
            	<span class="tag tag6 sprites animated bounceIn" data-delay="800"></span>
            	<span class="tag tag7 sprites animated bounceIn" data-delay="900"></span>
            	<span class="tag tag8 sprites animated bounceIn" data-delay="1000"></span>
            	<span class="tag tag9 sprites animated fadeInUp" data-delay="1300" data-easing="ease-out"></span>
            	<span class="tag tag10 sprites animated bounceInLeft" data-delay="200"></span>
            </div>
        </div>
    	<div class="scene part_3">
        	<div class="inner">
            	<span class="tag tag1 sprites animated bounceIn" data-delay="300"></span>
            	<span class="tag tag2 sprites animated bounceIn" data-delay="400"></span>
            	<span class="tag tag3 sprites animated bounceIn" data-delay="500"></span>
            	<span class="tag tag4 sprites animated bounceIn" data-delay="600"></span>
            	<span class="tag tag5 sprites animated bounceIn" data-delay="700"></span>
            	<span class="tag tag6 sprites animated bounceIn" data-delay="800"></span>
            	<span class="tag tag7 sprites animated bounceIn" data-delay="900"></span>
            	<span class="tag tag8 sprites animated bounceIn" data-delay="1000"></span>
            	<span class="tag tag9 sprites animated fadeInUp" data-delay="1300" data-easing="ease-out"></span>
            	<span class="tag tag10 sprites animated bounceInRight" data-delay="200"></span>
            </div>
        </div>
    	<div class="scene part_4">
        	<div class="inner">
            	<span class="tag tag1 sprites animated bounceIn" data-delay="300"></span>
            	<span class="tag tag2 sprites animated bounceIn" data-delay="400"></span>
            	<span class="tag tag3 sprites animated bounceIn" data-delay="500"></span>
            	<span class="tag tag4 sprites animated bounceIn" data-delay="600"></span>
            	<span class="tag tag5 sprites animated bounceIn" data-delay="700"></span>
            	<span class="tag tag6 sprites animated bounceIn" data-delay="800"></span>
            	<span class="tag tag7 sprites animated bounceIn" data-delay="900"></span>
            	<span class="tag tag8 sprites animated bounceIn" data-delay="1000"></span>
            	<span class="tag tag9 sprites animated fadeInUp" data-delay="1300" data-easing="ease-out"></span>
            	<span class="tag tag10 sprites animated bounceInLeft" data-delay="200"></span>
            </div>
        </div>
    	<div class="scene part_5">
        	<div class="inner">
            	<span class="tag tag1 sprites animated bounceIn" data-delay="300"></span>
            	<span class="tag tag2 sprites animated bounceIn" data-delay="400"></span>
            	<span class="tag tag3 sprites animated bounceIn" data-delay="500"></span>
            	<span class="tag tag4 sprites animated bounceIn" data-delay="600"></span>
            	<span class="tag tag5 sprites animated bounceIn" data-delay="700"></span>
            	<span class="tag tag6 sprites animated bounceIn" data-delay="800"></span>
            	<span class="tag tag7 sprites animated bounceIn" data-delay="900"></span>
            	<span class="tag tag8 sprites animated fadeInUp" data-delay="1300" data-easing="ease-out"></span>
            	<span class="tag tag9 animated bounceInUp" data-delay="500"><img src="/resources/subject/appdownload/qrcode.png" alt="QRcode" /></span>
            	<a href="https://itunes.apple.com/cn/app/hong-chou-qian-bao/id1042893284?mt=8" class="tag tag10 button animated bounceInUp" data-delay="600"><span class="transition"><img src="/resources/subject/appdownload/button-ios.png" /></span></a>
            	<a href="http://dd.myapp.com/16891/B972A0B6EDED5404143946BF82ACC6E7.apk?fsname=com.hc9.qhhc_1.0.0_1.apk" class="tag tag11 button animated bounceInUp" data-delay="700"><span class="transition"><img src="/resources/subject/appdownload/button-Android.png" /></span></a>
            </div>
        </div>
    
    </main>
		<!--Main end-->
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
		<!-- end footer -->
	</div>
	<!--Container end-->
	
<script src="/resources/public/js/jquery.appear.js"></script>
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