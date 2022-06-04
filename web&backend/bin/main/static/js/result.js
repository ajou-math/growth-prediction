/**
 * 결과 화면 함수 구현
 */
 
 function show_result_page(){
    document.getElementById("child_result_page").style.display = "block";
    document.getElementById("child_report_page").style.display = "none";
    document.getElementById("child_bone_page").style.display = "none";
    document.getElementById("show_result_button").style.borderColor = "#dadada";
    document.getElementById("show_report_button").style.borderColor = "black";
    document.getElementById("show_picture_button").style.borderColor = "black";
 }
 
 function show_privacy_page(){
    document.getElementById("child_result_page").style.display = "none";
    document.getElementById("child_report_page").style.display = "none";   
    document.getElementById("child_bone_page").style.display = "none";
    document.getElementById("show_result_button").style.borderColor = "black";
    document.getElementById("show_report_button").style.borderColor = "black";
    document.getElementById("show_picture_button").style.borderColor = "black";
 }
 
 function show_report_page(){
    document.getElementById("child_result_page").style.display = "none";
    document.getElementById("child_report_page").style.display = "block";
    document.getElementById("child_bone_page").style.display = "none";
    document.getElementById("show_result_button").style.borderColor = "black";
    document.getElementById("show_report_button").style.borderColor = "#dadada";
    document.getElementById("show_picture_button").style.borderColor = "black";
    drawBoneAgeChart();
    drawPredHeightChart();
    
 }
 
 function show_picture_page(){
    document.getElementById("child_result_page").style.display = "none";
    document.getElementById("child_report_page").style.display = "none";
    document.getElementById("child_bone_page").style.display = "block";
    document.getElementById("show_result_button").style.borderColor = "black";
    document.getElementById("show_report_button").style.borderColor = "black";
    document.getElementById("show_picture_button").style.borderColor = "#dadada";
 }