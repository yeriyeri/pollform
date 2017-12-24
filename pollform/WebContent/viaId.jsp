<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="check.SearchService" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mystyle.css" />
</head>
<body class="index">

<%
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String phone = request.getParameter("phone");
String Phone=phone;
SearchService searchService = SearchService.getInstance();

String id = searchService.searchId(name,phone);



%>


	<!-- 공통 부분-->
	<div class="index_top" display="block">
			<table  align="right" class="index_topSrc">
				<tr>
					<td style="border: none">
						<input type="text" name="tagSrc" placeholder="&nbsp&nbsp태그 검색" style="line-height: 17px;">
					</td>
					<td style="border: none">
						<input type="submit" value="검색" style="margin-left: -6px; border: none; height: 23px; color: white; background-color: #4d4d4d">
					</td>
				</tr>
			</table>
		<header>
			<a href="index.html" target="_parent">&nbsp&nbsp&nbspPoll Form</a>
		</header>
		<!-- 메뉴 시작 -->
		<div class="menu">
			<nav id="topMenu" style="width: 1110px; margin:0 auto;">
				<ul style="float: left; text-align: center;">
					<li class="topMenuLi" style="display: inline-block; text-align: center;"><a class="menuLink" href="categoryBasicL.html">교육</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">학교 교육</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">교육 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">문화</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">문학 도서</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">순수예술</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">영화/가요/연예</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">문화 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">매체</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">TV</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">라디오</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">신문</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 매체</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">사회</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">복지</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">자연/환경</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">사회 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">정치</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">국방</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">국회</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">대통령</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">사법/치안</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정당</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정부</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">행정</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">정치 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">경제/산업</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">건설</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">과학</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">교통</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">금융</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">기업</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">대외경제/무역</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">부동산</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">경제 일반</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">산업 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">라이프스타일</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">가정/결혼</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">관광</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">소비</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">여가</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정보</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">직장</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">정보/통신</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">기타 일반</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">특수계층조사</a>
						<ul class="submenu">
							<li><a href="categoryBasicS.html" class="submenuLink">교포/외국인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">노인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">성인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">아동</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">장애인</a></li>
							<li><a href="categoryBasicS.html" class="submenuLink">청소년</a></li>
							<li><a href="" class="submenuLink" style="border-bottom: solid 1px #F5F7F9;">복지</a></li>
						</ul>
					</li>
						<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="categoryBasicL.html">기타</a></li>
				</ul>
			</nav>
		</div>
		<!-- 메뉴 끝 -->
	</div>
	<!-- 공통 부분 끝 -->
	<div id="memR_middle" align="middle">
		<!-- 메인 section 시작 -->
		<section>
			<!-- section1 시작 --><br/></br>
			<div style="color: grey; background-color: white; border: 1px solid grey; height: auto; width: 70%; padding-bottom: 5%;">
				<br/><br/>
				<h3>&lt아이디 찾기&gt</h3><br/>
				<h5 style=""><%if(name!= null){ %>
   
      <%=name%>님의 아이디는  <%=id%>입니다.</h5><br/> 

 <%} else{%>
				<h5 style="color: red">입력한 정보와 일치하는 사용자가 존재하지 않습니다.</h5><br/>      <%} %>
				<button class="makeR_btn"><a href="index.html">메인으로 이동</a></button>
				<button class="makeR_btn"><a href="findIdpw.jsp">아이디/비밀번호 찾기로 이동</a></button>
			</div>
			<!-- section1 끝-->
		</section>
		<!-- 메인 section 끝 -->
	</div>
</head>


  

</body>
</html>

