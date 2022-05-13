/**
 * 결과 화면 함수 구현
 */
 
 function show_result_page(){
	document.getElementById("child_result_page").style.display = "block";
	document.getElementById("child_privacy_page").style.display = "none";
	document.getElementById("child_report_page").style.display = "none";
}

function show_privacy_page(){
	document.getElementById("child_result_page").style.display = "none";
	document.getElementById("child_privacy_page").style.display = "block";
	document.getElementById("child_report_page").style.display = "none";	
	
}

function show_report_page(){
	document.getElementById("child_result_page").style.display = "none";
	document.getElementById("child_privacy_page").style.display = "none";
	document.getElementById("child_report_page").style.display = "block";
	
}