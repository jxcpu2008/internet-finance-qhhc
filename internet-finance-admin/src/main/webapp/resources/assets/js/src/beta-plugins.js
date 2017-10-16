/* 预加载状态 */
;(function($) {
	$.fn.extend({
		spinner: function(info) {
			var info = (typeof info === 'undefined' || info == '') ? '数据提交处理中...' : info;
			var html = '';
			if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
				html = '<div class="overlay"></div><div class="spinner"><p>' + info + '</p></div>';
				return this.append(html);
			} else {
				html = '<div id="overlay-spinner"><div class="overlay fadeIn"></div><div class="spinner fadeIn"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div><p>' + info + '</p></div></div>';
				return this.append(html);
			}
		},
		removerSpinner: function() {
			if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
				return this.find('.spinner').remove().end().find('.overlay').remove();
			} else {
				return this.find('#overlay-spinner').remove();
			}
		}
	});
}) (jQuery)
/* 格式化数字 */
;(function($) {
	$.extend({
		fmByComma: function(data) {
			var datas = [];
			var data_arr = $.trim(data).split('.');
			for (var i = 1; i <= data_arr[0].length / 3; i++) {
				if (i == 1) {
					datas.push(data_arr[0].slice(-3 * i));
				} else {
					datas.push(data_arr[0].slice(-3 * i, -3 * (i - 1)));
				}
			}
			if (data_arr[0].length % 3) {
				datas.push(data_arr[0].slice(0, data_arr[0].length % 3));
			}
			return data_arr.length > 1 ? datas.reverse().join() + '.' + data_arr[1] : datas.reverse().join();
		}
	});
}) (jQuery)
/* 项目历程时间轴 *留着改进, 玩玩*/
;(function($) {
	$.fn.extend({
		timeline: function() {
			var firstLiTop = $('#history').find('li').first().offset();
    		var lastLiTop = $('#history').find('li').last().offset();
    		return this.css({
		        'height': function() {
		            if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
		                return lastLiTop.top - firstLiTop.top - 150;
		            } else {
		                return lastLiTop.top - firstLiTop.top;
		            }
		        }
		    });
		}
	});
}) (jQuery)