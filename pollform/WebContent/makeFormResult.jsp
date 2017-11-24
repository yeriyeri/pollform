<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="padding: 10% 50% 10% 10%; text-align: right" >
	<form action="">
		<%
			if (request.getAttribute("tools") != null) {
				List tools = (List) request.getAttribute("tools");
				Iterator it = tools.iterator();
				while (it.hasNext()) {
					out.print(it.next());
				}
			}
		%>
	</form>
</body>
</html>