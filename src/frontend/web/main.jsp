<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- css file -->
<link href="/growth_prediction/css/common.css" rel="stylesheet"
	type="text/css">
<link href="/growth_prediction/css/main.css" rel="stylesheet"
	type="text/css">

<link href="main.css" rel="stylesheet" type="text/css">
<link href="common.css" rel="stylesheet" type="text/css">

<!-- javascript file -->
<script src="/growth_prediction/js/main.js" type="text/javascript"></script>

<script src="main.js" type="text/javascript"></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<%-- JSTL 필요시 사용 @ taglib uri="http://java.sun.com/jstl/core" prefix="c" --%>
</head>
<body>

	<%--
	String doctor_id = (String)session.getAttribute("doctor_id");
	
	if (doctor_id == null){
		response.sendRedirect("index.jsp");
	}
--%>
	<%!public class child {
		String id;
		String name;
		String phone_number;

		public child(String id, String name, String phone_number) {
			this.id = id;
			this.name = name;
			this.phone_number = phone_number;
		}

	}

	child[] children = {new child("id1", "name1", "0101111****"), new child("id2", "name2", "0102222****"),
			new child("id3", "name3", "0103333****"), new child("id4", "name4", "0104444****")};%>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<div class="main_contents">
		<div class="select">
			<div class="above_list">
				<!-- button onclick="" class="above_button">검색</button -->
				<button onclick="new_child()" class="above_button">등록</button>
			</div>
			<div>
				<table class="children_table">
					<tr class="children_table_head">
						<td>id</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>진료하기</td>
					</tr>
					<%
					for (child cc : children) {
					%>

					<tr class="children_table_body">
						<td class="children_table_id"><%=cc.id%></td>
						<td class="children_table_name"><%=cc.name%></td>
						<td class="children_table_phone_number"><%=cc.phone_number%></td>
						<td class="children_table_button"><button onclick="checkup('<%=cc.id%>', '<%=cc.name%>')" class="select_child">진료하기</button></td>
					</tr>

					<%
					}
					%>
				</table>
			</div>
		</div>
		<div class="work_space_box">
			<div id="image_upload">
				<form action="" method="post" onsubmit="return image_check()">
				<ul>
					<li class = "form_list"><input type="hidden" name = "child_id" readonly id="selected_child_id"></li>
					<li class = "form_list">이름 <input type="text" name = "child_name" readonly id="selected_child_name" class = "child_info_form"></li>
					<li class = "form_list"><input type="file" name = "bone_image" id="bone_image_upload" accept=".png" required></li>
					<li class = "form_list"><button class = "submit_button">제출</button></li>
					</ul>
				</form>
			</div>
			<div id="registration">
				<form action="" method="post" onsubmit="return child_registration_check()" id = "registration_form" autocomplete = "off">
				<ul>
					<li class = "form_list">아이디 (영어 대소문자와 숫자를 포함해 5~20글자)<input type="text" name = "child_id" placeholder="아이디" maxlength = "20" class = "child_registration"></li>
					<li class = "form_list">부모님 아이디 (영어 대소문자와 숫자를 포함해 5~20글자)<input type="text" name = "parent_id" placeholder="부모님 아이디" maxlength = "20" class = "child_registration"></li>
					<li class = "form_list">이름<input type="text" name = "child_name" placeholder="이름" class = "child_registration"></li> 
					<li class = "form_list">이메일<input type="text" name = "child_email" placeholder="이메일" class = "child_registration"></li>
					<li class = "form_list">전화번호<input type="tel" name = "phone_number" placeholder="전화번호" class = "child_registration"></li>
					<li class = "form_list">부모님 전화번호<input type="tel" name = "parent_phone_number" placeholder="부모님 전화번호" class = "child_registration"></li>
					<li class = "form_list"><button class = "submit_button">등록</button></li>
				</ul>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<%--@ include file="footer.jsp"--%>
	</footer>
	<script>
	</script>
</body>
</html>