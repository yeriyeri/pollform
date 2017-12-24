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

String idx = request.getParameter("idx"); 
try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	 
	 
	//해당 주관식 질문의 내용 출력을 위한 SELECT query문 실행
	String query = "SELECT * FROM subj_list WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
<html>
<head>
<title>주관식 질문 수정페이지</title>
</head>
<body>
<form name="subj_modify" action="subj_modify_do.jsp" method="POST">
    <table border="1" width="60%" align="center">
<% while(rs.next()) { %>
	    <tr>
            <th colspan="2">주관식 질문 수정</th>
			<input type="hidden" name="idx" value="<%= rs.getString("idx")%>">
        </tr>
        <tr>
            <td width="190">질문제목</td>
            <td width="638"><input type="text" name="question" size="42" value="<%= rs.getString("subject")%>"></td>
        </tr>
         <tr>
            <td width="834" colspan="2">
                <p align="center"><input type="submit" value="확인"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" onClick="history.back(-1)"></p>
            </td>
        </tr>
       
<% } // end while %>
    </table>
</form>
<p>&nbsp;</p>
</body>
</html>
<%

	rs.close();     // ResultSet 종료
    pstmt.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>