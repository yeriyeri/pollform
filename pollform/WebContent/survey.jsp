<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%


//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");






ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;

Connection conn = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;


String idx = request.getParameter("idx"); //세부내용을 출력할 객관식 질문의 idx값 저장



try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 conn = DriverManager.getConnection(url,user,pwd);
	

    //현재 진행중인(view값이 on인) 객관식 질문목록을 가져오는 query문 실행
	String query2 = "SELECT * FROM object1";
	pstmt2 = conn.prepareStatement(query2);
    rs2 = pstmt2.executeQuery();

    //현재 진행중인(view값이 on인) 주관식 질문목록을 가져오는 query문 실행
	String query3 = "SELECT * FROM subj_list ";
	pstmt3 = conn.prepareStatement(query3);
    rs3 = pstmt3.executeQuery();
%>
<html>
<head>
<SCRIPT language="JavaScript">
//현재 진행중인 질문들의 결과창을 새창으로 출력하는 함수
function ResultView(){
	window.open("result_view.jsp","ResultView","width=517, height=500, toolbar=no, location=no, scrollbars=yes, staus=no");
}
//투표 확인창 함수
function VoteSubmit(){
    var cons = confirm("투표하시겠습니까?");

    if (cons==true){
		document.survey.submit();
	}if (cons==false){
        return false;
    }
}
</SCRIPT>
<title>설 문 조 사</title>
</head>

<body>
<form name="survey" action="survey_do1.jsp" method="POST">
    <table align="center" border="0" width="800" cellpadding="0" cellspacing="0">
   
        <tr>
            <td>                <hr>
</td>
        </tr>
<% while(rs2.next()) { %>
        <tr>
            <td><b><%= rs2.getString("subject")%></b></td>
        </tr>
        <tr>
            <td>
                <p>
				<%	//rs2.getString("kind")의 type형태인 obj_rs2.getString("idx") 형식의 name을 가지고 "ch"+i 의 값을 가진 버튼 출력
					for(int i=1;i<=Integer.parseInt(rs2.getString("num"));i++){ //항목갯수(num)만큼 for문 실행 %>
					<input type="<%= rs2.getString("kind")%>" name="obj_<%=rs2.getString("idx") %>" value="<%="ob_num"+i %>">
					<%= rs2.getString("ob_num"+i) %> &nbsp;&nbsp;&nbsp;
				<% } %>
				</p>
            </td>
        </tr>
        <tr>
            <td>                <hr>
</td>
        </tr>
<% } // end while %>
<% while(rs3.next()) { %>
        <tr>
            <td><b><%= rs3.getString("subject")%></b></td>
        </tr>
        <tr>
            <td>
			<input type="text" size="100" name="subj_<%=rs3.getString("idx") %>">
			

			</td>
        </tr>
        <tr>
            <td>                <hr>
</td>
        </tr>
<% } // end while %>
        <tr>
            <td>
                <p align="center"><a href="#" onFocus="this.blur()" onClick="VoteSubmit()"><img src="images/submit.gif" border="0"></a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onFocus="this.blur()" onClick="ResultView()"><img src="images/result.gif" border="0"></a></p>
            </td>
        </tr>
    </table>
</form>
</body>

</html>
<%

	
	rs2.close();     // ResultSet 종료
    pstmt2.close();     // Statement 종료
	rs3.close();     // ResultSet 종료
    pstmt3.close();     // Statement 종료
    conn.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>