package com.tanuj.crosstab;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Path("/profileServicesMobile")
public class profileServicesMobile {

	@Path("/uploadUserProfile")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response uploadUserProfile(@QueryParam("Name") String NameParam,
			@QueryParam("Location") String LocationParam, @QueryParam("Email") String EmailParam,
			@QueryParam("DpURL") String DpURLParam, @QueryParam("Title") String TitleParam,
			@QueryParam("Company") String CompanyParam, @QueryParam("Industry") String IndustryParam,
			@QueryParam("StartMonth") String StartMonthParam, @QueryParam("StartYear") String StartYearParam,
			@QueryParam("Password") String PasswordParam, @QueryParam("CountryCode") String CountryCodeParam,
			@QueryParam("Phone") String PhoneParam, @QueryParam("Skills") String SkillsParam,
			@QueryParam("Connections") String ConnectionsParam, @QueryParam("ProfileURL") String ProfileURLParam,
			@QueryParam("VideoStatus") String VideoStatusParam, @QueryParam("EditFlag") String EditFlagParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		String Password = replacer(PasswordParam);

		List<String> Location = Arrays.asList(LocationParam.split("\\s*,\\s*"));

		String StartDate = StartMonthParam + "/" + StartYearParam;
		String Phone = CountryCodeParam.trim() + "," + PhoneParam.trim();
		if (SkillsParam.equals("--") == false) {
			SkillsParam = SkillsParam.substring(1, SkillsParam.length() - 1);
		}

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		if (EditFlagParam.equals("1")) {
			Statement st = conn.createStatement();
			int x = st.executeUpdate("UPDATE user_list SET phone = '" + Phone + "',skills = '" + SkillsParam
					+ "',videostatus = '" + VideoStatusParam + "',lasteditedon = NOW() WHERE name = '" + NameParam
					+ "' AND email = '" + EmailParam + "'");

			String response;

			if (x == 1) {
				response = "SUCCESS";
			} else {
				response = "FAIL";
			}
			st.close();
			conn.close();

			jsonObject.put("response", response);
			jsonArray = jsonArray.put(jsonObject);

		} else {

			String UserId = null;

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT IFNULL(MAX(id), '1') FROM user_list");
			while (rs.next()) {
				UserId = String.valueOf(Integer.valueOf(rs.getString(1)) + 1);
			}
			rs.close();

			int x;

			if (Location.size() == 1) { // only one element, means no comma
										// present, means no City, ONLY
										// COUNTRY available.

				x = st.executeUpdate("INSERT INTO user_list VALUES('" + UserId + "','" + NameParam + "','" + Password
						+ "','" + "--" + "','" + Location.get(0) + "','" + EmailParam + "','" + DpURLParam + "'" + ",'"
						+ TitleParam + "','" + CompanyParam + "','" + IndustryParam + "','" + StartDate + "','" + Phone
						+ "'," + "'" + SkillsParam + "','--','--','--','--','" + ConnectionsParam + "','"
						+ ProfileURLParam + "','" + VideoStatusParam + "', NOW(), null)");

			} else { // comma present, means City provided along with Country

				x = st.executeUpdate("INSERT INTO user_list VALUES('" + UserId + "','" + NameParam + "','" + Password
						+ "','" + Location.get(0) + "','" + Location.get(1) + "','" + EmailParam + "','" + DpURLParam
						+ "'" + ",'" + TitleParam + "','" + CompanyParam + "','" + IndustryParam + "','" + StartDate
						+ "','" + Phone + "'," + "'" + SkillsParam + "','--','--','--','--','" + ConnectionsParam
						+ "','" + ProfileURLParam + "','" + VideoStatusParam + "', NOW(), null)");
			}

			String response;

			if (x == 1) {
				response = "SUCCESS";
			} else {
				response = "FAIL";
			}
			st.close();
			conn.close();

			jsonObject.put("response", response);
			jsonObject.put("userId", UserId);
			jsonArray = jsonArray.put(jsonObject);
		}

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateVideoBriefStatus")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateVideoBriefStatus(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("videostatus") String VideoStatusParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set videostatus = '" + VideoStatusParam + "' WHERE name = '"
				+ NameParam + "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateTest")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateTest() throws JSONException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		jsonObject.put("response", "Hi! Working.");
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateLocation")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateLocation(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("location") String LocationParam, @QueryParam("country") String CountryParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set location = '" + LocationParam + "', country = '" + CountryParam
				+ "' WHERE name = '" + NameParam + "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateEmail")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateEmail(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("email") String EmailParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set email = '" + EmailParam + "' WHERE name = '" + NameParam
				+ "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updatePhoneNumber")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updatePhoneNumber(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("code") String CodeParam, @QueryParam("phone") String PhoneParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		String Phone = CodeParam + "," + PhoneParam;

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set phone = '" + Phone + "' WHERE name = '" + NameParam
				+ "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateJobDetails")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateJobDetails(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("title") String TitleParam, @QueryParam("company") String CompanyParam,
			@QueryParam("startmonth") String StartMonthParam, @QueryParam("startyear") String StartYearParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		String JoinedDate = StartMonthParam + "/" + StartYearParam;

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set curtitle = '" + TitleParam + "', curcompany = '" + CompanyParam
				+ "', joineddate = '" + JoinedDate + "' WHERE name = '" + NameParam + "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateSkills")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateSkills(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("skills") String SkillsParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		String Skills = SkillsParam.substring(1, SkillsParam.length() - 1);

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set skills = '" + Skills + "' WHERE name = '" + NameParam
				+ "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateEducation")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateEducation(@QueryParam("id") String IdParam, @QueryParam("name") String NameParam,
			@QueryParam("coursename1") String CourseName1Param, @QueryParam("collegename1") String CollegeName1Param,
			@QueryParam("coursename2") String CourseName2Param, @QueryParam("collegename2") String CollegeName2Param)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		int x = st.executeUpdate("UPDATE user_list set coursename1 = '" + CourseName1Param + "',collegename1 = '"
				+ CollegeName1Param + "',coursename2 = '" + CourseName2Param + "',collegename2 = '" + CollegeName2Param
				+ "' WHERE name = '" + NameParam + "' AND id = '" + IdParam + "'");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}
		st.close();
		conn.close();

		jsonObject.put("response", response);
		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/logIn")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response checkLoginDetails(@QueryParam("email") String EmailParam,
			@QueryParam("password") String PasswordParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(
				"SELECT id,name,location,country,email,dpurl,curtitle,curcompany,industry,joineddate,password,phone,skills,coursename1,collegename1,coursename2,collegename2,connections,profileurl,videostatus FROM user_list WHERE email = '"
						+ EmailParam + "' AND password = '" + PasswordParam + "'");

		if (!rs.isBeforeFirst()) {
			jsonObject.put("response", "FAIL");
		} else {
			while (rs.next()) {
				jsonObject.put("id", rs.getString(1));
				jsonObject.put("name", rs.getString(2));
				jsonObject.put("location", rs.getString(3) + ", " + rs.getString(4));
				jsonObject.put("email", rs.getString(5));
				jsonObject.put("dpurl", rs.getString(6));
				jsonObject.put("title", rs.getString(7));
				jsonObject.put("company", rs.getString(8));
				jsonObject.put("industry", rs.getString(9));
				jsonObject.put("joineddate", rs.getString(10));
				jsonObject.put("password", rs.getString(11));
				jsonObject.put("phone", rs.getString(12));
				jsonObject.put("skills", rs.getString(13));
				jsonObject.put("coursename1", rs.getString(14));
				jsonObject.put("collegename1", rs.getString(15));
				jsonObject.put("coursename2", rs.getString(16));
				jsonObject.put("collegename2", rs.getString(17));
				jsonObject.put("connections", rs.getString(18));
				jsonObject.put("profileurl", rs.getString(19));
				jsonObject.put("videostatus", rs.getString(20));
				jsonObject.put("response", "SUCCESS");
			}
		}
		rs.close();
		st.close();
		conn.close();

		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/logInRecruiter")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response checkRecruiterLoginDetails(@QueryParam("email") String EmailParam,
			@QueryParam("password") String PasswordParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT name FROM admin_list WHERE email = '" + EmailParam + "' AND password = '"
				+ PasswordParam + "'");

		if (!rs.isBeforeFirst()) {
			jsonObject.put("response", "FAIL");
		} else {
			while (rs.next()) {
				jsonObject.put("name", rs.getString(1));
			}
		}
		rs.close();
		st.close();
		conn.close();

		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/checkEmail")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response checkEmail(@QueryParam("email") String EmailParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String url = null;
		Connection conn = null;
		if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
			url = System.getProperty("ae-cloudsql.cloudsql-database-url");
			Class.forName("com.mysql.jdbc.GoogleDriver");
			conn = DriverManager.getConnection(url);

		} else {
			url = System.getProperty("ae-cloudsql.local-database-url");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "root");
		}

		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT id FROM user_list WHERE email = '" + EmailParam + "'");

		if (!rs.isBeforeFirst()) {
			jsonObject.put("response", "SUCCESS");
		} else {
			jsonObject.put("response", "FAIL");
		}
		rs.close();
		st.close();
		conn.close();

		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	  public static String replacer(String string) {
	      String data = string;
	      try {
	         data = data.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
	         data = data.replaceAll("\\+", "%2B");
	         data = URLDecoder.decode(data, "utf-8");
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return data;
	   }
	
}
