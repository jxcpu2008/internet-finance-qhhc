var RepayModal = function() {
	// 项目还款模态框
	var init = function() {
		$('#repayModal').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
			
		});
		$('#repayModal').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	}
	return {
		'init': init
	};
} ();