<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<!-- css file -->
<link href="/growthprediction/css/signup.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="/growthprediction/js/signup.js" type="text/javascript" ></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<header>
	<div class = "header_box">
		<a href="/growthprediction"><img src="/growthprediction/img/ShortLogo.png" height = "100px"></a>
	</div>
</header>
<main class ="contents">
	<div class = "main">
		<div class = "signup_box">
			<form action="/growthprediction/signup"  method = "post" class = "signup_form" id = "signup" autocomplete="off">
				<ul type = "none">
				<li><input type = "text" placeholder = "아이디 (영어 대소문자와 숫자를 포함해 10~20글자)" name = "doctorid" class = "signup_input" maxlength="20"></li>
				<li><input type = "password" placeholder = "비밀번호 (영어 대소문자와 숫자를 포함해 10~20글자)" name = "doctorpw" class = "signup_input" maxlength="20"></li>
				<li><input type = "password" placeholder = "비밀번호 확인" name = "pw_check" class = "signup_input" maxlength="20"></li>
				<li><input type = "text" placeholder = "이름" name = "doctorname" class = "signup_input"></li>
				<li><input type = "email" placeholder = "이메일" name = "doctoremail" class = "signup_input"></li>
				<li><input type = "text" placeholder = "병원명" name = "hospital" class = "signup_input"></li>
				<li><input type = "tel" placeholder = "전화번호" name = "doctornumber" class = "signup_input"></li>
				<li><button class = "signup_submit" onclick="signup_check()">회원가입</button></li>
				</ul>
			</form>
		</div>
	</div>
</main>
<footer>
</footer>
</body>
</html>