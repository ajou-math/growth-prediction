<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검진하기</title>
<!-- css file -->
<link href="/springboot/css/common.css" rel="stylesheet"
   type="text/css">
<link href="/springboot/css/main.css" rel="stylesheet"
   type="text/css">

<!-- javascript file -->
<script src="/springboot/js/main.js" type="text/javascript"></script>

<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<%-- JSTL 필요시 사용 @ taglib uri="http://java.sun.com/jstl/core" prefix="c" --%>
</head>
<body>


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

   child[] children = {new child("gudwns", "최형준", "0101111****"), new child("rldnd", "윤기웅", "0102222****"),
         new child("dkfla", "최아림", "0103333****"), new child("dndus", "조우연", "0104444****"),
         new child("dbstjr", "최윤석", "0105555****")};%> 


   <%
   request.setCharacterEncoding("UTF-8");
   %>
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
                  <td class="children_table_button"><button
                        onclick="checkup('<%=cc.id%>', '<%=cc.name%>')"
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
            <form action="result.jsp" method="post" onsubmit="return image_check()">
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
                  <li class="form_list last"><button class="submit_button">제출</button></li>
               </ul>
            </form>
         </div>
         <div id="registration">
            <form action="" method="post" onsubmit="return child_registration_check()" id="registration_form" autocomplete="off">
               <ul>
                  <li class="form_list">부모님 이름<input
                     type="text" name="parentname" placeholder="이름" maxlength="20"
                     class="child_registration"></li>
                  <li class="form_list">부모님 핸드폰 ('-'없이 작성)<input
                     type="text" name="parentnumber" placeholder="01012345678" maxlength="20"
                     class="child_registration"></li>

                  <li class="form_list">아이 이름<input type="text" name="childname"
                     placeholder="이름" class="child_registration"></li>
                  <li class="form_list">아이 핸드폰('-'없이 작성)<input type="text"
                     name="childnumber" placeholder="01012345678" class="child_registration"></li>
                  
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