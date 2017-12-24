<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String birth = request.getParameter("birth");
ResultSet rs = null;
try{

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

sql = "update member set birth=? where id=? and passwd=?";
pstmt=con.prepareStatement(sql);
pstmt.setString(1, birth);
pstmt.setString(2, id);
pstmt.setString(3, passwd);

pstmt.executeUpdate(); //insert,update,delete
response.sendRedirect("modify_out.html"); 
}else{
	out.println("<script>alert('비밀번호 재확인하세요');</script>"); 
}
}
else{
	out.println("<script>alert('아이디 재확인하세요');</script>"); 

} 
}catch (Exception e) {
e.printStackTrace();
}finally
{}
%>
</body>
</html>