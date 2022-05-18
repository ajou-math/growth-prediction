/**
 * 의사 검진 메인페이지 함수
 */
 
 

//새로운 아이 등록
function new_child(){
	document.getElementById("registration").style.display="block";
	document.getElementById("image_upload").style.display="none";
	
 }
 
 //아이 등록 형식 확인
 function child_registration_check(){
	
	var registration_form = document.getElementById("registration_form");
	var formData = new FormData(registration_form);
	
	var childPhone = (String)(formData.get("childnumber"));
	var parentPhone = (String)(formData.get("parentnumber"));
 
	for (let i = 0; i < childPhone.length ; i++){
	   var ch = childPhone[i];
	   if (ch < "0" || ch > "9"){
		  alert("전화번호의 형식이 잘못되었습니다.");
		  return false;
	   }
	}
	for (let j = 0; j < parentPhone.length ; j++){
	   var ch = parentPhone[j];
	   if (ch < "0" || ch > "9"){
		  alert("전화번호의 형식이 잘못되었습니다.");
		  return false;
	   }
	}
	
	
 }
 
 
 //아이를 선택하여 골연령 검사
 function checkup(id, name){
	document.getElementById("registration").style.display="none";
	document.getElementById("image_upload").style.display="block";
	document.getElementById("selected_child_id").value=id;
	document.getElementById("selected_child_name").value=name;
	console.log(document.getElementById("selected_child_id").value);
 }
 
 //첨부 이미지의 확장자 확인(png만 가능)
 function image_check() {
	let fileInput = document.getElementById("bone_image_upload");
	let picture = fileInput.files[0];
	let fileName = picture.name;
	let extension = fileName.split('.').pop();
	
	
	if (extension.toLowerCase() != "png"){
	   alert("이미지 확장자가 png여야만 합니다.")
	   return false;
	}
 
 }
 
 //아이 테이블 내 검색
 function child_saerch() {
   var input, filter, table, tr, td, cell, i, j;
   input = document.getElementById("child_search_input");
   filter = input.value.toUpperCase();
   table = document.getElementById("children_table");
   tr = table.getElementsByTagName("tr");
   for (i = 1; i < tr.length; i++) {
	 tr[i].style.display = "none";
   
	 td = tr[i].getElementsByTagName("td");
	 for (var j = 0; j < td.length; j++) {
	   cell = tr[i].getElementsByTagName("td")[j];
	   if (cell) {
		 if (cell.innerHTML.toUpperCase().indexOf(filter) > -1) {
		   tr[i].style.display = "";
		   break;
		 } 
	   }
	 }
   }
 }
 
 
 //검색창 여닫기
 function search(){
	let input = document.getElementById("child_search_input");
	if(input.style.display == "none"){
	   input.style.display = "inline-block";
	}
	else{
	   input.style.display = "none";
	}
	
 }