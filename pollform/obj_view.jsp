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

String idx = request.getParameter("idx"); //세부내용을 출력할 객관식 질문의 idx값 저장



try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	 
	 
	//해당 객관식 질문의 세부내용을 출력을 위한 query문 실행
	String query = "SELECT * FROM object1 WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
<html>
<head>
<SCRIPT language="JavaScript">
function closeWindow(){
	self.close();
}
</SCRIPT>
<title>세부내용 보기</title>
<STYLE type="text/css">
p, a, ul, li, td, h1, h2, h3{ font-family: verdana, arial, helvetica, sans-serif; font-size: 11px; color: #000099;}
a { text-decoration: none; color: #CC0000; font-weight: bold;}
a:hover { text-decoration: none; color: #000000; font-weight: bold;}
h1 { font-size: 16px; font-weight: bold; margin-bottom: -10px;}
h2 { font-size: 13px; font-weight: bold; margin-top: 3px;}
h3 { font-size: 12px; font-weight: bold; margin-top: 3px;}
.caption { font-size: 10px; color: #333333;}
.null {color: #999999; font-weight: bold;}
.normal { font-weight: normal;}
.normal:hover { font-weight: normal;}
.textonly { font-size: xx-small;}
.textonly:hover { font-size: xx-small;}
</STYLE>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<table border="1" width="500" cellspacing="0" bgcolor="#f8ecc9">
<% while(rs.next()) { %>
    <tr align="center">
        <td width="100">번 호</td>
        <td width="400"><%= rs.getString("idx")%></td>
    </tr>
    <tr align="center">
        <td width="100">질문제목</td>
        <td width="400"><%= rs.getString("subject")%></td>
    </tr>
    <tr align="center">
        <td width="100">버튼종류</td>
        <td width="400">
		<%="radio".equals(rs.getString("kind"))?"라디오버튼":""%>
		<%="checkbox".equals(rs.getString("kind"))?"체크버튼":""%>
		</td>
    </tr>
    <tr align="center">
        <td width="100">항목갯수</td>
        <td width="400"><%= rs.getString("num")+"개"%></td>
    </tr>
	<%	for(int i=1;i<=Integer.parseInt(rs.getString("num"));i++){ %>
		<tr align="center">
			<td width="100"><%= i+"번항목" %></td>
			<td width="400"><%= rs.getString("ob_num"+i)%></td>
	    </tr>
	<% } %>
<% } // end while %>
</table>
<p align="right"><INPUT type="button" value="닫기" onClick="closeWindow()"></p>
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