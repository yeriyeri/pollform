<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="normalize.css" />
<link type="text/css" rel="stylesheet" href="my_style.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="./js/jquery.carouFredSel-5.5.0-packed.js"></script>
<script type="text/javascript" src="./js/flow_banner.js"></script>
<title>Welcome!</title>
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
				<h2></a>
	</header>
	<div class="row" style="margin-top: 4%;">
		<div class="col-8 input-box" style="padding-bottom: 2%; margin-bottom: 3%">
			<form method="POST" action="getResearchFormat.do">
				<%=request.getAttribute("result")%>
				<input type="submit" class="btn btn-primary" value="바로 참여">
			</form>
		</div>
	</div>
</body>
</html>