<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

request.setCharacterEncoding("utf-8");
ResultSet rs = null;

Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;

String sql = "";

//주관식 질문추가를 위한 파라미터값 저장
String question = request.getParameter("question");




try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	//주관식 질문추가 query문 실행
	sql = "insert into subj_list(subject) values(?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,question);
	
	pstmt.executeUpdate();
	}


catch(Exception e){
e.printStackTrace();
}finally{
if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
if(con!=null)try{con.close();}catch(SQLException ex){}
}
response.sendRedirect("make_mix.jsp");
%>