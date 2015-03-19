package com.src.techMahindraHack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Registration extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Registration(){
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		String uname = req.getParameter("uname");
		String pwd = req.getParameter("pwd");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String dob = req.getParameter("dob");
		String ph_num = req.getParameter("phno");
		String loc = req.getParameter("location");
		
		System.out.println(uname + pwd+fname+lname+dob+ph_num+loc);
	}
}
