function setFooter() {
	var client = document.documentElement.clientHeight;
	var content = $('.head').get(0).scrollHeight
			+ $('.menu').get(0).scrollHeight
			+ $('.help-path').get(0).scrollHeight;
	var foot = $('.foot').get(0).scrollHeight;
	var helper = $('.helper-list').get(0).scrollHeight >= $('.helper-title').get(0).scrollHeight ? $('.helper-list').get(0).scrollHeight : $('.helper-title').get(0).scrollHeight;
	if (content + foot + helper + 70 < client) {
		$('.foot').css({
			'position' : 'absolute',
			'width' : '100%',
			'bottom' : '0'
		});
	} else {
		$('.foot').css({
			'position' : '',
			'bottom' : ''
		});
	}
}
function helpload(obj) {
	if (!window.location.search) {
		var help_arr = 1;
	} else {
		var help_arr = window.location.search.split('?')[1].split('=')[1];
	}

	$('.helper-list').find('li').filter(':not(.help)').each(function(index) {
		if (help_arr == (index + 1)) {
			$(this).addClass("active").parent().parent().addClass("active");
			return false;
		}
	});

	$(obj).parent('li').addClass('active').siblings('li').each(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			return false;
		}
	});

	$(obj).parent('li').parent('ul').parent('li').siblings('li').each(
			function() {
				if ($(this).find('li').hasClass('active')) {
					$(this).find('li').removeClass('active');
					return false;
				}
			});

	$.ajax({
		url : '/helper/queryHelp.htm?id=' + help_arr,
		type : 'post',
		success : function(msg) {
			$("#helplist").html(msg);
		}

	});
}
$(function() {
	helpload(); // 刷新页面
	setFooter();
	/* 侧边菜单 */
	$('.helper-list>ul>li>a').bind('click', function(event) {
		event.preventDefault();
		if (!$(this).parent('li').hasClass('active')) {
			$(this).next().slideDown('fast', function() {
				setFooter();
			}).parent('li').addClass('active').siblings('li').each(function() {
				if ($(this).hasClass('active')) {
					$(this).children('ul').slideUp('fast', function() {
						$(this).parent('li').removeClass('active');
						setFooter();
					});
					return false;
				}
			});

		} else {
			$(this).next().slideUp('fast', function() {
				setFooter();
			}).parent('li').removeClass('active');
		}
	});
});