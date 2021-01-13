package com.quizi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quizi.bo.CheckAnswersBO;
import com.quizi.model.Report;

/**
 * Servlet implementation class ResponseServlet
 */
@WebServlet("/ResponseServlet")
public class ResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResponseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Report> reports = (List<Report>)request.getAttribute("reports");
		
		if (reports != null){
			request.setAttribute("reports", reports);
			RequestDispatcher rd = request.getRequestDispatcher("jsps/report/report.jsp");
			rd.forward(request, response);			
		}else {
			request.setAttribute("message", "Your answers were not stored. Make sure you have answered all questions.");
			RequestDispatcher rd = request.getRequestDispatcher("jsps/questionaire/questions.jsp");
			rd.forward(request, response);			
		}

		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
