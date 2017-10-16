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
                <div class="media" style="width:26%;margin:5% auto;">
                	<div style="text-align:center; padding:50px 0;">
                	<div style=" display:inline-block; margin-bottom:30px;"><img class="media-object img-responsive" src="${oss}/resources/assets/images/prompt/success.jpg" alt="" style="padding-right:30px;" />申请成功</div>
                    <p style="text-align:left">我们相关人员会尽快审核您提前还款的申请，审核结果将以短信告知，如审核通过，将自动进行还款操作，请注意查看短信消息！</p>
                	</div>
	                <%-- <table>
		                <tr>
			                <td>
			                    <a style="width:71px;height:71px;display:block;">
			                    	<label><img class="media-object img-responsive" src="${oss}/resources/assets/images/prompt/success.jpg" alt=""></label>
			                    </a>
			                </td>
			                <td>
			                	<label>申请成功</label>
			                </td>
		                </tr>
		                <br>
			            <br>
			            <br>
			            <tr>
			            	<td>
								<p style="font-size: 20px;margin-left: 12px;">
									我们相关人员会尽快审核您提前还款的申请，审核结果将以短信告知，如审核通过，将自动进行还款操作，请注意查看短信消息！
								</p>
		                	</td>
			            </tr>
	                </table> --%>
                </div>
            </div>
        </div>
     </main>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	<!-- end footer -->
</body>
</html>