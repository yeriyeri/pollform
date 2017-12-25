package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;
import model.FindCtg;

/**
 * Servlet implementation class GetResearchInfo
 */
@WebServlet("/getResearchInfo.do")
public class GetResearchInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetResearchInfo() {
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
		int researchID = Integer.parseInt(request.getParameter("researchID").toString());

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		String result = "";
		ResultSet rs = DBUtil.getResearchInfo(conn, researchID);

		RequestDispatcher view = request.getRequestDispatcher("getResearchInfo.jsp");

		String lType = "";
		String sType = "";

		if (rs != null) {
			try {
				while (rs.next()) {
					List<String> strs = FindCtg.Ctg(rs.getString(4), rs.getString(5));
					System.out.println(rs.getString(6));
					if (rs.getString(6).equals("lType1")) {
						lType = "선다형";
						if (rs.getString(7).equals("sType1"))
							sType = "4지선다";
						else
							sType = "5지선다";
					} else {
						lType = "서답형";
						if (rs.getString(7).equals("sType3"))
							sType = "단답형";
						else
							sType = "서술형";
					}
					
					result = "<div><p>설문조사명: <input type=\"hidden\" name=\"researchID\" value=\"" + rs.getString(1)
							+ "\"/>" + rs.getString(3) + "</p><p>조사자: " + rs.getString(2) + "</p><p>카테고리 대분류: " + strs.get(0)
							+ "</p><p>카테고리 세부 분류: " + strs.get(1) + "</p><p>조사 시작일: " + rs.getString(9) + "<p></p>조사 마감일: "
							+ rs.getString(10) + "</p><p>유형: " + lType + "</p><p>세부 유형: " + sType + "</p><p>태그: " + rs.getString(11)
							+ "</p></div><br/><br/>";
					System.out.println("ResearchID: " + rs.getString(1));
				}

				request.setAttribute("result", result);
				view.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else
			System.out.println("널값");

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
