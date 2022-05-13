<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css file -->
<link href="common.css" rel="stylesheet" type="text/css">
<link href="result.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="result.js" type="text/javascript"></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="main_contents">
		<div class = "result_menu">
			<ul>
			<li><button onclick="show_result_page()">결과보기</button></li>
			<li><button onclick="show_privacy_page()">아이 생활 습관</button></li>
			<li><button onclick="show_report_page()">이전 검사 결과</button></li>	
			</ul>
		</div>

		<div id = "child_result_page">
			<!-- 검사 결과 안내 페이지 -->
			<div class="bone_image">
				<img >
				<!--  뼈 사진  -->
			</div>
			<div class="doctor_recommandation">
				<!--  의사 검진(추천 정보 입력)  -->
				<form>

				</form>
			</div>
			<div class="report_data">
				<!--  골 연령 검사 결과 내용  -->
				<table>
				<tr><td>이름</td><td> 아이 이름 </td></tr>
				<tr><td>성별</td><td> 성별</td></tr>
				<tr><td>역연령</td><td> 역연령 수치 </td></tr>
				<tr><td>골연령</td><td> 골연령 수치 </td></tr>
				<tr><td>예측키</td><td> 예측 키</td></tr>
				<tr><td>키</td><td>키</td></tr>
				<tr><td>체중</td><td>체중</td></tr>
				<tr><td>BMI</td><td>BMI</td></tr>
				<tr><td>예측키</td><td> 예측 키</td></tr>				
				</table>
			</div>
		</div>




		<div id = "child_privacy_page">
			<!-- 아이 생활정보 관련 페이지 -->
			privacy
		</div>



		<div id = "child_report_page">
			<!-- 이전의 골연령 검사 결과  -->
			골연령 검사 결과
		</div>


	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>