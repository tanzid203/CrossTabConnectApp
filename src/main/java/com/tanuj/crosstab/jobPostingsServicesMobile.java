package com.tanuj.crosstab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Path("/jobPostingsServicesMobile")
public class jobPostingsServicesMobile {

	@Path("/getJobPostingsData")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPostingJSON(@QueryParam("UserId") String UserIdParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jobPostingJsonArray = new JSONArray();

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,brief,companybrief,questions,premium,hrname,hrposition,hrquote,foldername,mediastatus FROM job_list WHERE status = 'Active' AND code NOT IN (SELECT jobid from application_list where userid = '"
						+ UserIdParam + "')");

		while (rs.next()) {
			// System.out.println(rs.getString(1) + "," + rs.getString(2));
			JSONObject jobPostingJsonObject = new JSONObject();
			jobPostingJsonObject.put("code", rs.getString(1));
			jobPostingJsonObject.put("title", rs.getString(2));
			jobPostingJsonObject.put("industry", rs.getString(3));
			jobPostingJsonObject.put("company", rs.getString(4));
			jobPostingJsonObject.put("location", rs.getString(5));
			jobPostingJsonObject.put("country", rs.getString(6));
			jobPostingJsonObject.put("pincode", rs.getString(7));
			jobPostingJsonObject.put("exp", rs.getString(8));
			jobPostingJsonObject.put("skills", rs.getString(9));
			jobPostingJsonObject.put("brief", rs.getString(10));
			jobPostingJsonObject.put("companybrief", rs.getString(11));
			jobPostingJsonObject.put("questionnaire", rs.getString(12));
			jobPostingJsonObject.put("premium", rs.getString(13));
			jobPostingJsonObject.put("hrname", rs.getString(14));
			jobPostingJsonObject.put("hrposition", rs.getString(15));
			jobPostingJsonObject.put("hrquote", rs.getString(16));
			jobPostingJsonObject.put("foldername", rs.getString(17));
			jobPostingJsonObject.put("mediastatus", rs.getString(18));
			jobPostingJsonArray.put(jobPostingJsonObject);
		}

		rs.close();
		st.close();
		conn.close();

		return Response.status(200).entity(jobPostingJsonArray.toString()).build();

	}

	@Path("/applyForJobPosting")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response applyForJobPosting(@QueryParam("UserId") String UserIdParam,
			@QueryParam("UserName") String UserNameParam, @QueryParam("JobId") String JobIdParam,
			@QueryParam("JobName") String JobNameParam)
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

		String AppId = null;

		ResultSet rs = st.executeQuery("SELECT IFNULL(MAX(id), '1') FROM application_list");
		while (rs.next()) {
			AppId = String.valueOf(Integer.valueOf(rs.getString(1)) + 1);
		}
		rs.close();

		int x = st.executeUpdate("INSERT INTO application_list VALUES('" + AppId + "','" + JobIdParam + "','"
				+ JobNameParam + "','" + UserIdParam + "','" + UserNameParam + "',NOW(),null,'In Process')");

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
}