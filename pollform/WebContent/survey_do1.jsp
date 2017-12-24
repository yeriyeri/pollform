<%@page import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%

//세션이 없으면 경고창 출력후, login.jsp 페이지로 이동
session = request.getSession(true);
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx"); //결과를 출력할 객관식 질문의 idx값 저장

//id passwd name가져오기
String num = request.getParameter("num");
String subject = request.getParameter("subject");
String kind=request.getParameter("kind");


ResultSet rs = null;
ResultSet rs2   = null;

Connection con = null;
String url = "jdbc:mysql://localhost:3306/pollform";
String user = "root";
String pwd = "401sql";

PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
PreparedStatement update_pstmt = null;

String sql = "";



try {
	
	 Class.forName("com.mysql.jdbc.Driver");
	 // 2단계 디비연결
	 con = DriverManager.getConnection(url,user,pwd);
    //현재 진행중인(view값이 on인) 객관식 질문목록을 가져오는 query문 실행
	String query = "SELECT idx, kind FROM object1 ";
	pstmt = con.prepareStatement(query);
    rs = pstmt.executeQuery();

	//현재 진행중인(view값이 on인) 주관식 질문목록을 가져오는 query문 실행
	String query2 = "SELECT idx FROM subj_list ";
	pstmt2 = con.prepareStatement(query2);
    rs2 = pstmt2.executeQuery();

	String updateQuery=null; //각 질문에 대한 설문결과를 반영하기 위한 query문을 저장하는 변수 선언

	while(rs.next()){
		//현재 진행중인(view값이 on인) 객관식 질문들중 사용자가 선택하지 않은 질문이 있다면 경고창 출력 후, 프로그램 실행 중지(return)
		String var = request.getParameter("obj_"+rs.getString("idx"));

		if(null == var){%>
			<SCRIPT language="JavaScript">
				alert("모든 질문에 답변해주셔야 합니다.");
				history.back(-1);
			</SCRIPT>
		<%return;}
	}

	while(rs2.next()){
		//현재 진행중인(view값이 on인) 주관식 질문들중 사용자가 작성하지 않은 질문이 있다면 경고창 출력 후, 프로그램 실행 중지(return)
		String var = request.getParameter("subj_"+rs2.getString("idx"));

		if("" == var){%>
			<SCRIPT language="JavaScript">
				alert("주관식 질문도 모두 답변해주셔야 합니다.");
				history.back(-1);
			</SCRIPT>
		<%return;}
	}

	rs.beforeFirst(); //위에서 객관식 진행질문에 모두 답했는지 체크하기 위해 ResultSet을 사용했으므로 다시 ResultSet을 셋팅(while문을 위해 beforeFirst() 사용)
	while(rs.next()){
		if(rs.getString("kind").equals("radio")){ //종류가 라디오버튼이면 유일한 하나의 선택값 request.getParameter("obj_"+rs.getString("idx"))을 토대로 투표값 증가 query문 실행
			updateQuery = "UPDATE object1 SET "+request.getParameter("obj_"+rs.getString("idx"))+"_count="+request.getParameter("obj_"+rs.getString("idx"))+"_count"+"+1 WHERE idx="+rs.getString("idx");

			try {
				update_pstmt = con.prepareStatement(updateQuery); 
				update_pstmt.executeUpdate();  
			} catch (SQLException e) {
				out.println("err:"+e.toString());
			}
		}else if(rs.getString("kind").equals("checkbox")){ //종류가 체크버튼이면 일단 arr[] 배열변수를 선언하여 선택값들을 arr[i]에 저장하고 그 값들을 토대로 투표값을 각각 증가시키는 query문 실행
			String arr[] = request.getParameterValues("obj_"+rs.getString("idx"));
			for(int i=0;i<arr.length;i++){
				updateQuery = "UPDATE object1 SET "+arr[i]+"_count="+arr[i]+"_count"+"+1 WHERE idx="+rs.getString("idx");
				
				try {
					update_pstmt = con.prepareStatement(updateQuery); 
					update_pstmt.executeUpdate();  
				} catch (SQLException e) {
					out.println("err:"+e.toString());
				}
		
			}
		}
	}

	rs2.beforeFirst(); //위에서 주관식 진행질문에 모두 답했는지 체크하기 위해 ResultSet을 사용했으므로 다시 ResultSet을 셋팅(while문을 위해 beforeFirst() 사용)

	while(rs2.next()){
		//해당 주관식 질문의 idx값과 사용자가 입력한 text, 그리고 현재시간을 주관식 답변목록 table에 저장하는 query문 실행
		updateQuery = "INSERT INTO subj_answer VALUES('"+rs2.getString("idx")+"','"+request.getParameter("subj_"+rs2.getString("idx"))+"')";

		try {
			update_pstmt = con.prepareStatement(updateQuery); 
			update_pstmt.executeUpdate();  
		} catch (SQLException e) {
			out.println("err:"+e.toString());
		}
	}

	update_pstmt.close();     // ResultSet 종료
	rs.close();     // ResultSet 종료
    pstmt.close();     // Statement 종료
	rs2.close();     // ResultSet 종료
    pstmt2.close();     // Statement 종료
    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>
<SCRIPT language="JavaScript">
	alert("참여해주셔서 감사합니다.");
	
</SCRIPT>