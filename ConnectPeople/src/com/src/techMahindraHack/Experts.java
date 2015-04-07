package com.src.techMahindraHack;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Servlet implementation class Experts
 */
@WebServlet("/experts")
public class Experts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Experts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice = request.getParameter("choice");
		System.out.println(choice);
		if("getdetails".equalsIgnoreCase(choice)) {
			String location = request.getParameter("location");
			String tag = request.getParameter("tag");
			DAO dao = new DAO();
			List<ExpertVO> expVOS = dao.getExpertDetails(location, tag);
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(mapper.writeValueAsString(expVOS));
		}else if("getuserinformation".equalsIgnoreCase(choice)){
			String ename="abc@abc.com"; //  get user information from session
			DAO dao = new DAO();
			ExpertVO expertVO = dao.getUserInformation(ename);
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(mapper.writeValueAsString(expertVO));
			
		}else if("getcomments".equalsIgnoreCase(choice)) {
			String uname= "abc@abc.com";
			if(1==0){ // there is a session 
				
			}else{
				//uname = request.getParameter(uname);
				uname= "abc@abc.com";
				
			}
			System.out.println(uname);
			DAO dao = new DAO();
			List<CommentVO> commentVOs = dao.getComments(uname);
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(mapper.writeValueAsString(commentVOs));
				
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice = request.getParameter("choice");
		System.out.println(choice);
		 if("addcomments".equalsIgnoreCase(choice)) {
			String uname = request.getParameter("uname");
			String name= request.getParameter("name");
			String tag = request.getParameter("tag");
			String onplace = request.getParameter("onplace");
			String onuser = request.getParameter("onuser");
			DAO dao = new DAO();
			int ret = dao.addComment(uname, name,tag,onplace,onuser);
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(new Integer(ret));
		}else if("updateinfo".equalsIgnoreCase(choice)){
			String uname = "abc@abc.com"; // this will come from session 
			String phone= request.getParameter("phone");
			String location = request.getParameter("location");
			String aboutme = request.getParameter("aboutme");
			int isPhone =  Integer.parseInt(request.getParameter("isphone"));
			int isAudio = Integer.parseInt(request.getParameter("isAduio"));
			int isVideo = Integer.parseInt(request.getParameter("isVideo"));
			int isMessage = Integer.parseInt(request.getParameter("isMessage"));
			
			DAO dao  = new DAO();
			int ret = dao.updateInfo(uname,phone,location,aboutme,isPhone,isAudio,isVideo,isMessage);
			ObjectMapper mapper = new ObjectMapper();
			response.getWriter().println(new Integer(ret));
		}
	}

}
