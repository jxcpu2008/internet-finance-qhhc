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
		} else if (sign == 'coupon') {
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
		} else {
			$.ajax({
				url : '/member_index/deposit_list',
				type : 'post',
				data : {
					no : 1
				},
				success : function(data) {
					$("#deposit").html(data);
				}
			});
		}
	});
	$(".description .ico").hover(function(){
		$(this).prev().fadeIn();
	},function(){
		$(this).prev().fadeOut();
	});
});
