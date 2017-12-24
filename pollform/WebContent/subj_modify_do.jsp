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
//주관식 질문 수정을 위한 파라미터값 저장
String idx = request.getParameter("idx"); //수정할 주관식 질문의 idx값
String question = request.getParameter("question");



try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	 
	 
	//해당 주관식 질문 수정을 위한 query문 실행
	String query = "UPDATE subj_list SET subject=? WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	pstmt.setString(1,question);
	
	pstmt.executeUpdate();

    pstmt.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
}

response.sendRedirect("make_mix.jsp");
%>