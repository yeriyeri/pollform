<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");






ResultSet rs = null;


Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;


String idx = request.getParameter("idx"); //결과를 출력할 객관식 질문의 idx값 저장
String question = request.getParameter("question");
String button = request.getParameter("button");
String item_num = request.getParameter("item_num");
String item1 = request.getParameter("item1");
String item2 = request.getParameter("item2");
String item3 = request.getParameter("item3");
String item4 = request.getParameter("item4");
String item5 = request.getParameter("item5");



try {
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	//해당 객관식 질문 수정을 위한 query문 실행
	String query = "UPDATE object1 SET subject=?, kind=?, num=?, ob_num1=?, ob_num2=?,ob_num3=?,ob_num4=?,ob_num5=? WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	pstmt.setString(1,question);
	pstmt.setString(2,button);
	pstmt.setString(3,item_num);
	pstmt.setString(4,item1);
	pstmt.setString(5,item2);
	pstmt.setString(6,item3);
	pstmt.setString(7,item4);
	pstmt.setString(8,item5);
	pstmt.executeUpdate();

    pstmt.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
}

response.sendRedirect("make_mix.jsp");
%>