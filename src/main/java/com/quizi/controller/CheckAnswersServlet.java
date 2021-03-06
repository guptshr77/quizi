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
import com.quizi.model.CheckAnswers;
import com.quizi.model.Question;
import com.quizi.model.Report;
import com.quizi.model.User;

/**
 * Servlet implementation class CheckAnswersServlet
 */
@WebServlet("/CheckAnswersServlet")
public class CheckAnswersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckAnswersServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Question> questions = (List<Question>)request.getAttribute("questions");
		
		//send to chechAnwerBO
		CheckAnswersBO checkAnswerBO = new CheckAnswersBO();
		List<Report> reports = checkAnswerBO.checkAnswer(request);

		request.setAttribute("reports", reports);
		
		//send report info to Response Servlet
		RequestDispatcher rd = request.getRequestDispatcher("/ResponseServlet");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
