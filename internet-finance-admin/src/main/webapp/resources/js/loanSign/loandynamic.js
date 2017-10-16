function select(no) { 
	window.location.href = "projectdynamic?no=" + no;
}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}

