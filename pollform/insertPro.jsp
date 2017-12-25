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
<link type="text/css" rel="stylesheet" href="mystyle.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
</head>
<body class="index">
<%

request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String passwd_check=request.getParameter("passwd_check");
String phone = request.getParameter("phone");




Timestamp register = new Timestamp(System.currentTimeMillis());
Connection con = null;
String url="jdbc:mysql://localhost:3306/pollform";
String user="root";
String pwd="401sql";
PreparedStatement pstmt=null; 
String sql="";


try{

Class.forName("com.mysql.jdbc.Driver");

con=DriverManager.getConnection(url,user,pwd);

sql="insert into member(id,passwd,name,birth,phone) values(?,?,?,?,?)";
pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, passwd);
pstmt.setString(3, name);
pstmt.setString(4, birth);
pstmt.setString(5, phone);


pstmt.executeUpdate(); //insert,update,delete

}catch(Exception e){
e.printStackTrace();
}finally{
if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
if(con!=null)try{con.close();}catch(SQLException ex){}
}

%>
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
		<a class="nav-link" href="index.html">LogIn</a>
	</div>
	<a href="home.html"
		style="text-align: center; font-size: 1rem; text-align: left;"><h2>
			&nbspStart Poll Form!
			<h2></a> </header>
			
	<!-- footer_banner -->
	
		<div id="memR_middle" align="middle">
		<!-- 메인 section 시작 -->
		<section style="padding: 6% 0px 0px 0px">
			<!-- section1 시작 -->
			<div style="color: grey; background-color: white; border: 1px solid grey; height: 350px; width: 70%;">
				<br/><br/><br/>
				<h2>회원가입을 축하합니다!</h2>
				<p>가입이 완료되었습니다.</p>
				<br/><br/>
				<form method="POST" action="index.jsp"><input type="submit" id="member_btn" value="메인으로 이동"></form>
			</div>
			<!-- section1 끝-->
		</section>
		<!-- 메인 section 끝 -->
	</div>
	<!-- 	jdbc 연결 시작 -->
	<%
// 		Connection conn = null;
// 		String url = "jdbc:mysql://localhost:3306/researchdb";
// 		String user = "root";
// 		String passwd = "0707";

// 		try {
// 			conn = DriverManager.getConnection(url, user, passwd);
// 			String str = "&nbsp&nbsp&nbspDBConnection Success!<br/>";
// 			if (conn != null)
// 				out.println("<a href=\"makeForm.html\">" + str + "</a><br/>");
// 		} catch (SQLException e) {
// 			// TODO Auto-generated catch block
// 			e.printStackTrace();
// 		}

// 		try {
// 			ResultSet rs = DBUtil.researchList(conn);
// 			if (rs != null)
// 				while (rs.next()) {
// 					out.println("<div class=\" div-display\">" + "\n" + "설문지ID: " + rs.getString(1) + "\n"
// 							+ "작성자: " + rs.getString(2) + "\n" + "제목: " + rs.getString(3) + "\n" + "대분류: "
// 							+ rs.getString(4) + "\n" + "세부분류: " + rs.getString(5) + "\n" + "유형: " + rs.getString(6)
// 							+ "\n" + "세부유형: " + rs.getString(7) + "\n" + "문항수: " + rs.getString(8) + "\n" + "시작일: "
// 							+ rs.getString(9) + "\n" + "마감일: " + rs.getString(10) + "\n" + "태그: " + rs.getString(11)
// 							+ "\n</div>");
// 				}
// 		} catch (SQLException e) {
// 			e.printStackTrace();
// 		}
	%>
	<!-- 	jdbc 연결 끝 -->
	<footer></footer>
</body>
</html>
