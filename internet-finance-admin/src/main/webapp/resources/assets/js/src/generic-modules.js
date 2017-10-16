/* 绘画投标类型小图标 */
var InvestIcon = function() {
	var iconAttr = {
		type: '',
		fill: '',
		text: '',
		top: ''
	};
	var iconType = function(className) {
		switch (className) {
			case '.priority':
				iconAttr.type = '.priority';
				iconAttr.fill = '#61b347';
				iconAttr.text = '优';
				iconAttr.top = '2.8px';
				break;
			case '.sandwich':
				iconAttr.type = '.sandwich';
				iconAttr.fill = '#fbca3f';
				iconAttr.text = '夹';
				iconAttr.top = '2px';
				break;
			case '.inferior':
				iconAttr.type = '.inferior';
				iconAttr.fill = '#ea564c';
				iconAttr.text = '劣';
				iconAttr.top = '2.8px';
				break;
		}
	}
	var drawIcon = function(className) {
		iconType(className);
		if (!iconAttr.type) {
			return;
		}
		$(iconAttr.type).each(function() {
			if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
				if ($(this).children('div').length == 1) {
					return true;
				}
			} else {
				if ($(this).children('svg').length == 1) {
					return true;
				}
			}
			
	        var paper = Raphael(this, 22, 22);
	        var rect = paper.rect(0, 0, 22, 22, 4);
	        rect.attr({
	        	'fill': iconAttr.fill,
	        	'stroke': '#fff'
	        });
	        var text = null;
	        if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
	        	text = paper.text(11, 12, iconAttr.text);
	        } else {
	        	text = paper.text(11, 10.5, iconAttr.text);
	        }
	        text.attr({
	        	'fill': '#fff',
	        	'font-size': '14px',
	        	'font-family': '微软雅黑',
	        	'font-weight': 'bold'
	        });
	        var icon = null;
	        if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
	        	icon = $(this).children('div');
	        } else {
	        	icon = $(this).children('svg');
	        }
	        icon.css({
	            'top': iconAttr.top,
	            'margin-right': '3px'
	        });
	    });
	}
	var initIconForIE8 = function() {
		$('.label-clip').each(function() {
            var class_str = $(this).prop('class');
            if (class_str.indexOf('priority') > -1) {
                $(this).parent().addClass('priority').end().remove();
                drawIcon('.priority');
                $(this)
                return true;
            }
            if (class_str.indexOf('sandwich') > -1) {
                $(this).parent().addClass('sandwich').end().remove();
                drawIcon('.sandwich');
                return true;
            }
            if (class_str.indexOf('inferior') > -1) {
                $(this).parent().addClass('inferior').end().remove();
                drawIcon('.inferior');
                return true;
            }
        }); 
	}
	return {
		'drawIcon': drawIcon,
		'initIconForIE8': initIconForIE8
	};
} ();
/* 绘画进度图 */
var ProcessCircle = function() {
    var processGroup = [];
    var products = $('#products').offset() ;					// 产品列表的距离文档顶部与左边偏移量
    products = typeof products === 'undefined' ? null : products;
    var productsHeight = $('#products').height();				// 产品高度
    productsHeight = typeof productsHeight === 'undefined' ? 0 : productsHeight;
    var scrollHeight = 0;
    if (products) {
    	scrollHeight = products.top - $(window).height();		// 计算滚动条滚动文档距离
    }
    
    // obj is Class Selector
    var getObjectOfProcess = function(obj) {
        $(obj).each(function() {
            processGroup.push({
                'id': $(this).attr('id'), 
                'process': $(this).attr('data-process')
            });
        });
    }
    var drawProcess = function(obj) {
    	getObjectOfProcess(obj);
        for (var item in processGroup) {
            new JustGage({
		        id: processGroup[item].id,
		        title: "融资进度",
		        titleFontColor: '#777',
		        value: Number(processGroup[item].process),
		        min: 0,
		        max: 100,
		        levelColors: ["#d9534f"],
		        gaugeWidthScale: 0.7, 
		        startAnimationTime: 2000,
		        startAnimationType: ">",
		        startAnimationTime: 1000,
		        startAnimationType: "bounce"
		    });
        }
        $(obj).parents('#products').find('.item:not(:first)').removeClass('active');
    }
    var isVisibleOnScrolling = function() {
    	var divi = 2;
    	if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
	        divi = 4;
	    }
    	return (scrollHeight + productsHeight / divi < $(document).scrollTop()) ? true : false;
    } 
    return {
    	'drawProcess': drawProcess,
    	'isVisibleOnScrolling': isVisibleOnScrolling
    }
} ();
var IconFix = function() {
	var fixIcon = function() {
		var browser = navigator.userAgent;
		if (browser.match('Firefox')) {
			$('.label-clip').css({
				'vertical-align': 'text-bottom',
				'padding': '0.1em'
			});
		} else if (browser.match('Chrome')) {
			$('.label-clip').css({
				'padding': '0.1em'
			});
		}
	}
	return {
		'fixIcon': fixIcon
	}
} ();
var QueryURI = function() {
	var getQuery = function() {
		var queryArr = [];
    	// 获取url参数信息
    	var search = window.location.search;
    	if (!search) {
    		return;
    	}
    	var querys = search.slice(1).split('&');
    	for (var query in querys) {
    		var kvPair = querys[query].split('=');
    		queryArr[kvPair[0]] = kvPair[1];
    	}
    	// 返回地址参数数组
		return queryArr;
    }
	return {
		'getQuery': getQuery
	}
} ();
var Home = function() {
	var init = function() {
		$('.icon-wechat').hover(function() {
			$(this).parents('ul').next('.ewm').stop().slideDown('fast');
		}, function() {
			$(this).parents('ul').next('.ewm').stop().slideUp('fast');
		});
		$('.icon-app').hover(function() {
			$(this).parents('ul').next().next('.ewm_app').stop().slideDown('fast');
		}, function() {
			$(this).parents('ul').next().next('.ewm_app').stop().slideUp('fast');
		});
	}
	return {
		'init': init
	};
} ();



















