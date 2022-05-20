<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.example.springboot.domain.Child"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검진하기</title>
<!-- css file -->
<link href="/growthprediction/css/common.css" rel="stylesheet"
   type="text/css">
<link href="/growthprediction/css/main.css" rel="stylesheet"
   type="text/css">

<!-- javascript file -->
<script src="/growthprediction/js/main.js" type="text/javascript"></script>

<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<%-- JSTL 필요시 사용 @ taglib uri="http://java.sun.com/jstl/core" prefix="c" --%>
</head>
<body>
   <%   
         List<Child> child = (List<Child>)request.getAttribute("child");
         %>
   <%
   request.setCharacterEncoding("UTF-8");
   %>
   <header>
      <%@ include file="header.jsp"%>
   </header>
   <div class="main_contents">
      <div class="select">
         <div class="above_list">
            <button onclick="new_child()" class="above_button">등록</button>
            <button onclick="search()" class="above_button">검색</button>
            <input type="text" id = "child_search_input" onkeyup="child_saerch()" placeholder = "아이 정보">
         </div>
         <div>
            <table id ="children_table">
               <tr class="children_table_head">
                  <td>id</td>
                  <td>이름</td>
                  <td>전화번호</td>
                  <td>진료하기</td>
               </tr>
               <%
               for (Child cc : child) {
               %>

               <tr class="children_table_body">
                  <td class="children_table_id"><%=cc.getChildid()%></td>
                  <td class="children_table_name"><%=cc.getChildname()%></td>
                  <td class="children_table_phone_number"><%=cc.getChildnumber()%></td>
                  <td class="children_table_button"><button
                        onclick="checkup('<%=cc.getChildid()%>', '<%=cc.getChildname()%>')"
                        class="select_child">진료하기</button></td>
               </tr>

               <%
               }
               %>
            </table>
         </div>
      </div>
      <div class="work_space_box">
         <div id="image_upload">
            <form action="/growthprediction/signin/result" method="post" onsubmit="return image_check()">
               <ul>
                  <li class="form_list"><input type="hidden" name="child_id"
                     readonly id="selected_child_id"></li>
                  <li class="form_list">이름 <input type="text" name="child_name"
                     readonly id="selected_child_name" class="child_info_form"></li>
                  <li class="form_list"><div>성별</div> <input type="radio"
                     name="child_gender" id="gender_male" value="male"><label
                     for="gender_male">남자</label> <input type="radio"
                     name="child_gender" id="gender_female" value="female"><label
                     for="gender_female">여자</label></li>

                  <li class="form_list"><input type="file" name="bone_image"
                     id="bone_image_upload" accept=".png" required></li>
                  <li class="form_list last"><button class="submit_button">검사</button></li>
               </ul>
            </form>
         </div>
         <div id="registration">
            <form action="/growthprediction/signin/client" method="post" onsubmit="return child_registration_check()" id="registration_form" autocomplete="off">
               <ul>
                  <li class="form_list">아이 이름<input type="text" name="childname" placeholder="아이 이름" required class="child_registration"></li>
                  <li class="form_list">아이 전화번호('-'없이 숫자만 입력)<input type="text" name="childnumber" required placeholder="아이 전화번호" class="child_registration"></li>
                  <li class="form_list">부모님 이름<input type="text" name="parentname" placeholder="부모님 이름" required class="child_registration"></li>
                  <li class="form_list">부모님 전화번호('-'없이 숫자만 입력)<input type="text" name="parentnumber" required placeholder="부모님 전화번호" class="child_registration"></li>
                  <li class="form_list last"><button class="submit_button">등록</button></li>
               </ul>
            </form>
         </div>
      </div>
   </div>
   <footer>
      <%@ include file="/WEB-INF/views/footer.jsp"%>
   </footer>
   <script>
      
   </script>
</body>
</html>