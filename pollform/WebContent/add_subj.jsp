<%@page contentType="text/html;charset=utf-8" %>
<%
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

%>
<html>
<head>
<title>주관식 질문 추가페이지</title>

<style type="text/css">

               td {border: 1.5px solid grey; width: 100px ; text-align: center;}

        </style>
        
</head>
<body>
<form name="add_subj" action="subj_chk.jsp" method="POST">
    <table border="1.5" width="60%" align="center">
	    <tr>
            <th colspan="2" bgcolor="#f8ecc9">주관식 질문 추가폼</th>
        </tr>
        <tr>
            <td width="190">&nbsp&nbsp&nbsp질문제목</td>
            <td width="638"><input type="text" name="question" size="50"></td>
        </tr>
   
        <tr>
            <td width="834" colspan="2">
                <p align="center"><input type="submit" value="확인"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" onClick="history.back(-1)" value="취소"></p>
            </td>
        </tr>
    </table>
</form>
<p>&nbsp;</p>
</body>
</html> 