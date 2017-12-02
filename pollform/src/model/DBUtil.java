package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static ResultSet findResearchID(Connection con, String editor, String title, String largeCtg,
			String smallCtg, String largeType, String smallType, String tag) {
		String sqlSt = "SELECT ID FROM 설문지 WHERE 작성자=";

		Statement st;
		try {
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

			if (st.execute(sqlSt + "'" + editor + "' AND 제목='" + title + "' AND 대분류='" + largeCtg + "' AND 세부분류='"
					+ smallCtg + "' AND 유형='" + largeType + "' AND 세부유형='" + smallType + "' AND 검색태그='" + tag + "'")) {
				return st.getResultSet();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void insertResearch(Connection con, String editor, String title, String largeCtg, String smallCtg,
			String largeType, String smallType, String qAmount, String startDate, String endDate, String tag)
			throws SQLException {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM 설문지");

			uprs.moveToInsertRow();

			uprs.updateString("작성자", editor);
			uprs.updateString("제목", title);
			uprs.updateString("대분류", largeCtg);
			uprs.updateString("세부분류", smallCtg);
			uprs.updateString("유형", largeType);
			uprs.updateString("세부유형", smallType);
			uprs.updateString("문항수", qAmount);
			uprs.updateString("시작일", startDate);
			uprs.updateString("마감일", endDate);
			uprs.updateString("검색태그", tag);
			uprs.insertRow();
			uprs.beforeFirst();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
	}

	public static void insertQuestion(Connection con, int researchID, int questionID, String question, String ans1,
			String ans2, String ans3, String ans4, String ans5) throws SQLException {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet uprs = stmt.executeQuery("SELECT * FROM 문항");

			uprs.moveToInsertRow();

			uprs.updateInt("설문지ID", researchID);
			uprs.updateInt("문항ID", questionID);
			uprs.updateString("질문", question);
			uprs.updateString("1번", ans1);
			uprs.updateString("2번", ans2);
			uprs.updateString("3번", ans3);
			uprs.updateString("4번", ans4);
			uprs.updateString("5번", ans5);
			uprs.insertRow();
			uprs.beforeFirst();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}
	}

	public static void updateQuestion(Connection con, int researchID, int questionID, String question, String ans1, String ans2, String ans3, String ans4, String ans5) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement("UPDATE 문항 SET 질문=?, 1번=?, 2번=?, 3번=?, 4번=?, 5번=? WHERE 설문지ID=? AND 문항ID=?");
			pstmt.setString(1, question);
			pstmt.setString(2, ans1);
			pstmt.setString(3, ans2);
			pstmt.setString(4, ans3);
			pstmt.setString(5, ans4);
			pstmt.setString(6, ans5);
			pstmt.setInt(7, researchID);;
			pstmt.setInt(8, questionID);;
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
}
