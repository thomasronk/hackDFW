package com.src.techMahindraHack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

@WebServlet("/unameCheck")
public class UserNameAvailability extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UserNameAvailability() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DAO dao = new DAO();
		boolean unameExist=false;
		String uname = req.getParameter("uname");
		System.out.println("Uname is "+uname);
		ObjectMapper mapper = new ObjectMapper();
		unameExist=dao.checkUname(uname);
		
		if(unameExist){
			System.out.println("Username exists");
			resp.getWriter().println(mapper.writeValueAsString("Username Exists"));
		}
		else{
			System.out.println("Username available");
			//resp.getWriter().println("Username Available");
			resp.getWriter().println(mapper.writeValueAsString("Username available"));
		}
		
		
	}
}
