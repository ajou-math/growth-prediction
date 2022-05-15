<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- css file -->
<link href="/springboot/css/common.css" rel="stylesheet" type="text/css">
<link href="/springboot/css/main.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="/springboot/js/main.js" type="text/javascript"></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<%-- JSTL 필요시 사용 @ taglib uri="http://java.sun.com/jstl/core" prefix="c" --%>
</head>
<body>


<%! %>
<header>
    <%@ include file = "header.jsp"%>
</header>
<div class="contents">
<div class = "above_list">
	<button onclick="refresh()">새로고침</button>
	<button onclick="">검색</button>
	<button onclick="">등록</button>
</div>
<div id="children_table">

</div>
</div>

<footer>
	<%@ include file = "/WEB-INF/views/footer.jsp"%>
</footer>
<script>
getChildrenList(doctor_id);
</script>
</body>
</html>