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
		<a class="nav-link" href="index.html">LogIn</a>
	</div>
	<a href="home.html"
		style="text-align: center; font-size: 1rem; text-align: left;"><h2>
			&nbspStart Poll Form!
			<h2></a> </header>
			
	<!-- footer_banner -->
	<div class="col-11 footer_banner_zone">
		<h3 class="blind">관련사이트</h3>
		<!-- banner -->
		<div class="flow_banner_box" style="text-align: center">
			<div id="banner" class="flow_bann_area" style="margin: 0 auto">
				<ul>
					<li><a href="#"> <img
							src="./images/footer_banner_img_01.jpg" alt="banner_01" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_02.jpg" alt="banner_02" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_03.jpg" alt="banner_03" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_04.jpg" alt="banner_04" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_05.jpg" alt="banner_05" />
					</a></li>

					<li><a href="#"> <img
							src="./images/footer_banner_img_06.jpg" alt="banner_06" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_07.jpg" alt="banner_07" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_01.jpg" alt="banner_01" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_02.jpg" alt="banner_02" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_03.jpg" alt="banner_03" />
					</a></li>
					<li><a href="#"> <img
							src="./images/footer_banner_img_04.jpg" alt="banner_04" />
					</a></li>
				</ul>
			</div>

			<!-- controll -->
			<div class="flow_ctrl_box">
				<a href="#" id="banner_left" class="back"><span class="blind">이전</span></a>
				<a href="#" id="banner_right" class="next"><span class="blind">다음</span></a>
			</div>
			<!-- //controll -->
		</div>
		<!-- //banner -->

	</div>
	<!-- //footer_banner -->
	
	<!-- 	jdbc 연결 시작 -->
	<%
// 		Connection conn = null;
// 		String url = "jdbc:mysql://localhost:3306/researchdb";
// 		String user = "root";
// 		String passwd = "0707";

// 		try {
// 			conn = DriverManager.getConnection(url, user, passwd);
// 			String str = "&nbsp&nbsp&nbspDBConnection Success!<br/>";
// 			if (conn != null)
// 				out.println("<a href=\"makeForm.html\">" + str + "</a><br/>");
// 		} catch (SQLException e) {
// 			// TODO Auto-generated catch block
// 			e.printStackTrace();
// 		}

// 		try {
// 			ResultSet rs = DBUtil.researchList(conn);
// 			if (rs != null)
// 				while (rs.next()) {
// 					out.println("<div class=\" div-display\">" + "\n" + "설문지ID: " + rs.getString(1) + "\n"
// 							+ "작성자: " + rs.getString(2) + "\n" + "제목: " + rs.getString(3) + "\n" + "대분류: "
// 							+ rs.getString(4) + "\n" + "세부분류: " + rs.getString(5) + "\n" + "유형: " + rs.getString(6)
// 							+ "\n" + "세부유형: " + rs.getString(7) + "\n" + "문항수: " + rs.getString(8) + "\n" + "시작일: "
// 							+ rs.getString(9) + "\n" + "마감일: " + rs.getString(10) + "\n" + "태그: " + rs.getString(11)
// 							+ "\n</div>");
// 				}
// 		} catch (SQLException e) {
// 			e.printStackTrace();
// 		}
	%>
	<!-- 	jdbc 연결 끝 -->
	<footer></footer>
</body>
</html>