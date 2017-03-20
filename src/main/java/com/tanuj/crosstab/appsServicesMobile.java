package com.tanuj.crosstab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Path("/appsServicesMobile")
public class appsServicesMobile {

	@Path("/getApplicationsStatus")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobApplicationsJSON(@QueryParam("UserId") String UserIdParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray appsJsonAarray = new JSONArray();

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
				"SELECT jobid,DATE_FORMAT(applydate,'%D %b %Y'),status FROM application_list WHERE userid = '"
						+ UserIdParam + "'");

		while (rs.next()) {

			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2
					.executeQuery("SELECT code,title,company,location,exp,skills FROM job_list WHERE code = '"
							+ rs.getString(1) + "'");
			while (rs2.next()) {
				JSONObject appsJsonOobject = new JSONObject();
				appsJsonOobject.put("id", rs2.getString(1));
				appsJsonOobject.put("title", rs2.getString(2));
				appsJsonOobject.put("company", rs2.getString(3));
				appsJsonOobject.put("location", rs2.getString(4));
				appsJsonOobject.put("exp", rs2.getString(5));
				appsJsonOobject.put("skills", rs2.getString(6));
				appsJsonOobject.put("applydate", rs.getString(2));
				appsJsonOobject.put("status", rs.getString(3));
				appsJsonAarray.put(appsJsonOobject);
			}
			rs2.close();
			st2.close();

		}
		rs.close();

		rs.close();
		st.close();
		conn.close();

		return Response.status(200).entity(appsJsonAarray.toString()).build();

	}

	@Path("/getAllApplicationsStatus")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendAllJobApplicationsJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray appsJsonAarray = new JSONArray();

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
				"SELECT code,title,company,location,exp,skills FROM job_list WHERE code IN (Select jobid FROM application_list)");

		while (rs.next()) {
			JSONObject jobject = new JSONObject();

			jobject.put("jobid", rs.getString(1));
			jobject.put("jobtitle", rs.getString(2));
			jobject.put("jobclient", rs.getString(3));
			jobject.put("joblocation", rs.getString(4));
			jobject.put("jobexp", rs.getString(5));
			jobject.put("jobskills", rs.getString(6));

			JSONArray jarray2 = new JSONArray();
			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery(
					"SELECT id,name,location,country,curtitle,curcompany,email,phone,dpurl,skills,industry,joineddate,coursename1,collegename1,coursename2,collegename2,connections,profileurl,videostatus FROM user_list WHERE id IN(SELECT userid FROM application_list WHERE jobid = '"
							+ rs.getString(1) + "')");
			while (rs2.next()) {
				JSONObject jobject2 = new JSONObject();

				jobject2.put("userid", rs2.getString(1));
				jobject2.put("username", rs2.getString(2));
				jobject2.put("userlocation", rs2.getString(3) + ", " + rs2.getString(4));
				jobject2.put("userjobtitle", rs2.getString(5));
				jobject2.put("usercompany", rs2.getString(6));
				jobject2.put("useremail", rs2.getString(7));
				jobject2.put("userphone", rs2.getString(8));
				jobject2.put("userdpurl", rs2.getString(9));
				jobject2.put("userskills", rs2.getString(10));
			
				jobject2.put("industry", rs2.getString(11));
				jobject2.put("joineddate", rs2.getString(12));
				jobject2.put("coursename1", rs2.getString(13));
				jobject2.put("collegename1", rs2.getString(14));
				jobject2.put("coursename2", rs2.getString(15));
				jobject2.put("collegename2", rs2.getString(16));
				jobject2.put("connections", rs2.getString(17));
				jobject2.put("profileurl", rs2.getString(18));
				jobject2.put("videostatus", rs2.getString(19));
			
								

				Statement st3 = conn.createStatement();
				ResultSet rs3 = st3.executeQuery(
						"SELECT id,DATE_FORMAT(applydate,'%D %b %Y'),status FROM application_list WHERE jobid = '"
								+ rs.getString(1) + "' and userid = '" + rs2.getString(1) + "'");
				while (rs3.next()) {

					jobject2.put("appid", rs3.getString(1));
					jobject2.put("applydate", rs3.getString(2));
					jobject2.put("status", rs3.getString(3));
				}
				rs3.close();
				st3.close();

				jarray2.put(jobject2);
			}
			rs2.close();
			st2.close();

			jobject.put("applicants", jarray2);

			appsJsonAarray.put(jobject);
		}
		rs.close();
		st.close();
		conn.close();

		return Response.status(200).entity(appsJsonAarray.toString()).build();

	}

}
