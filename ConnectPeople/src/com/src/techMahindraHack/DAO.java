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
		int test = 0 ; 
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
			ResultSet rs = stmt.executeQuery("select distinct e_loc from experttable");

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
					.executeQuery("select distinct e_name, e_loc, phone_no ,rating, is_audio,is_video, is_phone "
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
}
