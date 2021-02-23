package com.quizi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quizi.bo.QuestionsBO;
import com.quizi.bo.UserBO;
import com.quizi.model.Question;
import com.quizi.model.User;

/**
 * Servlet implementation class QuestionServlet
 */
@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("userId") != null) {
			UserBO userBO = new UserBO();
			User user = userBO.getUserDetails(Integer.parseInt(request.getParameter("userId")));
			request.setAttribute("user", user);
		}
		//Get Questions for the quiz
		QuestionsBO questionBO = new QuestionsBO();
		List<Question> questions = questionBO.getQuestions();

		request.setAttribute("questions", questions);
		RequestDispatcher rd = request.getRequestDispatcher("jsps/questionaire/questions.jsp");
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
