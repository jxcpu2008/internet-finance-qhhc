<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
	String title = "前海红筹-每天钱进一点";
	request.getSession().setAttribute("title", title);
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta name="viewport" content="width=1300">
<meta name="format-detection" content="telephone=no"/>
<meta name="keywords"
	content="前海红筹,每天钱进一点,中国首家众持平台,理财平台,互联网理财平台,前海红筹官网，前海红筹借贷平台">
<meta name="description"
	content="前海红筹（www.hc9.com）理财投资平台,为投资者提供优先、夹层、劣后多种投资方式。多层项目审核机制，为您的资金保驾护航！前海红筹理财借贷投资，获得高年收益率回报，超低门槛，超高收益！">
<title>${title}</title>
<link href="${oss}/resources/assets/images/home/hc.ico" rel="icon" type="image/x-icon">
<link rel="stylesheet" href="${oss}/resources/public/css/reset.css?v=1.0.1" />
<link rel="stylesheet" href="${oss}/resources/public/css/common.css?v=1.0.1" />
<link rel="stylesheet" href="${oss}/resources/public/css/index.css?v=1.0.1">
<script src="${oss}/resources/public/js/jquery-1.7.2.min.js"></script>
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet" />
<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js?v=2.1.5"></script>
<script src="${oss}/resources/assets/script/head.js"></script>
<script src="${oss}/resources/public/js/jquery.poshytip.js"></script>