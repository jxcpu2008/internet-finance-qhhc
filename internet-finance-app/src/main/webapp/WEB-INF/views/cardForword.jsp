<%@page import="java.io.Writer"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
	<!-- end head -->

	<!--Main begin-->
	<main id="main" role="main">
		<div class="bg-container">
            <div class="container">
                <div class="media" style="width:26%;margin:14% auto;">
                <table>
                <tr>
                <td>
                    <a style="width:71px;height:71px;display:block;"><img class="media-object img-responsive" src="${oss}/resources/assets/images/prompt/success.jpg" alt=""></a>
                
                </td>
                <td>
                 <p style="font-size: 20px;margin-left: 12px;">${lName}在第${periods }期&nbsp;&nbsp;&nbsp;&nbsp;<br>还款<span class="text-danger">${fmoney }</span>元成功！</p>
                </td>
                </tr>
                </table>


                </div>
            </div>
        </div>
     </main>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	<!-- end footer -->
</body>
</html>

