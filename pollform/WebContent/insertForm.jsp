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
<form action="insertPro.jsp" method="post">
아이디: <input type="text" name="id"><br>
패스워드: <input type="password" name="passwd"><br>
이름: <input type="text" name="name"><br>
이름: <input type="text" name="birth"><br>
이름: <input type="text" name="phone"><br>
<input type="submit" value="전송"><br>
</form>
</body>
</html>