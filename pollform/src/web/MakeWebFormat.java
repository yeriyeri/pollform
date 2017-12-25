package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
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
import model.MakeWebTools;

/**
 * Servlet implementation class MakeWebFormat
 */
@WebServlet("/makeWebFormat.do")
public class MakeWebFormat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakeWebFormat() {
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

		PrintWriter out = response.getWriter();

		String title = (String) request.getParameter("title");
		String largeCtg = (String) request.getParameter("largeCategory");
		String smallCtg = (String) request.getParameter("smallCategory");
		String largeType = (String) request.getParameter("largeType");
		String smallType = (String) request.getParameter("smallType");
		String qAmount = (String) request.getParameter("qAmount");
		String startDate = (String) request.getParameter("startDate");
		String endDate = (String) request.getParameter("endDate");
		String tag = (String) request.getParameter("tag");

		System.out.println(smallCtg);
		request.setAttribute("title", title);
		request.setAttribute("lCtg", largeCtg);
		request.setAttribute("sCtg", smallCtg);
		request.setAttribute("lType", largeType);
		request.setAttribute("sType", smallType);
		request.setAttribute("qAmount", qAmount);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("tag", tag);

		HttpSession session = request.getSession();
		String editor = "admin";

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

//		if(conn == null)
//			System.out.println("conn null");
//		else
//			System.out.println("conn not null");
		
		try {
			DBUtil.insertResearch(conn, editor, title, largeCtg, smallCtg, largeType, smallType, qAmount, startDate,
					endDate, tag);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ResultSet rs = DBUtil.findResearchID(conn, editor, title, largeCtg, smallCtg, largeType, smallType, tag);

		if (rs != null)
			try {
				if (rs.next())
					try {
						MakeWebTools tool = new MakeWebTools();
						List<String> tools;

						int researchID = Integer.parseInt(rs.getString(1));
						tools = tool.makeWebTool(researchID, largeType, smallType, qAmount, sc);
						request.setAttribute("tools", tools);
						session.setAttribute("researchID", researchID);
						session.setAttribute("qAmount", qAmount);
						session.setAttribute("smallType", smallType);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("설문지ID db오류");
						e.printStackTrace();
					}
				else
					System.out.println("널값");
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		RequestDispatcher view = request.getRequestDispatcher("makeFormJSP.jsp");
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
