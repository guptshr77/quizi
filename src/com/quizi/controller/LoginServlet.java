package com.quizi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quizi.bo.UserBO;
import com.quizi.dal.UserDAO;
import com.quizi.model.LoginInfo;
import com.quizi.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginInfo login = new LoginInfo();

		login.setUsername(request.getParameter("username"));
		login.setPassword(request.getParameter("password"));

		UserBO loginbo = new UserBO();

		User user = loginbo.login(login);
		if (user != null) {
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("QuestionServlet");
			rd.forward(request, response);	
		}else {
			request.setAttribute("message", "The Username or Password is not corret");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
