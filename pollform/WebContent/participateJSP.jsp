<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css" />
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
<body class="index">
	<!-- 공통 부분-->
	<div class="index_top" display="block">
		<table align="right" class="index_topSrc">
			<tr>
				<td style="border: none"><input type="text" name="tagSrc"
					placeholder="&nbsp&nbsp태그 검색" style="line-height: 17px;"></td>
				<td style="border: none"><input type="submit" value="검색"
					style="margin-left: -6px; border: none; height: 23px; color: white; background-color: #4d4d4d">
				</td>
			</tr>
		</table>
		<header> <a href="index.html" target="_parent">&nbsp&nbsp&nbspPoll
			Form</a> </header>
	</div>
	<!-- 공통 부분 끝 -->
	<div width="100%" height="100%" id="workspace_middle">
		<!-- 메인 section 시작 -->
		<section> <!-- section1 시작 --> <!-- section1 끝--> </section>
		<!-- section2 시작 -->
		<section>
		<form method="POST" action="dbParticipate.do">
			<%
				int curNum = Integer.parseInt(session.getAttribute("curNum").toString());
				if (session.getAttribute("research") != null) {
					List<String> tools = (List) session.getAttribute("research");
					out.print(tools.get(curNum));
					curNum++;
				}
				session.setAttribute("curNum", curNum);
				out.print("<input type=\"submit\" value=\"다음\" id=\"makeJSP_btn\" style=\"margin-left: 15%;\">");
			%><br />
		</form>
		<br />
		<br />
		<br />
		<br />
		<br />
		</section>
		<!-- section2 끝-->
	</div>
</body>
</html>