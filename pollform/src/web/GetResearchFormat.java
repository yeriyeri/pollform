package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class GetResearchFormat
 */
@WebServlet("/getResearchFormat.do")
public class GetResearchFormat extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int numID = 1;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetResearchFormat() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 설문지ID
		// int researchID =
		// Integer.parseInt(request.getParameter("researchID").toString());
		int researchID = 121;

		// 참여자ID
		// String userID = (String) request.getParameter("userID");
		String userID = "참여자" + (numID++);

		HttpSession session = request.getSession();
		session.setAttribute("researchID", researchID);
		session.setAttribute("userID", userID);

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		if (userID != null && String.valueOf(researchID) != null)
			try {
				DBUtil.insertResultInfo(conn, userID, researchID);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		ResultSet rs = DBUtil.getResearch(conn, researchID);
		ResultSet rsType = DBUtil.findResearchType(conn, researchID);
		int size = 0;
		int qAmount = 0;
		
		if (rsType != null) {
			try {
				while (rsType.next()) {
					if (rsType.getString(1).equals("sType1"))
						size = 4;
					else if (rsType.getString(1).equals("sType2"))
						size = 5;
					else
						size = 1;
					// 문항수
					qAmount = Integer.parseInt(rsType.getString(2));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("참여자: " + userID + "\n문항수: " + qAmount);
		session.setAttribute("qAmount", qAmount);
		int rowSize = 1;
		List<String> result = new ArrayList<String>();
		String[] answers = new String[size];
		if (rs != null)
			try {
				while (rs.next()) {

					for (int j = 0; j < size; j++)
						if (rs.getString(j + 2) != null)
							answers[j] = rs.getString(j + 2);

					String str = "<h4>문제 " + rowSize + ") " + rs.getString(1) + "</h4><br/>";
					String ans = "<div>" + "<input type=\"radio\" name=\"group_" + rowSize
							+ "\" checked=\"checked\" value=\"1\"> " + answers[0] + "<br/>";

					for (int i = 1; i < answers.length; i++)
						ans += "<input type=\"radio\" name=\"group_" + rowSize + "\" value=\"" + (i + 1) + "\"> "
								+ answers[i] + "<br/>";

					result.add(str + ans + "</div>");
					rowSize++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		// 문항 row = 참여 cols
		int columnSize = rowSize - 1;

		ResultSet rs2 = DBUtil.findColumnMax(conn);
		ResultSetMetaData rsmd;
		int colMax = 0;
		try {
			rsmd = rs2.getMetaData();
			colMax = rsmd.getColumnCount() - 2;
		} catch (SQLException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}

		System.out.println("column Max: " + colMax + "\ncurrent C: " + columnSize);
		if (colMax < columnSize)
			try {
				DBUtil.alterTable(conn, columnSize, colMax);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		int curNum = 0;
		session.setAttribute("curNum", curNum);
		session.setAttribute("rowSize", rowSize - 1);
		session.setAttribute("research", result);
		RequestDispatcher view = request.getRequestDispatcher("participateJSP.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
