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


String idx = request.getParameter("idx"); //수정할 객관식 질문 idx값 저장


try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	 
	 
	//해당 객관식 질문의 내용 출력을 위한 SELECT query문 실행
	String query = "SELECT * FROM object1 WHERE idx='"+idx+"'";
	pstmt = con.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
<html>
<head>
<title>객관식 질문 수정페이지</title>
</head>
<body>
<form name="obj_modify" action="obj_modify_do.jsp" method="POST">
    <table border="1" width="60%" align="center">
<% while(rs.next()) { %>
        <tr>
            <th colspan="2">객관식 질문 수정</th>
			<input type="hidden" name="idx" value="<%= rs.getString("idx")%>">
        </tr>
        <tr>
            <td width="110">질문제목</td>
            <td width="486"><input type="text" name="question" size="42" value="<%= rs.getString("subject")%>"></td>
        </tr>
        <tr>
            <td width="110">버튼설정</td>
            <td width="486">
				<select name="button" size="1">
					<option value="radio" <%="radio".equals(rs.getString("kind"))?"selected":""%>>라디오버튼</option>
					<option value="checkbox" <%="checkbox".equals(rs.getString("kind"))?"selected":""%>>체크버튼</option>
				</select>
			</td>
        </tr>
        <tr>
            <td width="110">항목갯수</td>
            <td width="486">
                <select name="item_num" size="1">
					<option value="1" <%="1".equals(rs.getString("num"))?"selected":""%>>1</option>
					<option value="2" <%="2".equals(rs.getString("num"))?"selected":""%>>2</option>
					<option value="3" <%="3".equals(rs.getString("num"))?"selected":""%>>3</option>
					<option value="4" <%="4".equals(rs.getString("num"))?"selected":""%>>4</option>
					<option value="5" <%="5".equals(rs.getString("num"))?"selected":""%>>5</option>
				</select><font size="2" color="#1F497D">선택한 항목의 개수만큼만 값을 입력해주세용</font>
            </td>
        </tr>
        <tr>
            <td width="110">항목1</td>
            <td width="486"><input type="text" name="item1" size="19" value="<%= rs.getString("ob_num1")%>"></td>
        </tr>
        <tr>
            <td width="110">항목2</td>
            <td width="486"><input type="text" name="item2" size="19" value="<%= rs.getString("ob_num2")%>"></td>
        </tr>
        <tr>
            <td width="110">항목3</td>
            <td width="486"><input type="text" name="item3" size="19" value="<%= rs.getString("ob_num3")%>"></td>
        </tr>
        <tr>
            <td width="110">항목4</td>
            <td width="486"><input type="text" name="item4" size="19" value="<%= rs.getString("ob_num4")%>"></td>
        </tr>
		<tr>
            <td width="110">항목5</td>
            <td width="486"><input type="text" name="item5" size="19" value="<%= rs.getString("ob_num5")%>"></td>
        </tr>
        <tr>
            <td width="834" colspan="2">
                <p align="center"><input type="submit" value="확인"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" onClick="history.back(-1)"></p>
            </td>
        </tr>
<% } // end while %>
    </table>
</form>
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