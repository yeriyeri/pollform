<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="my_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Poll Form</title>
<script type="text/javascript">
	function chkword(obj, maxByte) {
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}
		// 넘어가는 글자는 자른다.
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}
</script>
</head>
<body>
	<header>
	<div class="row align-right">
		<form>
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for...">
				<span class="input-group-btn"> <input type="button"
					class="btn btn-primary" value="검색">
				</span>
			</div>
		</form>
		<a class="nav-link" href="index.html">LogIn</a>
	</div>
	<a class="header-a" href="index.html"><h2>
			&nbsp&nbsp&nbspStart Poll Form!
			<h2></a> </header>
	<div class="row" style="margin-top: 3%">
		<div class="col-8 input-box">
			<form method="POST" action="dbResearch.do">
				<%
					if (request.getAttribute("tools") != null) {
						List tools = (List) request.getAttribute("tools");
						Iterator it = tools.iterator();
						while (it.hasNext()) {
							out.print(it.next());
						}
					}
				%>
				<input type="submit" value="등록" class="btn btn-primary"
					style="margin: 0% auto 0% auto">
			</form>
		</div>
	</div>
</body>
</html>