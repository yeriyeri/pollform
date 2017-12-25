<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="my_style.css" />
<link type="text/css" rel="stylesheet" href="normalize.css" />
<link type="text/css" rel="stylesheet" href="mystyle.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
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
	<div class="row" style="padding-top: 1%;">
		<div class="col-8 input-box" style="padding-bottom: 5%;">
			<form method="POST" action="loginConfirm.jsp">
				<div style="padding-top:5%; margin-bottom: 10%">
					<input type="text" name="id" class="makeLine"
						placeholder="&nbsp&nbsp아이디" border="1px solid black"> <input
						type="password" name="passwd" class="makeLine"
						placeholder="&nbsp&nbsp비밀번호"> <input type="submit"
						value="로그인" class="btn btn-primary">
				</div>
			</form>
			<div id="index_find">
				<button class="btn btn-primary"><a href="findIdpw.jsp" class="move" target="_parent" style="display: block">아이디/비밀번호 찾기</a></button>
				 <button class="btn btn-primary"><a href="join_member.jsp" class="move" target="_parent" style="display: block">회원가입</a></button>
			</div>
		</div>
	</div>
</body>
</html>
