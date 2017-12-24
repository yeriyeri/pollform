<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx"); //결과를 출력할 객관식 질문의 idx값 저장

//id passwd name가져오기
String num = request.getParameter("num");
String subject = request.getParameter("subject");



ResultSet rs = null;
ResultSet rs2   = null;

Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
String sql = "";





try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	//해당 주관식 질문내용을 SELECT하는 query문 실행
	String query = "SELECT * FROM subj_list";
	
	pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();

	//해당 주관식 질문의 답변내용을 SELECT하는 query문 실행
	String query2 = "SELECT answer FROM subj_answer";
	pstmt2 = con.prepareStatement(query2);
	rs2 = pstmt2.executeQuery();
%>
<html>
<head>
<SCRIPT language="JavaScript">
function closeWindow(){
	self.close();
}
</SCRIPT>
<title>결과 보기</title>
<STYLE type="text/css">
p, a, ul, li, td, h1, h2, h3{ font-family: verdana, arial, helvetica, sans-serif; font-size: 20px; color: #000099;}
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
<table border="1" width="500" cellspacing="0">
    <tr align="center">
        <td colspan="2" bgcolor="#ABD0CE"><%rs.next();%><%= rs.getString("subject")%></td>
    </tr>
    
    
<% int sum=0; //답변등록갯수 저장을 위한 변수 선언
	while(rs2.next()) {
		sum++; //레코드행만큼 sum변수값을 누적저장
	%>
	<tr>
        <td colspan="2"><%= rs2.getString("answer")%><br><p align="right"><b><font color="black"></font></b></p></td>
	</tr>
<% } // end while %>
    <tr align="center">
        <td colspan="2" bgcolor="#ABD0CE">총 작성수 : <%=sum%>개</td>
    </tr>
</table>
<p align="right"><INPUT type="button" value="닫기" onClick="closeWindow()"></p>
</body>
</html>
<%

	rs.close();     // ResultSet 종료
    pstmt.close();     // Statement 종료
	rs2.close();     // ResultSet 종료
    pstmt2.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>