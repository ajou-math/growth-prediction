/**
 * 뼈 사진 업로드 함수 구현
 */
function image_check() {
	document.getElementById
	document.getElementByID
	var fileInput = document.getElementByID("bone_image_upload").files[0];
	var formData = new FormData();
	var fileName = fileInput.value;
	var extension = fileName.split('.').pop();

	formData.append('file', fileInput);
	alert(typeof (extension));
	/*
		const options = {
		  method: 'POST',
		  body: formData,
		};
	    
		 function checkFileExtension() {
			fileName = document.querySelector('#chooseFile').value;
			extension = fileName.substring(fileName.lastIndexOf('.') + 1);
			document.querySelector('.output').textContent = extension;
		  };
		  https://www.w3docs.com/snippets/javascript/how-to-get-file-extensions-with-javascript.html
		  
		  extension = fileName.split('.').pop();
			document.querySelector('.output').textContent = extension;
		    
		    
			var fileInput = document.getElementById("bone_image_upload");
		alert("aasssssssssssssssssssssssaaaaaaaaaaaaaaaassssa");
		var picture = fileInput.files[0];
		var fileName = picture.name;
		alert("aassssssssssssssssssssssssa");
		var extension = fileName.split('.').pop();
	  alert(extension);
		alert(typeof(extension));
	  */
	//fetch('your-upload-url', options);


}
function image_check() {


	alert("aasssssdddddssssssssaaaaaaaaaaaaaaaassssa");
	var fileInput = document.getElementById("bone_image_upload");
	alert("aasssssssssssssssssssssssaaaaaaaaaaaaaaaassssa");
	var picture = fileInput.files[0];
	var fileName = picture.name;
	alert("aassssssssssssssssssssssssa");
	var extension = fileName.split('.').pop();
	alert(extension);
	alert(typeof (extension));

}