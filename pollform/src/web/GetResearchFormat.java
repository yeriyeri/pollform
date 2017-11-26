package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GetResearch;

/**
 * Servlet implementation class GetResearchFormat
 */
@WebServlet("/getResearchFormat")
public class GetResearchFormat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetResearchFormat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String reschName = (String) request.getParameter("reschName");
		String largeCategory = (String) request.getParameter("largeCategory");
		String smallCategory = (String) request.getParameter("smallCategory");
		String largeType = (String) request.getParameter("largeType");
		String smallType = (String) request.getParameter("smallType");
		String qAmount = (String) request.getParameter("qAmount");
		String startDate = (String) request.getParameter("startDate");
		String endDate = (String) request.getParameter("endDate");
		String tag = (String) request.getParameter("tag");
		
		
		GetResearch research = new GetResearch();
		List<String> _research = research.getResearch("lType1", "sType1", "9");
		
		request.setAttribute("research", _research);
		RequestDispatcher view = request.getRequestDispatcher("participateJSP.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
