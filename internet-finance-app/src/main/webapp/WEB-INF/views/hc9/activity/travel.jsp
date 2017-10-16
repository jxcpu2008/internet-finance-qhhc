<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="前海红筹,中国首家众持平台,理财平台,互联网理财平台,前海红筹官网，前海红筹借贷平台">
    <meta name="description" content="前海红筹（www.hc9.com）理财投资平台,为投资者提供优先、夹层、劣后多种投资方式。多层项目审核机制，为您的资金保驾护航！前海红筹理财借贷投资，获得高年收益率回报，超低门槛，超高收益！">
    <title>前海红筹</title>

    <link href="/resources/vendor/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--[if (gte IE 6)&(lte IE 8)]>
    <script src="vendor/js/selectivizr.min.js"></script>
    <![endif]-->
    <!--<link href="vendor/css/animate.css" rel="stylesheet">-->


    <link href="/resources/assets/css/activities.css" rel="stylesheet">
    <!--[if (gte IE 6)&(lte IE 8)]>
    <link href="assets/css/ie8fix.css" rel="stylesheet">
    <![endif]-->


        <style>
            *, ul, li {
                margin: 0;
                padding: 0;
            }
            div {
                width: 100%;
            }
            .blackboard {
                background-image: url(/resources/assets/images/sn/001_01.jpg);
                background-repeat: no-repeat;
                background-position: center;
                height: 1025px;
            }
            .talking {
                background-image: url(/resources/assets/images/sn/001_02.jpg);
                background-repeat: no-repeat;
                background-position: center;
                height: 741px;
            }
            .zc {
                background-image: url(/resources/assets/images/sn/001_03.jpg);
                background-repeat: no-repeat;
                background-position: center;
                height: 834px;
            }
            .zc>div {
                position: absolute;
                left: 50%;
                width: 944px;
                margin-top: 230px;
                margin-left: -460px;
            }
            ul.nav>li>a {
                display: inline-block;
                padding: 0;
            }
            a:hover {

            }
            .nav-tabs.nav-justified > li > a,
            ul.nav>li>a,
            ul.nav>li>a:hover,
            .nav-tabs.nav-justified > .active > a, .nav-tabs.nav-justified > .active > a:focus, .nav-tabs.nav-justified > .active > a:hover {
                border-style: none;
                background-color: rgba(255, 255,255, .0) !important;
            }
            .teaching {
                background-image: url(/resources/assets/images/sn/001_04.jpg);
                background-repeat: no-repeat;
                background-position: center;
                height: 835px;
            }
            .qrcode {
                background-image: url(/resources/assets/images/sn/001_05.jpg);
                background-repeat: no-repeat;
                background-position: center;
                height: 834px;
            }
            .signup {
                background-color: #e97254;
                height: 834px;
                margin-top: 24px;
            }
            .signup a{
                display: block;
                text-align: center;
                padding-top: 200px;
            }
            a:focus,
            .btn:focus {
                outline-style: none; 
            }
        </style>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?87111babc888396f11fb74b991170820";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>        
    </head>
    <body>
        <div class="blackboard"></div>
        <div class="talking"></div>
        <div class="zc">
            <div>
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <li role="presentation" class="active"><a href="#zc1" aria-controls="zc1" role="tab" data-toggle="tab"><img src="/resources/assets/images/sn/01.jpg"></a></li>
                    <li role="presentation"><a href="#zc2" aria-controls="zc2" role="tab" data-toggle="tab"><img src="/resources/assets/images/sn/02.jpg"></a></li>
                    <li role="presentation"><a href="#zc3" aria-controls="zc3" role="tab" data-toggle="tab"><img src="/resources/assets/images/sn/03.jpg"></a></li>
                    <li role="presentation"><a href="#zc4" aria-controls="zc4" role="tab" data-toggle="tab"><img src="/resources/assets/images/sn/04.jpg"></a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="zc1">
                        <div class="media">
                            <div class="media-left" style="width:6%;padding-left: 86px;padding-top:50px;">
                                <a href="#"><img class="media-object" src="/resources/assets/images/sn/cx.jpg"></a>
                            </div>
                            <div class="media-body" style="width:25%;font-size:20px;padding:80px 190px 150px 0;color:#ee7615;line-height:40px;">
                                三种级别投资方式:优先（保本保息）、
                                夹层（保本不保息）、劣后（不保本息）
                                风险依次递进，收益率依次递进满足不同
                                投资喜好的用户。
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="zc2">
                        <div class="media">
                            <div class="media-body" style="width:41%;font-size:20px;padding:60px 0 120px 135px;color:#ee7615;line-height:40px;">
                                从优先到夹层再到劣后，收益区间可达
                                12%—14%，远远高于宝宝类和银行收
                                益，投资无手续费。可以每天获得N个
                                茶叶蛋的收益率，丰富你的理财生活。
                            </div>
                            <div class="media-right" style="width:30%;padding-left: 86px;padding-top:50px;">
                                <a href="#"><img class="media-object" src="/resources/assets/images/sn/sy.jpg"></a>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="zc3">
                        <div class="media">
                            <div class="media-left" style="width:6%;padding-left: 86px;padding-top:50px;">
                                <a href="#"><img class="media-object" src="/resources/assets/images/sn/tm.jpg"></a>
                            </div>
                            <div class="media-body" style="width:25%;font-size:20px;padding:80px 190px 150px 0;color:#ee7615;line-height:40px;">
                                “阳光化投资”是众持模式的核心价值，
                                从根本上为投资人降低投资风险。平台采
                                用第三方支付平台进行全资金托管，让每
                                一笔资金变得安全透明。
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="zc4">
                        <div class="media">
                            <div class="media-body" style="width:41%;font-size:20px;padding:60px 0 120px 135px;color:#ee7615;line-height:40px;">
                                拥有完善的风控体系，对融资方全方位考
                                察。包括对融资方抵押物专业评级审核，
                                企业信息资质审核。同时，与债权收购机
                                构合作，最大程度规避风险，保障投资人
                                资金安全。
                            </div>
                            <div class="media-right" style="width:30%;padding-left: 86px;padding-top:50px;">
                                <a href="#"><img class="media-object" src="/resources/assets/images/sn/aq.jpg"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="teaching"></div>
        <div class="qrcode"></div>
        <div class="signup"><a href="${https }/visitor/to-regist"><img src="/resources/assets/images/sn/001_08.jpg"></a></div>
        <!-- required start -->
        <script src="/resources/vendor/js/jquery-1.11.3.min.js"></script>
        <script src="/resources/vendor/js/bootstrap.min.js"></script>
        <script>
        $(function() {
            if (navigator.userAgent.indexOf('Chrome') > 0 || navigator.userAgent.indexOf('MSIE 8.0') > 0 || navigator.userAgent.indexOf('MSIE 9.0') > 0) {
                $('.zc>div').css('margin-top', '229px');
            }
        });
        </script>
        <!-- required end -->
    </body>
</html>