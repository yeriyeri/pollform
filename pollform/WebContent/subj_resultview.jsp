<%@page import="java.sql.*" contentType="text/html;charset=euc-kr" %>
<%
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx"); //����� ����� ������ ������ idx�� ����

//id passwd name��������
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
	 // 2�ܰ� ��񿬰�
	 con = DriverManager.getConnection(url,user,pwd);
	String query = "SELECT * FROM subj_answer";
	pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();

	//�ش� �ְ��� ������ �亯������ SELECT�ϴ� query�� ����
	String query2 = "SELECT subject FROM subj_list";
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
<title>��� ����</title>
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
<table border="1" width="500" cellspacing="0">
    <tr align="center">
        <td colspan="2" bgcolor="#CBC7FF"><%rs2.next();%><%= rs2.getString("subject")%></td>
    </tr>
<% int sum=0; //�亯��ϰ��� ������ ���� ���� ����
	while(rs.next()) {
		sum++; //���ڵ��ุŭ sum�������� ��������
	%>
	
<% } // end while %>
    <tr align="center">
        <td colspan="2" bgcolor="#CBC7FF">�� �ۼ��� : <%=sum%>��</td>
    </tr>
</table>
<p align="right"><INPUT type="button" value="�ݱ�" onClick="closeWindow()"></p>
</body>
</html>
<%

	rs.close();     // ResultSet ����
    pstmt.close();     // Statement ����
	rs2.close();     // ResultSet ����
    pstmt2.close();     // Statement ����
    con.close(); 	// Connection ����

} catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>