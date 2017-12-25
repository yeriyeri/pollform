<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="my_style.css" />
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
<style type="text/css">
#workspace_middle {
	background-color: #F5F7F9;
	height: auto;
	margin: 0px 6% 6% 6%;
	padding-top: 6%;
	padding-left: 15%;
}

#workspace_middle div {
	background-color: none;
	height: auto;
	width: 50%;
	margin-bottom: 100px;
	display: inline-block;
	text-align: left;
	text-align: text-top;
}

.stype {
	line-height: 20px;
	width: 70%;
}

.stype2 {
	line-height: 20px;
	width: 70%;
	height: 50px;
}

#makeJSP_btn {
	border: 0.5px solid black;
	background: white;
	width: 45%;
	line-height: 40px;
	align: middle;
	display: block;
}
</style>
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
	<div class="row" style="margin-top: 3%;">
		<div class="col-8 input-box"
			style="padding-bottom: 2%; margin-bottom: 3%">
			<form method="POST" action="dbParticipate.do">
				<%
					int curNum = Integer.parseInt(session.getAttribute("curNum").toString());
					if (session.getAttribute("research") != null) {
						List<String> tools = (List) session.getAttribute("research");
						out.print(tools.get(curNum));
						curNum++;
					}
					session.setAttribute("curNum", curNum);
					out.print("<input type=\"submit\" value=\"다음\" class=\"btn btn-primary\" value=\"작성 완료\" style=\"margin-top: 3%; margin-bottom: 4%\">");
				%><br />
			</form>
		</div>
	</div>
</body>
</html>