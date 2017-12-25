<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.DBUtil"%>
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
		<div class="col-8 input-box" style="padding: 5% 5% 5% 5%;">
			<form action="drop.jsp" method="post">
				<td><input class="makeLine" type="text" placeholder="아이디 입력"
					name="id">
				<td><input class="makeLine" type="text" placeholder="비밀번호 입력"
					name="passwd"></td> <input type="submit" value="탈퇴하기"
					class="btn btn-primary">

			</form>
		</div>
</body>
</html>
