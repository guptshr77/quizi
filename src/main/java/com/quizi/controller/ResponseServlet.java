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
import com.quizi.bo.UserBO;
import com.quizi.model.Report;
import com.quizi.model.User;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Report> reports = (List<Report>)request.getAttribute("reports");

		if (reports != null){
			UserBO userBO = new UserBO();
			User user = userBO.getUserDetails(Integer.parseInt(request.getParameter("userId")));
			request.setAttribute("user", user);
			
			request.setAttribute("reports", reports);
			RequestDispatcher rd = request.getRequestDispatcher("report.jsp");
			rd.forward(request, response);			
		}else {
			request.setAttribute("message", "Please answer all the questions.");
			RequestDispatcher rd = request.getRequestDispatcher("questions.jsp");
			rd.forward(request, response);			
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
