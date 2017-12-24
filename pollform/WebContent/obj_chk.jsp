<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%


session = request.getSession(true);

//한글 처리
request.setCharacterEncoding("utf-8");

//객관식 질문추가를 위한 파라미터값 저장
String question = request.getParameter("question");
String button = request.getParameter("button");
String item_num = request.getParameter("item_num");
String item1 = request.getParameter("item1");
String item2 = request.getParameter("item2");
String item3 = request.getParameter("item3");
String item4 = request.getParameter("item4");
String item5 = request.getParameter("item5");


ResultSet rs = null;


Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;






//첫번째항목과 두번째항목이 빈값일경우 경고창 출력
if(item1=="" || item2==""){
	out.println("<script language='javascript'>");
	out.println("alert('첫번째항목과 두번째항목은 필수사항입니다.');");
	out.println("history.back(-1);");
	out.println("</script>");
	return;
}




try {
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
   //현재 진행중인(view값이 on인) 객관식 질문목록을 가져오는 query문 실행
	
   
	//객관식 질문추가 query문 실행
	String query = "INSERT INTO object1(subject,kind,num,ob_num1,ob_num2,ob_num3,ob_num4,ob_num5,ob_num1_count,ob_num2_count,ob_num3_count,ob_num4_count,ob_num5_count) VALUES(?,?,?,?,?,?,?,?,0,0,0,0,0)";
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
%>
<%
    pstmt.close();     // PreparedStatement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
response.sendRedirect("make_mix.jsp");
%>