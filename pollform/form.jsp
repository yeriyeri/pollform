<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function checkValue(){
	if(!document.userInfo.id.value) alert("아이디를 입력하시오");
	else if(!document.userInfo.passwd.value) alert("비밀번호를 입력하시오");
	else if(!document.userInfo.name.value) alert("사용자 이름을 입력하시오");
	
			else{
				document.userInfo.submit();
		}
}

function checkId(){
	var id=document.userInfo.id.value;
	if(id!="")
		window.open("idcheck.jsp?id="+id,"","width=400 height=150");
}

</script>


</head>
<body>
<h3>회원가입</h3>

<form action="<%=request.getContextPath()%>/JoinController" method="post" name="userInfo" onsubmit=
	"return checkValue()">


EmailId(*):<input type="text" name="id">  </input>
<input type="button" value="중복체크" onClick="javascript:checkId();"></input><br/>

Passwd(*):<input type="password" name="passwd"> <br/>
Name(*):<input type="text" name="name"> <br/>
phone-number:<input type="text" name="phone"> <br/>
Address:<input type="text" name="Address"> <br/>
Zip(*):<input type="text" name="Zip"> <br/>





<input type="submit" value="가입"><br/>





</form>
</body>
</html>