<%@page contentType="text/html;charset=utf-8" %>
<%
session = request.getSession(true);
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>객관식 질문 추가페이지</title>

<style type="text/css">

               td {border: 1.5px solid grey; width: 100px ; text-align: center;}

        </style>
        
        
</head>
<body>
<form name="add_obj" action="obj_chk.jsp" method="POST">
    <table border="1" width="60%" align="center">
        <tr>
            <th colspan="2" bgcolor="#f8ecc9">객관식 질문 추가폼</th>
        </tr>
        <tr>
            <td width="110">질문제목</td>
            <td width="486"><input type="text" name="question" size="42"></td>
        </tr>
        <tr>
            <td width="110">버튼설정</td>
            <td width="486">
				<select name="button" size="1">
                    <option value="radio">라디오버튼</option>
                    <option value="checkbox">체크버튼</option>
				</select>
			</td>
        </tr>
        <tr>
            <td width="110">항목갯수</td>
            <td width="486">
                <select name="item_num" size="1">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5" selected>5</option>
				</select><font size="2" color="#1F497D">선택한 항목의 개수만큼만 값을 입력해주세용</font>
            </td>
        </tr>
        <tr>
            <td width="110">항목1</td>
            <td width="486"><input type="text" name="item1" size="19"></td>
        </tr>
        <tr>
            <td width="110">항목2</td>
            <td width="486"><input type="text" name="item2" size="19"></td>
        </tr>
        <tr>
            <td width="110">항목3</td>
            <td width="486"><input type="text" name="item3" size="19"></td>
        </tr>
        <tr>
            <td width="110">항목4</td>
            <td width="486"><input type="text" name="item4" size="19"></td>
        </tr>
		<tr>
            <td width="110">항목5</td>
            <td width="486"><input type="text" name="item5" size="19"></td>
        </tr>
        <tr>
            <td width="834" colspan="2">
                <p align="center"><input type="submit" value="확인"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" onClick="history.back(-1)" value="취소"></p>
            </td>
        </tr>
    </table>
</form>
</body>
</html> 