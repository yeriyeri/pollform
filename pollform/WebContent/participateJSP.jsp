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
	#workspace_middle{ background-color: #F5F7F9; height: auto; margin: 0px 6% 6% 6%; padding-top: 6%; padding-left: 15%;}
	#workspace_middle div{ background-color: none; height: auto; width: 50%; margin-bottom: 100px; display: inline-block; text-align: left; text-align: text-top;}
	.stype { line-height: 20px; width: 70%;}
	.stype2 { line-height: 20px; width: 70%; height: 50px;}
	#makeJSP_btn{ border: 0.5px solid black; background: white; width: 45%; line-height: 40px; align: middle; display: block;}
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
		<!-- 메뉴 시작 -->
		<div class="menu">
			<nav id="topMenu">
			<ul>
				<li class="topMenuLi"><a class="menuLink" href="">교육</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">학교 교육</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">교육 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">문화</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">문학 도서</a></li>
						<li><a href="" class="submenuLink">순수예술</a></li>
						<li><a href="" class="submenuLink">영화/가요/연예</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">문화 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">매체</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">TV</a></li>
						<li><a href="" class="submenuLink">라디오</a></li>
						<li><a href="" class="submenuLink">신문</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">기타 매체</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">사회</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">복지</a></li>
						<li><a href="" class="submenuLink">자연/환경</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">사회 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">정치</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">국방</a></li>
						<li><a href="" class="submenuLink">국회</a></li>
						<li><a href="" class="submenuLink">대통령</a></li>
						<li><a href="" class="submenuLink">사법/치안</a></li>
						<li><a href="" class="submenuLink">정당</a></li>
						<li><a href="" class="submenuLink">정부</a></li>
						<li><a href="" class="submenuLink">행정</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">정치 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">경제/산업</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">건설</a></li>
						<li><a href="" class="submenuLink">과학</a></li>
						<li><a href="" class="submenuLink">교통</a></li>
						<li><a href="" class="submenuLink">금융</a></li>
						<li><a href="" class="submenuLink">기업</a></li>
						<li><a href="" class="submenuLink">대외경제/무역</a></li>
						<li><a href="" class="submenuLink">부동산</a></li>
						<li><a href="" class="submenuLink">경제 일반</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">산업 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">라이프스타일</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">가정/결혼</a></li>
						<li><a href="" class="submenuLink">관광</a></li>
						<li><a href="" class="submenuLink">소비</a></li>
						<li><a href="" class="submenuLink">여가</a></li>
						<li><a href="" class="submenuLink">정보</a></li>
						<li><a href="" class="submenuLink">직장</a></li>
						<li><a href="" class="submenuLink">정보/통신</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">기타 일반</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">특수계층조사</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">교포/외국인</a></li>
						<li><a href="" class="submenuLink">노인</a></li>
						<li><a href="" class="submenuLink">성인</a></li>
						<li><a href="" class="submenuLink">아동</a></li>
						<li><a href="" class="submenuLink">장애인</a></li>
						<li><a href="" class="submenuLink">청소년</a></li>
						<li><a href="" class="submenuLink"
							style="border-bottom: solid 1px #F5F7F9;">복지</a></li>
					</ul></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">기타</a></li>
			</ul>
			</nav>
		</div>
		<!-- 메뉴 끝 -->
	</div>
	<!-- 공통 부분 끝 -->
	<div width="100%" height="100%" id="workspace_middle">
		<!-- 메인 section 시작 -->
		<section> 
		<!-- section1 시작 -->
			
		<!-- section1 끝--> 
		</section>
		<!-- section2 시작 -->
		<section> 
			<form action="participateResult.html" >
			<%
				if (request.getAttribute("research") != null) {
					List tools = (List) request.getAttribute("research");
					Iterator it = tools.iterator();
					while (it.hasNext()) {
						out.print(it.next());
					}
				}
			%><br/><br/>
				<input type="submit" value="등록" id="makeJSP_btn" style="margin-left: 15%;">
			</form>
			<br/><br/><br/><br/>
		</section>
		<!-- section2 끝--> 
	</div>
</body>
</html>