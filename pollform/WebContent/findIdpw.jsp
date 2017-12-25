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
		<a class="nav-link" href="index.html" style="font-size: 13px;">LogIn</a>
		<a class="nav-link" href="findIdpw.jsp" target="_parent"
			style="font-size: 13px; margin-left: -20px">아이디/비밀번호 찾기</a> <a
			class="nav-link" href="join_member.jsp" target="_parent"
			style="font-size: 13px; margin-left: -25px">회원가입</a>
	</div>
	<a class="header-a" href="index.html"><h2>
			&nbsp&nbsp&nbspStart Poll Form!
			<h2></a> </header>
	<div class="row" style="margin-top: 3%;">
			<div class="col-8 input-box" style="padding-bottom: 5%; margin-bottom: 3%;">
			<h3>아이디/ 비밀번호 찾기입니다!</h3>
			<div class="findIDPW" style="display: inline-block; margin: 1% 5% 1% 5%">
				<form method="POST" action="viaId.jsp">
					<h5>아이디를 찾으려면 다음을 입력하세요</h5>
					<h5>
						이름: <input class="makeLine" type="text" name="name">
					</h5>
					<h5>
						전화번호: <input class="makeLine" type="text" name="phone">
					</h5>
					<button class="btn btn-primary" width="">
						아이디 찾기</a>
					</button>
				</form>
			</div>
			<div class="findIDPW" style="display: inline-block; margin: 1% 5% 1% 5%">
				<form method="POST" action="viaPw.jsp">
					<h5>비밀번호를 찾으려면 다음을 입력하세요</h5>
					<h5>
						아이디: <input class="makeLine" type="text" name="id">
					</h5>
					<h5>
						전화번호: <input class="makeLine" type="text" name="phone">
					</h5>
					<button class="btn btn-primary" width="">
						비밀번호 찾기</a>
					</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
