<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보</title>
<!-- css file -->
<link href="/growthprediction/css/common.css" rel="stylesheet" type="text/css">
<link href="/growthprediction/css/info.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="#" type="text/javascript"></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
   <header>
      <%@ include file="header.jsp"%>
   </header>
   <div class="main_contents">
         <table class = "doctor_info">
            <tr>
               <td class = "info_name">아이디</td>
               <td class = "info_value">dbstjr<%-- <%=doctor.id% --%></td>
               <td class = "info_name">이름</td>
               <td class = "info_value">최윤석<%-- <%=doctor.name %> --%></td>
            </tr>
            <tr>
               <td class = "info_name">병원명</td>
               <td class = "info_value">가나다<%-- <%=doctor.hospitalname %> --%></td>
               <td class = "info_name">전화번호</td>
               <td class = "info_value">1231241<%-- <%doctor.phone %> --%></td>
            </tr>
            <tr>
               <td class = "info_name">이메일</td>
               <td class = "info_value">aaa@aaa.aa<%-- <%=doctor.email %> --%></td>
            </tr>
         </table>
   </div>
   <footer>
      <%@ include file="/WEB-INF/views/footer.jsp"%>
   </footer>
</body>
</html>