package com.src.techMahindraHack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import sun.rmi.log.LogOutputStream;

/**
 * Servlet implementation class User
 */
@WebServlet("/user")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice = request.getParameter("choice");
		if ("logout".equalsIgnoreCase(choice)) {
			String uName = request.getParameter("uname");
			DAO dao = new DAO();
			int ret = dao.updateUserSession(uName);
			response.getWriter().println(ret);
		} else if("annonymous".equalsIgnoreCase(choice)) {
			DAO dao = new DAO();
			KandyUser ku = dao.getKandyUser();
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(mapper.writeValueAsString(ku));
		} else if("rating".equals(choice)) {
			String uname = request.getParameter("uname");
			int rating = Integer.parseInt(request.getParameter("rate"));
			DAO dao = new DAO();
			int status = dao.insertRating(uname, rating);
			response.getWriter().println(status);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
	}

}
