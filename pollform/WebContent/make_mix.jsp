<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");



Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";



PreparedStatement pstmt2 = null;
ResultSet rs2   = null;
PreparedStatement pstmt3 = null;
ResultSet rs3   = null;

String sql = "";


try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
	 
	 


	    // 객관식 질문목록 가져오는 PreparedStatement
		String query2 = "SELECT idx,subject,kind FROM object1";
		pstmt2 = con.prepareStatement(query2);
	    rs2 = pstmt2.executeQuery();
		
	    // 주관식 질문목록 가져오는 PreparedStatement
		String query3 = "SELECT idx,subject FROM subj_list";
		pstmt3 = con.prepareStatement(query3);
	    rs3 = pstmt3.executeQuery();
    
	  %>
	  
	  <html>
<head>
<STYLE type="text/css">
p, a, ul, li, td, h1, h2, h3{ font-family: verdana, arial, helvetica, sans-serif; font-size: 20px; color: #353535;}
a { text-decoration: none; color:#191919; font-weight: bold;}
a:hover { text-decoration: none; color:#5D5D5D; font-weight: bold;}
h1 { font-size: 16px; font-weight: bold; margin-bottom: -10px;}
h2 { font-size: 13px; font-weight: bold; margin-top: 3px;}
h3 { font-size: 12px; font-weight: bold; margin-top: 3px;}
.caption { font-size: 10px; color: #333333;}
.null {color: #999999; font-weight: bold;}
.normal { font-weight: normal;}
.normal:hover { font-weight: normal;}
.textonly { font-size: xx-small;}
.textonly:hover { font-size: xx-small;}
</STYLE>
<title>혼합형 설문조사 만들기</title>
</head>
<body>
<form name="admin" action="survey_do.jsp" method="POST">
	<table border="1" width="916" align="center" cellspacing="0" bordercolordark="white" bordercolorlight="black">
		
		<tr>
			<th width="590" colspan="40" bgcolor="#ABD0CE">객관식 질문목록</th>
		</tr>
        <tr>
            <td width="90">
                <p align="center"><b>설문번호</b></p>
            </td>
            <td width="200">
                <p align="center"><b>질문제목</b></p>
            </td>
            <td width="150">
                <p align="center"><b>질문유형</b></p>
            </td>
           <td width="150">
                <p align="center"><b>관리</b></p>
            </td>
        </tr>
<% int count=0; String objLastIdx=null; //객관식 질문갯수 파악을 위한 Int형 변수 cnt와 마지막 객관식 질문번호 파악을 위한 String형 변수 objLastIdx 선언 %>
<% while(rs2.next()){ %>
<SCRIPT language="JavaScript">

function obj_DetailView(idx){
	window.open("obj_view.jsp?idx="+idx,"DetailView","width=500, height=211, toolbar=no, location=no, staus=no");
}
//질문별 결과보기 함수(해당 객관식 질문의 idx번호를 매개변수로 받음)


//질문별 상세보기 함수(해당 객관식 질문의 idx번호를 매개변수로 받음)
function obj_Delete(idx){
    var cons = confirm("정말 삭제하시겠습니까?");

    if (cons){
        location.href = "obj_delete.jsp?idx="+idx;
    }
}

//질문별 삭제 함수(해당 객관식 질문의 idx번호를 매개변수로 받음)

</SCRIPT>
        <tr>
            <td width="90">
                <p align="center"><%=rs2.getString("idx")%></p>
            </td>
            <td width="200">
                <p align="center"><a href="#" onClick="obj_DetailView(<%=rs2.getString("idx")%>)"><%=rs2.getString("subject")%></a></p>
            </td>
            
      
            <td width="150">
				<p align="center">
				<%="radio".equals(rs2.getString("kind"))?"라디오버튼":""%>
				<%="checkbox".equals(rs2.getString("kind"))?"체크버튼":""%>
				</p>
            </td>
         <td width="150">
                <p align="center"><A href="obj_modify.jsp?idx=<%=rs2.getString("idx")%>">[수정]</A>  &nbsp;&nbsp;<A href="#" onClick="obj_Delete(<%=rs2.getString("idx")%>)">[삭제]</A></p>
            </td>
           
        </tr>
<% count++; objLastIdx=rs2.getString("idx"); //각 레코드 갯수만큼 cnt 값 증가, 각 레코드의 idx번호를 objLastIdx변수에 계속 덮어씀으로써 최종적으로는 마지막 객관식 질문 idx번호를 저장
} // end while %><input type="hidden" name="objLastIdx" value="<%=objLastIdx%>"><!--마지막 객관식 질문 idx번호가 저장되 있는 objLastIdx 변수값을 hidden type으로 전달-->
		<tr align="center">
			<td colspan="4">총 <%=count %>개</td>
			
		</tr>
		<tr>
			<th width="590" colspan="5" bgcolor="#ABD0CE">주관식 질문목록</th>
		</tr>
        <tr>
            <td width="90">
                <p align="center"><b>설문번호</b></p>
            </td>
            <td width="350">
                <p align="center"><b>질문제목</b></p>
            </td>
             <td width="150">
                <p align="center"><b>관리</b></p>
            </td>
        </tr>
<% count=0; String subjLastIdx=null; //주관식 질문갯수 파악을 위한 Int형 변수 cnt 초기화와 마지막 주관식 질문번호 파악을 위한 String형 변수 subjLastIdx 선언 %>
<% while(rs3.next()) { %>
<SCRIPT language="JavaScript">

function subj_DetailView(idx){
	window.open("subj_view.jsp?idx="+idx,"DetailView","width=500, height=135, toolbar=no, location=no, staus=no");
}


//질문별 상세보기 함수(해당 주관식 질문의 idx번호를 매개변수로 받음)

//질문별 결과보기 함수(해당 주관식 질문의 idx번호를 매개변수로 받음)
function subj_Delete(idx){
    var cons = confirm("정말 삭제하시겠습니까?");

    if (cons){
        location.href = "subj_delete.jsp?idx="+idx;
    }
}//질문별 삭제 함수(해당 주관식 질문의 idx번호를 매개변수로 받음)

</SCRIPT>
        <tr>
            <td width="90">
                <p align="center">주-<%=rs3.getString("idx")%></p>
            </td>
           <td width="350">
                <p align="center"><a href="#" onClick="subj_DetailView(<%=rs3.getString("idx")%>)"><%=rs3.getString("subject")%></a></p>
            </td>

             <td width="150">
                <p align="center"><A href="subj_modify.jsp?idx=<%=rs3.getString("idx")%>">[수정]</A>  &nbsp;&nbsp;<A href="#" onClick="subj_Delete(<%=rs3.getString("idx")%>)">[삭제]</A></p>
            </td>
          
           
        </tr>
<% count++; subjLastIdx=rs3.getString("idx"); //각 레코드 갯수만큼 cnt 값 증가, 각 레코드의 idx번호를 subjLastIdx변수에 계속 덮어씀으로써 최종적으로는 마지막 주관식 질문 idx번호를 저장
}  %>
<input type="hidden" name="subjLastIdx" value="<%=subjLastIdx%>"><!--마지막 주관식 질문 idx번호가 저장되 있는 subjLastIdx 변수값을 hidden type으로 전달-->
		<tr align="center">
			<td colspan="3">총 <%= count %>개</td>
		
		</tr>
		<tr>
			<p align="center"><input type="button" value="객관식 질문 생성" onclick="location.href='add_obj.jsp'">
	
		<input type="button"  value="주관식 질문 생성" onclick="location.href='add_subj.jsp'"></p>
		</tr>
		
		
    </table>
   <p align="center"><input type="submit" value="확인">  &nbsp;&nbsp;<input type="reset" value="취소"> </p>

</form>
</body>
</html>
<%

	
	rs2.close();     // ResultSet 종료
	rs3.close();     // ResultSet 종료
   
    pstmt2.close();     // Statement 종료
    pstmt3.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>

  
	    
	    
    