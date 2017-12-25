<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.DBUtil, model.FindCtg, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="my_style.css" />
<title>Welcome!</title>
<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
} 
</script>
</head>
<body>
<!-- 	jdbc 연결 시작 -->
	<%
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/researchdb";
		String user = "root";
		String passwd = "401sql";

		try {
			conn = DriverManager.getConnection(url, user, passwd);
// 			String str = "&nbsp&nbsp&nbspDBConnection Success!<br/>";
// 			if (conn != null)
// 				out.println("<a href=\"makeForm.html\">" + str + "</a><br/>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			ResultSet rs = DBUtil.researchList(conn, "where date(시작일) >= date(now()) && date(마감일) > date(now())order by 설문지ID desc");
			int count = 0;
			if (rs != null){
				out.println("<form method=\"POST\" action=\"getResearchInfo.do\" name=\"content_form\" onkeydown=\"return captureReturnKey(event)\">");
				while (rs.next() && count < 5) {
					List<String> ctgs = FindCtg.Ctg(rs.getString(4), rs.getString(5));
					out.println("<div class=\"div-display\"><input type=\"hidden\" name=\"researchID\" value=\"" + rs.getString(1) + "\"/>" + "\n"
							+ "제목: " + rs.getString(3)
							+ "\n대분류: " + ctgs.get(0)+ "\t<button class=\"btn2 btn2-primary\" type=\"submit\" onClick=\"checkForm()\" onsubmit=\"return true;\">바로가기</button></div>");
				count++;
				}
				out.println("</form>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<!-- 	jdbc 연결 끝 -->
</body>
</html>