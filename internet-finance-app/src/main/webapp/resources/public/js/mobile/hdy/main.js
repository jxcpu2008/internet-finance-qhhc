// JavaScript Document
var hasTouch = 'ontouchstart' in window ? true : false,
	touchStart = hasTouch ? 'touchstart' : 'mousedown',
	touchMove = hasTouch ? 'touchmove' : 'mousemove',
	touchEnd = hasTouch ? 'touchend' : 'mouseup';
	
(function (doc, win) {
	var docEl = doc.documentElement,
		resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
		recalc = function () {
			var clientWidth = docEl.clientWidth;
			if (!clientWidth) return;
			docEl.style.fontSize = 10 * (clientWidth / 625)*2 + 'px';
		};
	if (!doc.addEventListener) return;
	win.addEventListener(resizeEvt, recalc, false);
	doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

window.onload = function(){
	document.body.addEventListener('touchstart', function () {}); 
};




