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
	<div class="row align">
		<form>
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for...">
				<span class="input-group-btn"> <input type="button"
					class="btn btn-primary" value="검색">
				</span>
			</div>
		</form>
		<a class="nav-link" href="login.jsp">LogIn</a>
	</div>
	<a href="home.html"
		style="text-align: center; font-size: 1rem; text-align: left;"><h2>
			&nbspStart Poll Form!
			<h2></a> </header>
	<!-- 공통 부분 끝 -->
	<div class="membership_middle" align="middle">
		<div class="membership_input">
		  <form method="POST" action="birth_update.jsp" name="userInfo">
				<table>
					<tr>
						<td><input class="mi_input" type="text" placeholder="아이디" name="id">
						</td>
						
					</tr>
					<tr>
						<td><input class="mi_input" type="text" placeholder="비밀번호" name="passwd"></td>
					</tr>
					
					<tr>
						<td><input class="mi_input2" type="text" placeholder="변경할 생년원일"  name="birth"></td>
					</tr>
					
				</table>
				
	
	<div>	<input type="submit" value="수정" id="member_btn"> </div>
		</form>
			</div>
	</div>
</body>
</html>
