var normalRepayModule = function() {
	// 项目还款模态框
	var init = function() {
		$('#normalRepayModule').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
		$('#normalRepayModule').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	};
	
	return {
		'init': init
	};
} ();