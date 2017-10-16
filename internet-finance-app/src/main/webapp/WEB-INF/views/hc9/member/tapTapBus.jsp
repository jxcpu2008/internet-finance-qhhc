<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/vendor/css/calendar.css" rel="stylesheet">
<link href="${oss}/resources/assets/css/center/center.css" rel="stylesheet"><jsp:include
	page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- 页头 -->
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="center bg-snow clearfix">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<div class="nav-right col-md-10 clearfix">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h4 class="text-para text-left">我的嗒嗒车票</h4>
                            </div>
                            <div class="panel-body">
                            	<div class="account-view w100-view bg-snow">
									<div class="tab-content">
										<div class="tab-pane fade in active" id="tapbus">
											
										</div>
									</div>
                            	</div>
                            </div>
                        </div>    
                    </div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/My97DatePicker/WdatePicker.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
	<script type="text/javascript">
	$(function(){
		$.ajax({
			url : '/member_index/tapbus_list',
			type : 'post',
			data : {
				no : 1
			},
			success : function(data) {
				$("#tapbus").html(data);
			}
		});
	});
	</script>
</body>
</html>