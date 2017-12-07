package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

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
 * Servlet implementation class DBParticipate
 */
@WebServlet("/dbParticipate.do")
public class DBParticipate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBParticipate() {
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

		HttpSession session = request.getSession();
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		int curNum = Integer.parseInt(session.getAttribute("curNum").toString());
		String result = request.getParameter("group_" + curNum);
		// System.out.println("result: " + result);
		try {
			DBUtil.insertResult(conn, (String) session.getAttribute("userID"),
					Integer.parseInt(session.getAttribute("researchID").toString()), curNum, result);
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DBParticipate 오류");
		}
		RequestDispatcher view = null;
		if (String.valueOf(curNum).equals(session.getAttribute("qAmount").toString()))
			view = request.getRequestDispatcher("participateResult.html");
		else {
			view = request.getRequestDispatcher("participateJSP.jsp");
			session.setAttribute("curNum", curNum);
		}
		
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
