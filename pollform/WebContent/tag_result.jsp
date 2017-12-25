<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="my_style.css" />
<link type="text/css" rel="stylesheet" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="mystyle.css" />
<style type="text/css">

               td {border: 1px solid grey; width: 130px ; text-align: center;}
                tr {border: 1px solid grey; width: 130px ; text-align: center;}

        </style>
        
        
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
</head>
<body>
	<header>
	<div class="row align">
		<form>
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for...">
				<span class="input-group-btn"> <input type="button"
					class="btn btn-primary" value="검색">
				</span>
			</div>
		</form>
		<a class="nav-link" href="login.jsp">LogIn</a>
	</div>
	<a href="home.html"
		style="text-align: center; font-size: 1rem; text-align: left;"><h2>
			&nbspStart Poll Form!
			<h2></a> </header>
			 <%  {
 String tagSrc = request.getParameter("tagSrc");

 

 Connection conn =null;

 Statement stmt = null;

 ResultSet rs = null;

 

 Class.forName("com.mysql.jdbc.Driver");

 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/researchdb", "root", "401sql");

 

 String query = "SELECT * FROM 설문지 WHERE tagSrc='"+tagSrc+"'";

 stmt = conn.createStatement();

 rs = stmt.executeQuery(query);



 
 %>



			
	<!-- footer_banner -->
	<div class="col-11 footer_banner_zone">
		<h3 class="blind">관련사이트</h3>
		<!-- banner -->
		<div class="flow_banner_box" style="text-align: center">
			<div id="banner" class="flow_bann_area" style="margin: 0 auto">
				<ul>
					<li><a href="#"> [제목] 비트코인 미래예측  [대분류] 금융 │
					</a></li>

					<li><a href="#"> [제목] 기존 스탠드에 대한 개선방안  [대분류] 문화 │
					</a></li>
					<li><a href="#"> [제목] 박정희 동상 설립 문제  [대분류] 사회 │
					</a></li>
					
					<li><a href="#"> [제목] 참여해주세요  [대분류] 문학도서 │
					</a></li>
					<li><a href="#"> [제목] mbc결방 의견  [대분류] tv │
					</a></li>
					<li><a href="#"> [제목] 2017년 행복하셨나요  [대분류] 기타/일반 │
					</a></li>
					<li><a href="#"> [제목] 직장인 피로지수 [대분류] 사회 │
					</a></li>
					
					<li><a href="#"> [제목] 겨울철 대표 간식  [대분류] 소비 │
					</a></li>

					<li><a href="#"> [제목] 겨울 코트 추천 [대분류] 소비 │
					</a></li>
					<li><a href="#"> [제목] 킥보드 추천 부탁합니다  [대분류] 소비 │
					</a></li>
					
					<li><a href="#"> [제목] 참여해주세요  [대분류] 문학도서 │
					</a></li>
				</ul>
			</div>

			<!-- controll -->
			<div class="flow_ctrl_box">
				<a href="#" id="banner_left" class="back"><span class="blind">이전</span></a>
				<a href="#" id="banner_right" class="next"><span class="blind">다음</span></a>
			</div>
			<!-- //controll -->
		</div>
		<!-- //banner -->

	</div>
	
	
			<!-- 메인 section 시작 -->
		<section class="index_article" align="left">
				<!-- section1 시작 -->
				>태그 검색 결과<
				<div class="index_rch">
				
				<table>

        <%   

               out.println("<tr>");

               out.println("<td><b>작성자</b></td>");

               out.println("<td><b>제목</b></td>");

              

               out.println("<td><b>문항수</b></td>");

               out.println("<td><b>시작일</b></td>");
               
               out.println("<td><b>마감일</b></td>");
               
              out.println("<td><b>참여하기</b></td>");
               
               out.println("<td><b>결과보기</b></td>");
               
               

               out.println("</tr>");

               

               

               while(rs.next()){

                       out.println("<tr>");

                       out.println("<td>" + rs.getString("작성자") + "</td>");

                       out.println("<td>" + rs.getString("제목") + "</td>");

                       out.println("<td>" + rs.getString("문항수") + "</td>");
                       

                       out.println("<td>" + rs.getString("시작일") + "</td>");

                       out.println("<td>" + rs.getString("마감일") + "</td>");
                    

                 

                    
                       //null값 처리

                       %>

<td><form method="POST" action="mypage.html">
								<input type="submit" id="member_btn" value="참여">
								</form>
							</td>
							<td><form method="POST" action="makeForm.html">
								<input type="submit" id="member_btn" value="결과">
								</form></td>

               
             <%
                   out.println("</tr>");
                       }
                       
                       %>

         
        </table>


				
				
				
				
				
				
				</div>
				<!-- section1 끝-->
				<!-- section2 시작 -->
				
			</section>
			<!-- 메인 section 끝 -->

			<!-- 로그인, 로그인 밑 section 끝 -->
		</div>
</body>
</html>

<%

               }

        %>




