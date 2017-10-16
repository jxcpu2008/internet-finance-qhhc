$(function() {
	$.ajax({
		url : '/member_index/packet_list',
		type : 'post',
		data : {
			no : 1
		},
		success : function(data) {
			$("#packet").html(data);
		}
	});
	$(".nav-justified [role=tab]").click(function(){
		var sign = $(this).attr('href').split('#')[1];
		if (sign == 'packet') {
			$.ajax({
				url : '/member_index/packet_list',
				type : 'post',
				data : {
					no : 1
				},
				success : function(data) {
					$("#packet").html(data);
				}
			});
		} else {
			$.ajax({
				url : '/member_index/coupon_list',
				type : 'post',
				data : {
					no : 1
				},
				success : function(data) {
					$("#coupon").html(data);
				}
			});
		}
	});
});
