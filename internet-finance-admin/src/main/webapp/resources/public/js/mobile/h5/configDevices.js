/**
 * configDevices.js
 * http://fengzebiao@160sz.cn/lib/script/configDevices.js?v=1.0
 *
 * @Version
 * 1.0.0 (Nov 11 2015)
 *
 * @Author
 * Bille.Feng
 *
 * @E-mail
 * excel_design@163.com
 *
 * @Filemtime
 * 2015-11-19
 *
 */

(function(win) {
    var configDevices= function() {
        this.Init.apply(this, arguments);
    }
 
    configDevices.prototype = {
 
        ////添加相关操作代码
 
 		//初始化参数
        Init: function() {
            var params = Array.prototype.slice.call(arguments);
            if (params && params.length > 0) {
                var config = params[0];
                var getType = Object.prototype.toString;
                if (config && getType.call(config) == "[object Object]") {
                    this.config = config || {
                        id: '', //控件id
                        objWidth: false,
						objHeight: false, //数据
                        position:false //定位
                    };
                }
            }
        },
 
        Render: function() {
            var self = this;
            if (self.config) {
				//获取参数id
                var autoElement = document.getElementById(self.config.id);
                this.autoElement = autoElement;
				//判断标签是否存在
                if (autoElement) {
					self.AdaptScale();
                }
 
            }else{
				self.TextSize();
			}
        },
		
		TextSize: function(){
			var element = document.documentElement,
				resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
				resizeObj = function () {
					var clientWidth = element.clientWidth;
					if (!clientWidth) return;
					element.style.fontSize = 10 * (clientWidth / 625)*2 + 'px';
				};
			
			if (!document.addEventListener) return;
			window.addEventListener(resizeEvt, resizeObj, false);
			document.addEventListener('DOMContentLoaded', resizeObj, false);	
		},
 
 		AdaptScale: function(){
			var idname = this.config.id;
			var position = this.config.postion ? this.config.position : "left top";
			var thisObj =  document.getElementById(idname);
            var newElement = document.createElement('div');
            newElement.id = "wrapElement";
            //设置下拉div样式
            var wrapStyle = {
                position: 'relative',
                overflow: 'hidden'
            };
            for (var prop in wrapStyle) {
                newElement.style[prop] = wrapStyle[prop];
            };
			var objStyle = {
                position: 'absolute',
                transformOrigin: 'left top',
                webkitTransformOrigin: 'left top'
			};
            for (var prop in objStyle) {
                thisObj.style[prop] = objStyle[prop];
            };
			newElement.appendChild(thisObj.cloneNode(true));
			thisObj.parentNode.replaceChild(newElement,thisObj);
			var objectWidth = parseInt(this.config.objWidth);
			var objectHeight = parseInt(this.config.objHeight);
			var resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
				resizeObj = function () {
                	var element = document.getElementById(idname);
					var direction_array = position.split(" ");
					var clientWidth = parseInt(document.documentElement.clientWidth);
					var clientHeight = parseInt(document.documentElement.clientWidth);
					var objectScale = objectWidth / objectHeight > clientWidth / clientHeight ? clientHeight / objectHeight : clientWidth / objectWidth;
					document.getElementById("wrapElement").style.height = objectHeight * objectScale + "px";
					var style = {
						transform:'scale('+objectScale+')',
						webkitTransform: 'scale('+objectScale+')',
					};
					for (var prop in style) {
						element.style[prop] = style[prop];
					};
					switch(direction_array[0]){
						case "center":
							element.style.left = (clientWidth - objectWidth*objectScale)/2;
						break;
						case "left":
							element.style.left =0;
						break;
						case "right":
							element.style.left = clientWidth - objectWidth*objectScale;
						break;
					};
					switch(direction_array[1]){
						case "center":
							element.style.top = (clientHeight - objectHeight*objectScale)/2;
						break;
						case "top":
							element.style.top = 0;
						break;
						case "bottom":
							element.style.top = clientHeight - objectHeight*objectScale;
						break;
					};
				};
			
			if (!document.addEventListener) return;
			window.addEventListener(resizeEvt, resizeObj, false);
			document.addEventListener('DOMContentLoaded', resizeObj, false);	
			resizeObj();
		}
 
    }
 
    win.ConfigDevices= function(paraobj) {
        new configDevices(paraobj).Render();
    }
})(window)