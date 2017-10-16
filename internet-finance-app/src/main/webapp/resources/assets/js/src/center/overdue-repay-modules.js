var overdueRepayModule = function() {
	// 逾期还款模态框
	var init = function() {
		$('#overdueRepayModule').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
		$('#overdueRepayModule').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	};
	
	return {
		'init': init
	};
} ();