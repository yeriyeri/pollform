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
		<div class="row align-right">
			<form>
				<div class="input-group">
					<input class="form-control" type="text" placeholder="Search for...">
					<span class="input-group-btn"> <input type="button"
						class="btn btn-primary" value="검색">
					</span>
				</div>
			</form>
			<a class="nav-link" href="index.html" style="font-size: 13px;">LogIn</a>
			<a class="nav-link" href="findIdpw.jsp" target="_parent" style="font-size: 13px; margin-left: -20px">아이디/비밀번호 찾기</a>
			<a class="nav-link" href="join_member.jsp" target="_parent" style="font-size: 13px; margin-left: -25px">회원가입</a>
		</div>
		<a class="header-a" href="index.html"><h2>
				&nbsp&nbsp&nbspStart Poll Form!
				<h2></a>
	</header>
	<div class="row" style="margin-bottom: 0px;">
		<div class="col-4" style="margin-left: 15px; color: #FF5C5C">
				<h2>회원가입을 축하합니다!</h2>
				<p>가입이 완료되었습니다.</p>
				<br/><br/>
				<form method="POST" action="index.jsp"><input type="submit" id="member_btn" value="메인으로 이동"></form>
			</div>
	</div>
	
</body>
</html>
