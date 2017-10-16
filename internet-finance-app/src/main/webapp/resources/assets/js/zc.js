$(function() {
	ProcessCircle.drawProcess('.w230x130');
    LoanImages.init();  
    Timeline.onTimeline();
   // IconFix.fixIcon();
    if ($(window).width() < 1170) {
		$('.loan>section:first-child').css('width', '66%');
		$('.proj-desc .nav-pills>li.active>span').css('left', '95px');
    }
    $('a[data-id="packetsChanged"]').tooltip();
});