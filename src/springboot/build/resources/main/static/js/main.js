//새로운 아이 등록
function new_child(){
	document.getElementById("registration").style.display="block";
	document.getElementById("image_upload").style.display="none";
	
 }
 
 //아이 등록 형식 확인
 function child_registration_check(){
	
	var registration_form = document.getElementById("registration_form");
	var formData = new FormData(registration_form);
	
	var child_id = (String)(formData.get("child_id"));
	var parent_id = (String)(formData.get("parent_id"));
 
	if ((child_id.length<5)||(child_id.length>20)){
	   alert("잘못된 아이디입니다.");
	   return false;
	}
	if ((parent_id.length<5)||(parent_id.length>20)){
	   alert("잘못된 부모의 아이디입니다.");
	   return false;
	}
	for (let i = 0; i < child_id.length ; i++){
	   var ch = child_id[i];
	   if ((ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9")){
		  alert("아이디의 형식이 잘못되었습니다.");
		  return false;
	   }
	}
	for (let j = 0; j < parent_id.length ; j++){
	   var ch = parent_id[j];
	   if ((ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9")){
		  alert("부모 아이디의 형식이 잘못되었습니다.");
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