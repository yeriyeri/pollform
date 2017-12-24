<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
       import="java.sql.Connection,java.sql.PreparedStatement"%>
       <%@page import="java.sql.DriverManager" %>
       <%@page import="java.sql.SQLException" %>
       <%@page import="java.sql.ResultSet" %>
       
       <%!
       Connection conn;
       PreparedStatement pstmt;
       ResultSet rs;
       
       public void init(){
    	   try{
    		   Class.forName("com.mysql.jdbc.Driver");
    	   }catch(ClassNotFoundException e){
    		   e.printStackTrace();
    	   }
       }
    	   public void setConnection(){
    		   try
    		   {conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pollform","root","401sql");
    	   }catch(SQLException e){
    		   e.printStackTrace();}
    	   }
       %>
 
 
 <%
 String id=request.getParameter("id");
 try{
	 this.setConnection();
	 String sql="select * from member where id=?";
	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,id);
	 rs=pstmt.executeQuery();
 }catch(SQLException e) {
	 e.printStackTrace();
 }%>
 
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function checkIdClose(id){
	opener.userInfo.id.value=id;
	window.close();
	opener.userInfo.passwd.focus();
}</script>
</head>
<body>
<form method="post" action="idcheck.jsp">
<%
try{
	if(rs.next()||(id==null)){
		%>
		현재 <%=id%> 사용불가능 <br></br>
		아이디:<input type="text" name="id"></input>
		<input type="submit" value="중복체크"> </input>
		
		<%
	} else
	{
		%>
		
		현재 <%=id%> 사용가능
		<a href="checkId.jsp">다른 아이디 고르기</a><br></br>
		<input type="button" value="현재 아이디 선택" onClick="javascript:checkIdClose('<%=id%>')">	
		
		<%
	}
} catch(SQLException e) {e.printStackTrace();}
		
	
		
		finally{
			try
			{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
		}
			catch(SQLException e2){
				e2.printStackTrace();
			}

	}
%></form>

</body>
</html>