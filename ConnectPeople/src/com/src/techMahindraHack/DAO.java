package com.src.techMahindraHack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {

	public List<String> getLocations() {
		Connection conn = null;
	
		List<String> locations = new ArrayList<String>();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct loc_name from location");

			while (rs.next()) {
				locations.add(rs.getString(1));
			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return locations;
	}

	public List<String> getTags() {
		Connection conn = null;
		List<String> tags = new ArrayList<String>();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select tagName from tagTable");

			while (rs.next()) {
				tags.add(rs.getString(1));
			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return tags;
	}

	public List<ExpertVO> getExpertDetails(String location, String tag) {

		Connection conn = null;
		List<ExpertVO> experts = new ArrayList<ExpertVO>();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select distinct e_name, e_loc, phone_no , is_audio,is_video, is_phone "
							+ "from experttable exp , expert_tagtable etg , tagTable tg "
							+ "where exp.e_id = etg.e_id and tg.tagID = etg.tagID " + "and exp.e_loc ='" + location
							+ "' and tg.tagName='" + tag + "'");

			while (rs.next()) {
				ExpertVO expVO = new ExpertVO();
				expVO.setName(rs.getString(1));
				expVO.setLocation(rs.getString(2));
				expVO.setPhone(rs.getString(3));
				expVO.setRating(rs.getInt(4));
				expVO.setIsAudio(rs.getInt(5));
				expVO.setIsVideo(rs.getInt(6));
				expVO.setIsPhone(rs.getInt(7));
				experts.add(expVO);
			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return experts;

	}

	public KandyUser getKandyCredentials(String userName, String password) {
		Connection conn = null;
		KandyUser ku = new KandyUser();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from experttable where e_name='" + userName
					+ "' and e_password ='" + password + "'");

			if (rs.next()) {
				// Statement stm1 = conn.createStatement();
				// ResultSet rs1 =
				// stm1.executeQuery("select uname ,password from kandy_usertable where isUsed =0 limit 0,1;");
				// ku.setUserName(rs1.getString(1));
				// ku.setPassword(rs1.getString(2));
				ku = getKandyUser();

			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return ku;

	}

	public KandyUser getKandyUser() {
		Connection conn = null;
		KandyUser ku = new KandyUser();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select uname ,password from kandy_usertable where isUsed =0 limit 0,1;");

			while (rs.next()) {

				ku.setUserName(rs.getString(1));
				ku.setPassword(rs.getString(2));

			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return ku;

	}

	public int updateUserSession(String uName) {

		Connection conn = null;
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			stmt.executeQuery("update experttable set is_online =0 where e_name ='" + uName + "'");

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return 1;

	}

	public int insertRating(String uName, int rating) {
		Connection conn = null;
		int retStatus = 0;
		PreparedStatement preparedStatement = null;
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			String insertTableSQL = "INSERT INTO rating" + "(uname, rating) VALUES" + "(?,?)";
			preparedStatement = conn.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, uName);
			preparedStatement.setInt(2, rating);
			retStatus = preparedStatement.executeUpdate();
			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return retStatus;
	}

	public int addNewExpert(String uname,String pwd,String fname,String lname,String dob,String ph_num,String loc,String about) {
		Connection conn = null;
		int retStatus = 0;
		PreparedStatement preparedStatement = null;
		
		try{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			System.out.println("Almos there");
			
			
			//String insertTableSQL = "INSERT INTO experttable" + "(e_username, e_password, e_fname, e_lname, e_loc, e_phnum, e_aboutme, e_dob) VALUES " + "('"+uname+"','"+pwd+"','"+fname+"','"+lname+"','"+loc+"','"+ph_num+"','"+about+"','"+dob+"')";
			String insertTableSQL = "INSERT INTO experttable (e_username, e_password, e_fname, e_lname, e_loc, e_phnum, e_aboutme, e_dob) VALUES (?,?,?,?,?,?,?,?)";
			preparedStatement = conn.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, uname);
			preparedStatement.setString(2, pwd);
			preparedStatement.setString(3, fname);
			preparedStatement.setString(4, lname);
			preparedStatement.setString(5, loc);
			preparedStatement.setString(6, ph_num);
			preparedStatement.setString(7, about);
			preparedStatement.setString(8, dob);
			//System.out.println("SQL String is "+ insertTableSQL);
			//FileInputStream fin=new FileInputStream(profpic); 
			//preparedStatement.setBinaryStream(9,fin,fin.available()); 
			
			retStatus = preparedStatement.executeUpdate();
			conn.close();
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally {

		}
		
		return 0;
		
	}
	
	public boolean checkUname(String uName) {
		Connection conn = null;
		int numRows;
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			System.out.println("select * from experttable where e_username= '"+uName+"';");
			ResultSet rs = stmt.executeQuery("select * from experttable where e_username= '"+uName+"';");
			rs.last();
			numRows = rs.getRow();
			System.out.println("The number of records are "+rs.getRow());
			
			if (numRows>0)
			{
				return true;
			}
			
			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return false;
	}
	
	
	public List<GraphVO> getGraphsInfo(String uName) {
		List<GraphVO> gpos = new ArrayList<GraphVO>();
		gpos.add(getGraphDetails(uName,"Audio"));
		gpos.add(getGraphDetails(uName,"Video"));
		gpos.add(getGraphDetails(uName,"PSTN"));
		gpos.add(getGraphDetails(uName,"IM"));
		return gpos;
	}

	public GraphVO getGraphDetails(String uname, String CommandType) {
		GraphVO gpo = new GraphVO();
		Connection conn = null;

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select month , count(*) from callmetric where uname ='" + uname
					+ "' and commType = '" + CommandType + "'");
			
			while (rs.next()) {
				gpo.getXticks().add(rs.getString(1));
				gpo.getValues().add(rs.getInt(2));
			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return gpo;
	}
	
	
	public TotalStatVO getTotalStat() {
		TotalStatVO statVO = new TotalStatVO();
		statVO.setnMessages(countStats("Message"));
		statVO.setnAudio(countStats("Audio"));
		statVO.setnVideo(countStats("Video"));
		statVO.setnPhone(countStats("Phone"));
		return statVO;
	}

	
	private int countStats(String CommandType) {
		int count =0;
		Connection conn = null;

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select count(*) from callmetric where commType='" + CommandType + "'");
			while (rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception ex) {
			
		}finally {
			
		}
		return count;
	}
	
	
	public ExpertVO getUserInformation(String uname) {
		Connection conn = null;
		ExpertVO expert = new ExpertVO();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select e_name, e_loc, phone_no , is_audio,is_video, is_phone, aboutme "
							+ "from experttable where " + "e_name='" + uname + "'");

			while (rs.next()) {
				expert.setName(rs.getString(1));
				expert.setLocation(rs.getString(2));
				expert.setPhone(rs.getString(3));
				expert.setIsAudio(rs.getInt(4));
				expert.setIsVideo(rs.getInt(5));
				expert.setIsPhone(rs.getInt(6));
				expert.setDesc(rs.getString(7));

			}

			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return expert;

	}

	public List<CommentVO> getComments(String uname) {
		Connection conn = null;
		List<CommentVO> commentVOs = new ArrayList<CommentVO>();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select commentplace,commentdate,commentuser,tag,who from "
					+ "reviews where uname='" + uname + "'");
			while (rs.next()) {
				CommentVO commentVO = new CommentVO();
				commentVO.setCommentPlace(rs.getString(1));
				commentVO.setDate(rs.getString(2));
				commentVO.setCommentUser(rs.getString(3));
				commentVO.setTag(rs.getString(4));
				commentVO.setWho(rs.getString(5));
				commentVOs.add(commentVO);

			}
			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}

		return commentVOs;

	}

	public int addComment(String uname, String name, String tag, String onplace, String onuser) {
		Connection conn = null;
		int ret = 0;
		PreparedStatement preparedStatement = null;
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			String insertTableSQL = "INSERT INTO reviews"
					+ "(uname, commentplace, commentdate, commentuser,tag,who) VALUES" + "(?,?,?,?,?,?)";
			preparedStatement = conn.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, uname);
			preparedStatement.setString(2, onplace);
			preparedStatement.setDate(3, new Date(System.currentTimeMillis()));
			preparedStatement.setString(4, onuser);
			preparedStatement.setString(5, tag);
			preparedStatement.setString(6, name);
			ret = preparedStatement.executeUpdate();
			conn.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return ret;
	}

	public int updateInfo(String uname, String phone, String location, String aboutme, int isPhone, int isAudio,
			int isVideo, int isMessage) {

		Connection conn = null;
		int ret = 0;
		PreparedStatement preparedStatement = null;

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelfriend?" + "user=root&password=root");
			String updateSQL = "UPDATE experttable set phone_no=?,aboutme=?,e_loc=?,is_phone=?,is_audio=?,is_video=?,is_message=? where e_name=?";
			preparedStatement = conn.prepareStatement(updateSQL);
			preparedStatement.setString(1, phone);
			preparedStatement.setString(2, aboutme);
			preparedStatement.setString(3, location);
			preparedStatement.setInt(4,isPhone );
			preparedStatement.setInt(5,isAudio );
			preparedStatement.setInt(6,isVideo );
			preparedStatement.setInt(7,isMessage );
			preparedStatement.setString(8, uname);
			ret = preparedStatement.executeUpdate();
			conn.close();

		}

		catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
		return ret;

	}
}
