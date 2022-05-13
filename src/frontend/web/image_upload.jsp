<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css file -->
<link href="common.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="image_upload.js" type="text/javascript" ></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<form id="bone_image_upload">
<input type="file" name = "bone_picture" accept=".png">
<button onclick="image_check()">제출</button>
</form>
</body>
</html>