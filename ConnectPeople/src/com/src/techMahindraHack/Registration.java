package com.src.techMahindraHack;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/register")
public class Registration extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Registration() {
		super();
	}

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 500 * 1024;
	private int maxMemSize = 4 * 1024;
	private File file;

	public void init() {
		// Get the file location where it would be stored.
		filePath = "E:\\Tomcat\\apache-tomcat-7.0.57-windows-x86\\apache-tomcat-7.0.57\\webapps\\";
		// getServletContext().getInitParameter("file-upload");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doGet(req, resp);
		/*
		 * DAO dao = new DAO(); String uname = req.getParameter("uname"); String
		 * pwd = req.getParameter("pwd"); String fname =
		 * req.getParameter("fname"); String lname = req.getParameter("lname");
		 * String dob = req.getParameter("dob"); String ph_num =
		 * req.getParameter("phno"); String loc = req.getParameter("location");
		 * String about = req.getParameter("about"); //String prof_pic =
		 * req.getParameter("pic");
		 * 
		 * System.out.println(uname + pwd+fname+lname+dob+ph_num+loc+about);
		 * 
		 * dao.addNewExpert(uname,pwd,fname,lname,dob,ph_num,loc,about);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		if (ServletFileUpload.isMultipartContent(request)) {

			try {
				Part myStringPart = request.getPart("useradd-name");
				Scanner scanner = new Scanner(myStringPart.getInputStream());
				String uname = scanner.nextLine();
				scanner.close();

				System.out.println(uname);
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				for (FileItem item : multiparts) {

					if (!item.isFormField()) {

						String name = new File(	item.getName()).getName();

						item.write(new File(filePath + File.separator + name));

					}
					System.out.println(item.getFieldName());
					System.out.println(item.getString());

				}
			
				
				DAO dao = new DAO();
				for (Part p : request.getParts()) {
					if ("useradd-name".equalsIgnoreCase(p.getName())) {

					}
				}

				// String uname = request.getParameter("useradd-name");
				// String pwd = request.getParameter("useradd-pass");
				// dao.addNewExpert(uname,pwd,"Ron","THomas","2015-04-06","12345678","Dallas,TX","I am Ron");
				// File uploaded successfully

				// request.setAttribute("message",
				// "File Uploaded Successfully");

			} catch (Exception ex) {

				request.setAttribute("message", "File Upload Failed due to " + ex);

			}

		} else {

			request.setAttribute("message",

			"Sorry this Servlet only handles file upload request");

		}

	}
}
