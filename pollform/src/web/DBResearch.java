package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class DBResearch
 */
@WebServlet("/dbResearch")
public class DBResearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBResearch() {
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

		HttpSession session = request.getSession();

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
//		if(conn == null)
//			System.out.println("conn2 null");
//		else
//			System.out.println("conn2 not null");

		for (int i = 0; i < Integer.parseInt(session.getAttribute("qAmount").toString()); i++) {
			String question = (String)request.getParameter("questionNumber" + (i + 1));
//			System.out.println( question + "\n");
			int innerAmount = 1;
			String sType  = (String) session.getAttribute("smallType");

			// 4지선다
			if(sType.equals("sType1"))
				innerAmount = 4;
			else if(sType.equals("sType2")) //5지선다
				innerAmount = 5;
			else // 서답형
				innerAmount = 1;
			
			String[] answers = new String[5];
			if(innerAmount == 4)
				answers[4] = null;
			else if(innerAmount < 4) {
				answers[1] = null; answers[2] = null; answers[3] = null; answers[4] = null;
				}
			
			for(int j = 0; j < innerAmount; j++) {
				answers[j] = (String) request.getParameter("answerNumber" + (i+1) + "_" + (j+1));
			//System.out.println(answers[j]);
			}
			
			try {
				DBUtil.updateQuestion(conn, Integer.parseInt(session.getAttribute("researchID").toString()), (i+1), question, answers[0], answers[1], answers[2], answers[3], answers[4]);
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//System.out.println( "researchID: " + session.getAttribute("researchID") + " qAmount: " + session.getAttribute("qAmount"));
		RequestDispatcher view = request.getRequestDispatcher("makeFormResult.html");
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
