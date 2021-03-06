<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body class="index">
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
			<nav id="topMenu">
				<ul>
					<li class="topMenuLi"><a class="menuLink" href="">교육</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">학교 교육</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">교육 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">문화</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">문학 도서</a></li>
							<li><a href="" class="submenuLink">순수예술</a></li>
							<li><a href="" class="submenuLink">영화/가요/연예</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">문화 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">매체</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">TV</a></li>
							<li><a href="" class="submenuLink">라디오</a></li>
							<li><a href="" class="submenuLink">신문</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 매체</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">사회</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">복지</a></li>
							<li><a href="" class="submenuLink">자연/환경</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">사회 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">정치</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">국회</a></li>
							<li><a href="" class="submenuLink">국방</a></li>
							<li><a href="" class="submenuLink">대통령</a></li>
							<li><a href="" class="submenuLink">사법/치안</a></li>
							<li><a href="" class="submenuLink">정당</a></li>
							<li><a href="" class="submenuLink">정부</a></li>
							<li><a href="" class="submenuLink">행정</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">정치 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">경제/산업</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">건설</a></li>
							<li><a href="" class="submenuLink">과학</a></li>
							<li><a href="" class="submenuLink">교통</a></li>
							<li><a href="" class="submenuLink">금융</a></li>
							<li><a href="" class="submenuLink">기업</a></li>
							<li><a href="" class="submenuLink">대외경제/무역</a></li>
							<li><a href="" class="submenuLink">부동산</a></li>
							<li><a href="" class="submenuLink">경제 일반</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">산업 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">라이프스타일</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">가정/결혼</a></li>
							<li><a href="" class="submenuLink">관광</a></li>
							<li><a href="" class="submenuLink">소비</a></li>
							<li><a href="" class="submenuLink">여가</a></li>
							<li><a href="" class="submenuLink">정보</a></li>
							<li><a href="" class="submenuLink">직장</a></li>
							<li><a href="" class="submenuLink">정보/통신</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">특수계층조사</a>
						<ul class="submenu">
							<li><a href="" class="submenuLink">교포/외국인</a></li>
							<li><a href="" class="submenuLink">노인</a></li>
							<li><a href="" class="submenuLink">성인</a></li>
							<li><a href="" class="submenuLink">아동</a></li>
							<li><a href="" class="submenuLink">장애인</a></li>
							<li><a href="" class="submenuLink">청소년</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">복지</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="">기타</a></li>
				</ul>
			</nav>
		</div>
		<!-- 메뉴 끝 -->
	</div>
	<!-- 공통 부분 끝 -->
	<div id="memR_middle" align="middle">
		<!-- 메인 section 시작 -->
		<section style="padding: 6% 0px 0px 0px">
			<!-- section1 시작 -->
			<div style="color: grey; background-color: white; border: 1px solid grey; height: 350px; width: 70%;">
				<br/><br/><br/>
				<h2>수정이 완료되었습니다.</h2>
				<p>수정한 정보로 로그인하세요.</p>
				<br/><br/>
				<form method="POST" action="index.html"><input type="submit" id="member_btn" value="메인으로 이동"></form>
			</div>
			<!-- section1 끝-->
		</section>
		<!-- 메인 section 끝 -->
	</div>
<%
//한글처리
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

ResultSet rs = null;
try {

Class.forName("com.mysql.jdbc.Driver");

Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";
con = DriverManager.getConnection(url, user, pwd);

PreparedStatement pstmt = null;
String sql = "";

sql = "select passwd from member where id=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

rs = pstmt.executeQuery();

if(rs.next()){

String dbPass=rs.getString("passwd");
if(passwd.equals(dbPass)){

sql = "update member set passwd=? where id=?";
pstmt=con.prepareStatement(sql);
pstmt.setString(1, passwd);
pstmt.setString(2, id);


pstmt.executeUpdate(); //insert,update,delete
out.println("정보수정 성공!");
}else{
out.println("비밀번호 틀림!");}

}else{
out.println("id가 존재하지 않아여");
}

} catch (Exception e) {
e.printStackTrace();
}finally{

}
	 %>

	



</body>
</html>