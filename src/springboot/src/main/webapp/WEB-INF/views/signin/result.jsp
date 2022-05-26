<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.springboot.domain.Privacy"%>
<%@ page import="com.example.springboot.domain.Report"%>
<%@ page import="com.example.springboot.domain.need.AgeService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검진 결과</title>
<!-- css file -->
<link href="/growthprediction/css/common.css" rel="stylesheet" type="text/css">
<link href="/growthprediction/css/result.css" rel="stylesheet" type="text/css">
<!-- javascript file -->
<script src="/growthprediction/js/result.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- google gont Noto Sans KR -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   
<link rel="shortcut icon" href="/favicon.ico" type="image/png">
<link rel="icon" href="/favicon.ico" type="image/png">
</head>
<body>
<% List<Privacy> privacylist = (List<Privacy>) request.getAttribute("privacylist"); %>
<% AgeService as = new AgeService();%>
<script type="text/javascript">
   google.charts.load('current', {
      'packages' : [ 'line', 'corechart' ]
   });
   google.charts.setOnLoadCallback(drawBoneAgeChart);
   google.charts.setOnLoadCallback(drawPredHeightChart);

   function drawBoneAgeChart() {
      var chartDiv = document.getElementById('boneage_chart_div');
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "키");
      data.addColumn('number', "예측 키");

      var dayList = [];
      <%for (Privacy ptall : privacylist) {%>
      <% String ptallday = as.yyyyMMdd(ptall);%>
         dayList.push((String)(<%=ptallday%>));
         
      <%}%>
      data.addRows([
         <%for (int i = 0 ; i < privacylist.size(); i++)  {%> 
         [new Date(dayList[<%=i%>].substr(0,4), dayList[<%=i%>].substr(4,2), dayList[<%=i%>].substr(6,2))   ,
         <%=privacylist.get(i).getPrivacytall()%>   ,
         <%=privacylist.get(i).getPrivacypredicttall()%>   ],
         <%}%>
      ]);

      var materialOptions = {
         chart : {
            title : '현재 키와 예측 키'
         },
         width : 900,
         height : 400,
         vAxis: { title: "키" },
         hAxis : {title: "날짜"},
      };

      var materialChart = new google.charts.Line(chartDiv);
      materialChart.draw(data, google.charts.Line.convertOptions(materialOptions));

   }
   
   function drawPredHeightChart() {
      var chartDiv = document.getElementById('height_chart_div');
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Month');
      data.addColumn('number', "역연령");
      data.addColumn('number', "골연령");

      var dayList=[];

      <%for (Privacy ptall : privacylist) {%>
      <% String ptallday = as.yyyyMMdd(ptall);%>
         dayList.push((String)(<%=ptallday%>));
         
      <%}%>
      
      data.addRows([
         <%for (int i = 0 ; i < privacylist.size(); i++)  {%> 
         <% int chartage = as.yy(privacylist.get(i));%>
         [new Date(dayList[<%=i%>].substr(0,4), dayList[<%=i%>].substr(4,2), dayList[<%=i%>].substr(6,2))   ,
         <%=chartage%>   ,
         <%=privacylist.get(i).getPrivacybornage()%>   ],
         <%}%>
      ]);

      var materialOptions = {
         chart : {
            title : '골연령과 역연령'
         },
         width : 900,
         height : 400,
         vAxis: { title: "나이" },
         hAxis : {title: "날짜"},
      };

      var materialChart = new google.charts.Line(chartDiv);
      materialChart.draw(data, google.charts.Line.convertOptions(materialOptions));

   }
   
   
</script>
   <%
   request.setCharacterEncoding("UTF-8");

   %>
   <header>
      <%@ include file="header.jsp"%>
   </header>
   <div class="main_contents">
      <div class="result_menu">
         <button onclick="show_result_page()" class="result_menu_button"
            id="show_result_button">결과보기</button>
         <button onclick="show_picture_page()" class="result_menu_button"
            id="show_picture_button">사진보기</button>
         <button onclick="show_report_page()" class="result_menu_button"
            id="show_report_button">이전 검사 결과</button>

      </div>

      <div id="child_result_page">
         <div class="result_page_box">
            <!-- 검사 결과 안내 페이지 -->
            <div class="report_data">
               <!--  골 연령 검사 결과 내용  -->
               <table class="result_table">
                  <tr class = "result_table_row">
                     <td class = "table_legend">이름</td>
                     <td>${childname}</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>성별</td>
                     <td>${privacy.getPrivacygender()}</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>골연령</td>
                     <td>${privacy.getPrivacybornage()}세</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>역연령</td>
                     <td>${currentage}세</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>예측 키</td>
                     <td>${privacy.getPrivacypredicttall()}cm</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>키</td>
                     <td>${privacy.getPrivacytall()}cm</td>
                  </tr>
                  <tr class = "result_table_row">
                     <td>체중</td>
                     <td>${privacy.getPrivacyweight()}kg</td>
                  </tr>
               </table>
            </div>
            <div class="doctor_recommandation">
               <!--  의사 검진(추천 정보 입력)  -->
               <form action = "/growthprediction/signin/recommend" method = "post" class = "recommandation_form">
                  <ul>
                     <% Report report = (Report) request.getAttribute("report");%>
                     <li class="form_list"><input type="text" class="doctor_form" value="<%=report.getReportchildid()%>" name = "recommendchildid"></li>
                     <li class="form_list"><input type="text" class="doctor_form" value="<%=report.getReportdoctorid()%>" name = "recommenddoctorid"></li>
                     <li class="form_list">걸음걸이 입력<input type="text" class="doctor_form" name = "recommendwalk"></li>
                     <li class="form_list">운동량 입력<input type="text" class="doctor_form" name = "recommendworkout"></li>
                     <li class="form_list">수면 시간 입력<input type="text" class="doctor_form" name = "recommendsleep"></li>
                     <li class = "form_list">소견<textarea class = "doctor_form textarea_box" name = "recommendcomment"></textarea></li>
                     <li class="form_list last"><button class="submit_button">제출</button></li>
                  </ul>
               </form>
            </div>

         </div>
      </div>
      <!-- 뼈 사진 보여주기 -->
      <div id="child_bone_page">
         <div class="bone_page_box">
            <div class="bone_image">
               
               <% String imgblob = (String) request.getAttribute("imgblob");%>
               <img src="data:image/png;base64, <%=imgblob%>" class = "image">
            </div>
         </div>
      </div>

      <!-- 이전의 골연령 검사 결과  -->
      <div id="child_report_page">
         <div class="report_page_box">
            <div id = "boneage_chart_div" class = "chart_div"></div>
            <div id = "height_chart_div" class = "chart_div"></div>
            <table class = "report_history">
            <tr><td>날짜</td><td>골연령</td><td>역연령</td><td>키</td><td>예측키</td></tr>
            <% for ( Privacy before : privacylist){ %>
            <% int currentage = as.yy(before);%>
            <tr>
               <td><%=before.getPrivacyenterday()%></td><td><%=before.getPrivacybornage()%></td><td><%=currentage%></td>
               <td><%=before.getPrivacytall()%></td><td><%=before.getPrivacypredicttall()%></td>
            </tr>
            <%} %>
            </table>
         </div>
      </div>
   </div>

   <footer>
      <%@ include file="/WEB-INF/views/footer.jsp"%>
   </footer>
</body>
</html>