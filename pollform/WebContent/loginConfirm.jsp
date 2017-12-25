
	
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
 <%@ page session="true" %>
	
<%@ page import="java.sql.*, model.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="my_style.css" />
<link type="text/css" rel="stylesheet" href="normalize.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
</head>
<style>

#mi_btn { background-color: #FFFFFF; border: 0.5px solid #4d4d4d; height: 50%;}

</style>
<body>




<%
  String id = request.getParameter("id");
  String pw = request.getParameter("passwd");
  

 Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  Boolean isLogin = false;
  
  try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollform","root","401sql");
    
    stmt = (Statement) conn.createStatement();
    // 현재 페이지의 글 가져오기
   rs = stmt.executeQuery("select * from member where id='" + id + "' and passwd='" + pw + "'" );
    while( rs.next() )
    {
     session.setMaxInactiveInterval(3600);
     session.setAttribute( "id", "true" );
     
     out.println("<script>alert('로그인되었습니다!!');</script>");
     isLogin = true;
     %>
     
     
     
	<header>
	<div class="row align-right">
	<a class="nav-link" >	<%=id %></b> 님 안녕하세요!&nbsp&nbsp&nbsp&nbsp</a>
		<form method="post" action="tag_result.jsp">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for...">
				<span class="input-group-btn"> <input type="submit"
					class="btn btn-primary" value="검색">
				</span>
			</div>
		</form>
		
		<a class="nav-link" href="mypage.jsp">mypage</a>
			<a class="nav-link" href="index.jsp">LogOut</a>
	</div>
	<a href="home.html"
		style="text-align: center; font-size: 1rem; text-align: left;"><h2>
			&nbspStart Poll Form!
			<h2></a> </header>
			
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

		
			<div class="flow_ctrl_box">
				<a href="#" id="banner_left" class="back"><span class="blind">이전</span></a>
				<a href="#" id="banner_right" class="next"><span class="blind">다음</span></a>
			</div>
			<!-- //controll -->
		</div>
		<!-- //banner -->

	</div>
	<!-- //footer_banner -->
	
	
	<footer></footer>
	 <%
    }
    
    if( !isLogin )
    {
    	out.println("<script>alert('정보 불일치!!');history.back();</script>");

     %>
                    
                 <%
    }
   }
   
   catch(ClassNotFoundException cnfe){
    out.println("해당 클래스를 찾을 수 없습니다." + cnfe.getMessage());
   }
   
   catch(SQLException se){
    out.println(se.getMessage());
   }
   
  
 %>
	
</body>
</html>
