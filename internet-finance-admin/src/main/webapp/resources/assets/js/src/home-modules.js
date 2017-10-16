/* 新闻公告 */
var NewsCarousel = function() {
	var obj = null;
	var autoScroll = function(obj) {
        $(obj).find("ul:first").animate({
            marginTop : "-30px"
        }, 500, function() {
            $(this).css({
                marginTop : "0px"
            }).find("li:first").appendTo(this);
        });
    }
	return {
		'autoScroll': autoScroll
	};
} (); 
/* 首页底部弹出模块 */
var Mask = function() {
    var maskToggle = function() {
        var docHeight = $(document).scrollTop();
        var isHidden = false;
        if (docHeight >= 100 && docHeight <= $('footer').offset().top - $(window).height()) {
            $('.masklg-container').slideDown();
        }
        if (docHeight < 100 || docHeight > $('footer').offset().top - $(window).height()) {
            $('.masklg-container').slideUp();
            isHidden = true;
        }
        return isHidden;
    }
    var init = function() {
        /* 设置banner */
        $('#banner').carousel({
            interval: 3000
        });
        $('#info').carousel({
            interval: 4000
        });
        /* 产品列表 */
        $('#products').carousel({
            interval: false
        });
        /* 全资金托管,安全保障,超值体验 */
        setTimeout(function() {
            $('.newspub section').first().find('img').each(function() {
                $(this).removeClass('bounceIn');
            });
        }, 1000);
        $('.newspub section').first().find('a').hover(function() {
            $(this).find('img').addClass('bounceIn');
        }, function() {
            $(this).find('img').removeClass('bounceIn');
        });
        /* 新闻公告 */
        //setInterval('NewsCarousel.autoScroll("#news")', 3000);
        setInterval('NewsCarousel.autoScroll("#reback")', 3000);
        
        /* 进度图 & 登录注册横窗*/
        var isDrawn = false; 
        var processHandler = function(event) {
            if (ProcessCircle.isVisibleOnScrolling()) {         // 依赖generic-modules.js 
                ProcessCircle.drawProcess('.autox110');
                $(this).off('scroll', processHandler);
                isDrawn = true;
            }
            if (!isDrawn) {
                maskToggle();
            } else {
                $(window).on('scroll', maskHandler);
            }
            
        }
        var maskHandler = function(event) {
            maskToggle();
        }
        if (!maskToggle()) {
            $(window).on('scroll', maskHandler);
        }
        if (ProcessCircle.isVisibleOnScrolling()) {
            ProcessCircle.drawProcess('.autox110');
        } else {
            $(window).on('scroll', processHandler);
        }
        $('.wrap a.cancel').bind('click', function(event) {
            event.preventDefault();
            event.stopImmediatePropagation();
            $('.masklg-container').slideUp();
            $(window).off('scroll', maskHandler);
        });
    }
    return {
        'init': init
    }
} ();
/* 名词解释 */
var TranslateWord = function() {
	var init = function() {
		$('span[data-id="house"]').popover();
		$('span[data-id="car"]').popover();
		$('span[data-id="credit"]').popover();
		$('span[data-id="impawn"]').popover();
	}
	return {
		'init': init
	}
} ();