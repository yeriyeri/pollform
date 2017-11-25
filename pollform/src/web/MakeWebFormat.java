package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MakeWebTools;

/**
 * Servlet implementation class MakeWebFormat
 */
@WebServlet("/makeWebFormat")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String reschName = (String) request.getParameter("reschName");
		String largeCategory = (String) request.getParameter("largeCategory");
		String smallCategory = (String) request.getParameter("smallCategory");
		String largeType = (String) request.getParameter("largeType");
		String smallType = (String) request.getParameter("smallType");
		String qAmount = (String) request.getParameter("qAmount");
		String startDate = (String) request.getParameter("startDate");
		String endDate = (String) request.getParameter("endDate");
		String tag = (String) request.getParameter("tag");
		
		request.setAttribute("reschName", reschName);
		request.setAttribute("lCtg", largeCategory);
		request.setAttribute("sCtg", smallCategory);
		request.setAttribute("lType", largeType);
		request.setAttribute("sType", smallType);
		request.setAttribute("qAmount", qAmount);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("tag", tag);
		
		MakeWebTools tool = new MakeWebTools();
		List<String> tools = tool.makeWebTool(largeType, smallType, qAmount);
		//List<String> tools = tool.makeWebTool("lTyp1", "sType1", "4");
		
		request.setAttribute("tools", tools);
		RequestDispatcher view = request.getRequestDispatcher("makeFormJSP.jsp");
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
