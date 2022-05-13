/**
 * 의사 검진 메인페이지 함수
 */
 
 
 //미사용 함수
function getChildrenList() {

	fetch('https://jsonplaceholder.typicode.com/posts')
		.then((response) => response.json())
		.then((json) => {
			let table = document.createElement("table");
			const body = document.getElementById("children_table");
			
			
			for (let i = 0; i < json.length; i++) {
				const tr = table.insertRow();
				const td1 = tr.insertCell();
				const td2 = tr.insertCell();
				const td3 = tr.insertCell();
				const btn = document.createElement("button");
				btn.innerHTML = "검진하기";
				btn.onclick = function() {
					ba(json[i]["id"])
				};
				td1.appendChild(document.createTextNode(json[i]["id"]))
				td2.appendChild(document.createTextNode(json[i]["title"]))
				td3.appendChild(btn);
			}
			body.append(table);

		})
		.catch(console.log("error"));
}

function refresh() {
	document.getElementById("children_table").innerHTML = "";
	getChildrenList()
}

function ba(num) {
	alert(num)
}

//사용 함수

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
