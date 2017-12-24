 

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
 <%@ page session="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <link rel="stylesheet" type="text/css" href="mystyle.css" />
 <title>회원확인</title>
 </head>

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
               <!-- 공통 부분-->
	<div class="index_top" display="block">
			<table  align="right" class="index_topSrc">
				<tr>
					<td style="border: none">
						<input type="text" name="tagSrc" placeholder="&nbsp&nbsp태그 검색" style="line-height: 17px;">
					</td>
					<td style="border: none">
						<input type="submit" value="검색" style="margin-left: -6px; border: none; height: 23px; color: white; background-color: #4d4d4d">
					</td>
				</tr>
			</table>
		<header>
			<a href="index.html" target="_parent">&nbsp&nbsp&nbspPoll Form</a>
		</header>
		<!-- 메뉴 시작 -->
		<div class="menu">
			<nav id="topMenu" style="width: 1110px; margin:0 auto;">
				<ul style="float: left; text-align: center;">
					<li class="topMenuLi" style="display: inline-block; text-align: center;"><a class="menuLink" href="categoryBasicL.html">교육</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">학교 교육</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">교육 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">문화</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">문학 도서</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">순수예술</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">영화/가요/연예</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">문화 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">매체</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">TV</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">라디오</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">신문</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 매체</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">사회</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">복지</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">자연/환경</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">사회 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">정치</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">국방</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">국회</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">대통령</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">사법/치안</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정당</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정부</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">행정</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">정치 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">경제/산업</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">건설</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">과학</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">교통</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">금융</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">기업</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">대외경제/무역</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">부동산</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">경제 일반</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">산업 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">라이프스타일</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">가정/결혼</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">관광</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">소비</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">여가</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정보</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">직장</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정보/통신</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">특수계층조사</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">교포/외국인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">노인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">성인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">아동</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">장애인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">청소년</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">복지</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">기타</a></li>
				</ul>
			</nav>
		</div>
		<!-- 메뉴 끝 -->
	</div>
	<!-- 공통 부분 끝 -->
	<div class="index_middle">
			<!-- 메인 section 시작 -->
			<section class="index_article" align="middle">
				<!-- section1 시작 -->
				<div id="ind_article1"></div>
				<!-- section1 끝-->
				<!-- section2 시작 -->
				<div style="background-color: white; border: 1px solid grey; height: 100px"></div><!-- section2 끝-->
			</section>
			<!-- 메인 section 끝 -->

			<!-- 로그인, 로그인 밑 section 시작 -->
			<section class="index_Banner" align="middle">
				<div class="user_login" align="middle">
						<table>
							<tr><td style="font-size: 15px;" colspan="2"><b style="color: grey;"><%=id %></b> 님 안녕하세요!&nbsp&nbsp&nbsp&nbsp<a href="index.html" style="text-decoration: underline; color: grey; font-weight: bold; font-size: 14px; background-color: #F3F7F9;">로그아웃</a></td></tr>
							<tr><td><form method="POST" action="mypage.html">
								<input type="submit" id="user_mine" value="내 설문조사 바로가기">
								</form>
							</td>
							<td><form method="POST" action="makeForm.html">
								<input type="submit" id="user_mine" value="설문조사 작성하기">
								</form></td></tr>
						</table>
					<div>
					</div>
				</div>	
			</section>
			<!-- 로그인, 로그인 밑 section 끝 -->
		</div>  
               
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

 

 

 

 

 

 