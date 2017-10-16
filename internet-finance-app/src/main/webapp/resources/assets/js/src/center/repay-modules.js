var repayModule = function() {
	// 项目还款模态框
	var init = function() {
		$('#repayModule').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
		$('#repayModule').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	};
	
	return {
		'init': init
	};
} ();