<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, check.SearchService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" type="text/css" href="my_style.css" />
<link type="text/css" rel="stylesheet" href="normalize.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String phone = request.getParameter("phone");
String Phone=phone;
SearchService searchService = SearchService.getInstance();

String id = searchService.searchId(name,phone);



%>
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
			<a class="nav-link" href="index.html" style="font-size: 13px;">LogIn</a>
			<a class="nav-link" href="findIdpw.jsp" target="_parent" style="font-size: 13px; margin-left: -20px">아이디/비밀번호 찾기</a>
			<a class="nav-link" href="join_member.jsp" target="_parent" style="font-size: 13px; margin-left: -25px">회원가입</a>
		</div>
		<a class="header-a" href="index.html"><h2>
				&nbsp&nbsp&nbspStart Poll Form!
				<h2></a>
	</header>
		<div class="row" style="margin-top: 3%">
			<div class="col-8 input-box">
				<h3>&lt아이디 찾기&gt</h3><br/>
				<h5 style=""><%if(name!= null){ %>
   
      <%=name%>님의 아이디는  <%=id%>입니다.</h5><br/> 

 <%} else{%>
				<h5 style="color: red">입력한 정보와 일치하는 사용자가 존재하지 않습니다.</h5><br/>      <%} %>
				<button class="btn btn-primary"><a href="index.jsp">메인으로 이동</a></button>
				<button class="btn btn-primary"><a href="findIdpw.jsp">아이디/비밀번호 찾기로 이동</a></button>
			</div>
	</div>
</body>
</html>
