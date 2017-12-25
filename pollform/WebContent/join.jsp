<%@page import="check.DBUtil_"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
String name=request.getParameter("name");
String birth=request.getParameter("birth");
String phone=request.getParameter("phone");

Connection conn=DBUtil_.getMySQLConnection();

String sql="insert into member(id,passwd,name,birth,phone) values(?,?,?,?,?)";
PreparedStatement pstmt=conn.prepareStatement(sql);

pstmt.setString(1,id);
pstmt.setString(2,passwd);
pstmt.setString(3,name);
pstmt.setString(4,birth);
pstmt.setString(5,phone);
pstmt.executeUpdate();

DBUtil_.close(pstmt);
DBUtil_.close(conn);


%>
</body>
</html>