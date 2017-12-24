<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx"); //결과를 출력할 객관식 질문의 idx값 저장

//id passwd name가져오기



ResultSet rs = null;


Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;



try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	String query = "DELETE FROM object1 WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	pstmt.executeUpdate();

	pstmt.close();
	con.close();

} catch (SQLException e) {
      out.println("err:"+e.toString());
}

response.sendRedirect("make_mix.jsp");
%>