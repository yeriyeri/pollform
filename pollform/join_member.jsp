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
	<div class="row align">

	<form method="post" action="tag_result.jsp">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..." name="tagSrc"> 
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
			
	
	<div class="membership_middle" align="middle">
		<div class="membership_input">
		  <form method="POST" action="insertPro.jsp" name="userInfo" onsubmit="return checkValue()">
				<table>
					<tr>
						<td><input class="mi_input" type="text" placeholder="아이디" name="id">
						<input class="mi_input" type="button" id="mi_btn"
							name="중복방지" value="사용가능 ID확인" onClick="javascript:checkId();"></td>
						
					</tr>
					<tr>
						<td><input class="mi_input" type="text" placeholder="비밀번호" name="passwd"></td>
					</tr>
					<tr>
						<td><input class="mi_input" type="text" name="passwd_check"
							placeholder="비밀번호 재확인"></td>
					</tr>
				
	
					<tr>
						<td><input class="mi_input2" type="text" placeholder="이름"  name="name"></td>
						
					</tr>
					<tr>
						<td><input class="mi_input2" type="text" placeholder="생년원일"  name="birth"></td>
					</tr>
					<tr>
						<td><input class="mi_input2" type="text"
							placeholder="연락처"  name="phone"></td>
					</tr>
				</table>
				
	
	<div>	<input type="submit" value="가입" id="member_btn"> </div>
		</form>
			</div>
	</div>

</body>

<script type="text/javascript">

function checkValue(){
	if(!document.userInfo.id.value){ alert("아이디를 입력하시오"); return false;}
	else if(!document.userInfo.passwd.value) {alert("비밀번호를 입력하시오");return false;}
	else if(!document.userInfo.name.value){ alert("사용자 이름을 입력하시오");return false;}
	else if(document.userInfo.passwd.value != document.userInfo.passwd_check.value){
	        alert("비밀번호를 동일하게 입력하세요.");
	        return false;
	      }
	
			else{
				document.userInfo.submit();
		}
}

function checkId(){
	var id=document.userInfo.id.value;
	if(id!="")
		window.open("checkId.jsp?id="+id,"","width=400 height=150");
}



</script>
</html>
