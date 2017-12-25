
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1></h1>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td></tr>
<%
request.setCharacterEncoding("utf-8");
Connection con = null;
String url="jdbc:mysql://localhost:3306/pollform";
String user="root";
String pwd="401sql";
String sql="";
PreparedStatement pstmt=null; //sql臾몄�μ�� 癒쇱�� 誘몃━ �곌���
ResultSet rs = null;
try{

Class.forName("com.mysql.jdbc.Driver");

con=DriverManager.getConnection(url,user,pwd);

sql="select * from member";
pstmt = con.prepareStatement(sql);

rs=pstmt.executeQuery();

while(rs.next()){ //泥ル�吏명��
String id = rs.getString("id"); //���대��댁�대� 1
String passwd = rs.getString("passwd");
String name = rs.getString("name");

%>
<tr><td><%=id %></td><td><%=passwd %></td><td><%=name %>
</td></tr><%
}

}catch(Exception e){
e.printStackTrace();
}finally{
if(rs!=null) try{rs.close();}catch(SQLException ex){}
if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
if(con!=null)try{con.close();}catch(SQLException ex){}
}
%>
</table>
</body>
</html>