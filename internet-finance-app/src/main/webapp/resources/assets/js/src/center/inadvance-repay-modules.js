var inadvanceRepayModule = function() {
	// 项目立即还款模态框
	var init = function() {
		$('#inadvanceRepayModule').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
		$('#inadvanceRepayModule').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	};
	
	return {
		'init': init
	};
} ();