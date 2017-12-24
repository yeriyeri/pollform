<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx"); //결과를 출력할 객관식 질문의 idx값 저장

request.setCharacterEncoding("utf-8");
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

	//해당 객관식 질문의 결과를 SELECT하는 query문 실행
	String query = "SELECT *,ob_num1_count+ob_num2_count+ob_num3_count+ob_num4_count+ob_num5_count as sum FROM object1 ";
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
<title>결과 보기</title>
<STYLE type="text/css">
p, a, ul, li, td, h1, h2, h3{ font-family: verdana, arial, helvetica, sans-serif; font-size: 20px; color: #272625;}
a { text-decoration: none; color: #FFFFFF; font-weight: bold;}
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
<body bgcolor="white" text="black" link="gray" vlink="gray" alink="red" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<table border="1" width="500" cellspacing="0">

	<%rs.next(); %>
	
    <tr align="center">
        <td colspan="2" bgcolor="#ABD0CE"><%= rs.getString("subject")%> (총 투표수 : <%= rs.getInt("sum")%>표)</td>
    </tr>
	<%

		for(int i=1;i<=Integer.parseInt(rs.getString("num"));i++){ //해당 객관식 질문의 항목갯수(num)만큼 for문 실행
			int p = (int)Math.round((rs.getInt("ob_num"+i+"_count")*100.0)/rs.getInt("sum")); //백분율계산
	%>
		<tr>
			<td width="200" align="center" bgcolor="#F0E5DE"><%= i+"번("+rs.getString("ob_num"+i)+")"%></td>
			<td width="300" align="left"><img src="images/bar2.PNG" height="10" width="<%= p*2 %>">&nbsp;<%= rs.getString("ob_num"+i+"_count")+"표("+p+"%)" %></td>
	    </tr>
	<% } %>

  
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