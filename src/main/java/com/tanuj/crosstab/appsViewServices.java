package com.tanuj.crosstab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Set;
import java.util.TreeSet;

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

@Path("/appsViewServices")
public class appsViewServices {

	@Path("/getApps")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendAppsDetailsJSON(@QueryParam("jobcode") String jobcodeParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		Set<String> userIdSet = new TreeSet<String>();

		JSONArray jobPostingJsonArray = new JSONArray();
		JSONArray appJsonArray = new JSONArray();
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String appstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,createdby,status,DATE_FORMAT(startdate,'%d %b, %Y') FROM job_list WHERE code = '"
						+ jobcodeParam + "'");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				JSONObject jobPostingJsonObject = new JSONObject();

				jobPostingJsonObject.put("jobcode", "JC" + rs.getString(1));
				jobPostingJsonObject.put("jobtitle", rs.getString(2));
				jobPostingJsonObject.put("industry", rs.getString(3));
				jobPostingJsonObject.put("company", rs.getString(4));
				jobPostingJsonObject.put("location", rs.getString(5));
				jobPostingJsonObject.put("country", rs.getString(6));
				jobPostingJsonObject.put("pincode", rs.getString(7));
				jobPostingJsonObject.put("exp", rs.getString(8) + " Years");
				jobPostingJsonObject.put("skills", rs.getString(9));
				jobPostingJsonObject.put("recruiter", rs.getString(10));
				jobPostingJsonObject.put("status", rs.getString(11));
				jobPostingJsonObject.put("createdate", rs.getString(12));

				jobPostingJsonArray.put(jobPostingJsonObject);
			}
		}
		rs.close();

		rs = st.executeQuery(
				"SELECT id,userid,username,DATE_FORMAT(applydate,'%d %b, %Y'),status FROM application_list WHERE jobid='"
						+ jobcodeParam + "'");
		while (rs.next()) {

			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery(
					"SELECT curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl FROM user_list WHERE id = '"
							+ rs.getString(2) + "' AND name = '" + rs.getString(3) + "'");
			while (rs2.next()) {

				JSONObject appJsonObject = new JSONObject();

				appJsonObject.put("appcode", rs.getString(1));
				appJsonObject.put("usercode", rs.getString(2));
				userIdSet.add(rs.getString(2));
				appJsonObject.put("username", rs.getString(3));
				appJsonObject.put("userjobtitle", rs2.getString(1));
				appJsonObject.put("usercompany", rs2.getString(2));
				appJsonObject.put("location", rs2.getString(3));
				appJsonObject.put("country", rs2.getString(4));
				appJsonObject.put("countryFilter", rs2.getString(4).trim().replaceAll(" ", "_"));
				appJsonObject.put("industry", rs2.getString(5));
				appJsonObject.put("joineddate", rs2.getString(6));
				appJsonObject.put("skills", rs2.getString(7));
				appJsonObject.put("phone", "+" + rs2.getString(8).replace(",", "").trim());
				appJsonObject.put("email", rs2.getString(9));
				appJsonObject.put("profileurl", rs2.getString(10));
				appJsonObject.put("videostatus", rs2.getString(11));
				appJsonObject.put("dpurl", rs2.getString(12));
				appJsonObject.put("applydate", rs.getString(4));
				appJsonObject.put("appstatus", rs.getString(5));
				appJsonObject.put("appstatusFilter", rs.getString(5).trim().replaceAll(" ", "_"));

				appJsonArray.put(appJsonObject);

			}
			rs2.close();
			st2.close();

		}
		rs.close();

		rs = st.executeQuery(
				"SELECT DISTINCT(status) FROM application_list WHERE jobid = '" + jobcodeParam + "' ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					appstatusesHtmlList = appstatusesHtmlList + "<li><span data-path=\"."
							+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
				}
			}
		}
		rs.close();

		Set<String> countrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT country FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& countrySet.contains(rs.getString(1)) == false) {
					countrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String country : countrySet) {

			countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + country.replaceAll(" ", "_") + "\">"
					+ country + "</span></li>";
		}

		Set<String> industrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT industry FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& industrySet.contains(rs.getString(1)) == false) {
					industrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String industry : industrySet) {

			industriesHtmlList = industriesHtmlList + "<li><input value=\"" + industry + "\" id=\"" + industry
					+ "\" type=\"checkbox\" />&nbsp; " + industry + "</li>";
		}

		String skillList = "";
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT skills FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					skillList = skillList + rs.getString(1) + ",";
				}
			}
		}
		rs.close();

		if (skillList.endsWith(",")) {
			skillList = skillList.substring(0, skillList.length() - 1);// remove
			// last
			// comma

			Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
			for (String skill : skillsSet) {
				skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
						+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
			}

		}

		st.close();
		conn.close();

		jsonObject.put("jobPostingData", jobPostingJsonArray);
		jsonObject.put("appsData", appJsonArray);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("appstatusFilterData", appstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getAppsHtml")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendAppsDetailsHtmlJSON(@QueryParam("jobcode") String jobcodeParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		Set<String> userIdSet = new TreeSet<String>();

		String jobPostingHtmlList = "";
		String appsHtmlList = "";
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String appstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,createdby,status,DATE_FORMAT(startdate,'%d %b, %Y') FROM job_list WHERE code = '"
						+ jobcodeParam + "'");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {

				jobPostingHtmlList = "									<p class=\"jobcodeheading\">(JC"
						+ rs.getString(1) + ")</p>\n" + "									<p class=\"titleheading\">"
						+ rs.getString(2) + "</p>\n"
						+ "									<p class=\"companyheading\">" + rs.getString(4) + "</p>\n"
						+ "									<p class=\"mbl\" />\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-map-marker\"></i>&nbsp;"
						+ rs.getString(5) + ",\n" + "										" + rs.getString(6) + ", "
						+ rs.getString(7) + "\n" + "									</p>\n"
						+ "									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-suitcase\"></i>&nbsp;"
						+ rs.getString(8) + " Years\n" + "										&nbsp;("
						+ rs.getString(3) + ")\n" + "									</p>\n"
						+ "									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-wrench\"></i>&nbsp;" + rs.getString(9)
						+ "\n" + "									</p>\n"
						+ "									<p class=\"mbm\" />\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-pencil\"></i>&nbsp;Created By :\n"
						+ "										" + rs.getString(10) + "\n"
						+ "									</p>\n"
						+ "									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-clock-o\"></i>&nbsp;Created On :\n"
						+ "										" + rs.getString(12) + "\n"
						+ "									</p>\n"
						+ "									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "									<p class=\"maindetailsheading\">\n"
						+ "										<i class=\"fa fa-flag\"></i>&nbsp;Status : "
						+ rs.getString(11) + "\n" + "									</p>\n"
						+ "									<hr\n"
						+ "										style=\"width: 250px; border-width: 2px; margin-top: 30px; margin-bottom: 30px;\">\n"
						+ "								";

			}
		}
		rs.close();

		rs = st.executeQuery(
				"SELECT id,userid,username,DATE_FORMAT(applydate,'%d %b, %Y'),status FROM application_list WHERE jobid='"
						+ jobcodeParam + "'");
		while (rs.next()) {

			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery(
					"SELECT curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl FROM user_list WHERE id = '"
							+ rs.getString(2) + "' AND name = '" + rs.getString(3) + "'");
			while (rs2.next()) {

				userIdSet.add(rs.getString(2));

				appsHtmlList = appsHtmlList + "<tr class=\"tbl-item\">\n"
						+ "												<!-- data -->\n"
						+ "												<td class=\"td-block\"><img src=\""
						+ rs2.getString(12) + "\"\n"
						+ "													width=\"90\" height=\"90\" alt=\"Profile Picture\" title=\"\"\n"
						+ "													style=\"display: inline-block; float: left; clear: left; margin-right: 20px;\"\n"
						+ "													class=\"img-responsive img-circle\">\n"
						+ "													<p class=\"usercode\">UC" + rs.getString(2)
						+ "</p>\n" + "													<p class=\"username\">"
						+ rs.getString(3) + "</p>\n"
						+ "													<p class=\"maindetailscolored\">\n"
						+ "														<span class=\"userjobtitle\">"
						+ rs2.getString(1) + "</span>&nbsp;-&nbsp;\n"
						+ "														<span class=\"usercompany\">"
						+ rs2.getString(2) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-map-marker\"></i>&nbsp;Location :&nbsp;<span\n"
						+ "															class=\"userlocation\">"
						+ rs2.getString(3) + "</span>, <span\n"
						+ "															class=\"usercountry "
						+ rs2.getString(4).trim().replaceAll(" ", "_") + "\">" + rs2.getString(4) + "</span>\n"
						+ "													</p>&nbsp;&nbsp;\n"
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-suitcase\"></i>&nbsp;Industry :&nbsp;<span\n"
						+ "															class=\"userindustry\">"
						+ rs2.getString(5) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-wrench\"></i>&nbsp;Skills :&nbsp;<span\n"
						+ "															class=\"userskills\" data-ng-bind-html=\"profile.skills\">"
						+ rs2.getString(7) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-clock-o\"></i>&nbsp;Apply Date :&nbsp;<span\n"
						+ "															class=\"jobapplydate\">"
						+ rs.getString(4) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "														<i class=\"fa fa-flag\"></i>&nbsp;Application Status :&nbsp;<span\n"
						+ "															id=\"" + rs.getString(1) + "\"\n"
						+ "															class=\"appstatus "
						+ rs.getString(5).trim().replaceAll(" ", "_") + "\">" + rs.getString(5)
						+ "</span>&nbsp;&nbsp;&nbsp;&nbsp;\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\" name=\"showStatusSelect\"\n"
						+ "															class=\"btn btn-white showStatusSelect\"\n"
						+ "															style=\"margin-left: 10px\">\n"
						+ "															<i class=\"fa fa-gear\"></i>&nbsp;<b>UPDATE STATUS</b>\n"
						+ "														</button>\n"
						+ "														<select class=\"StatusSelect\" id=\""
						+ rs.getString(1) + "\"\n"
						+ "															hidden=\"hidden\">\n"
						+ "															<option>In Process</option>\n"
						+ "															<option>Short-listed</option>\n"
						+ "															<option>Interview</option>\n"
						+ "															<option>Offer</option>\n"
						+ "															<option>Joining</option>\n"
						+ "															<option>Reject</option>\n"
						+ "															<option>On Hold</option>\n"
						+ "														</select>\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\" name=\"saveStatusSelect\"\n"
						+ "															class=\"btn btn-success saveStatusSelect\"\n"
						+ "															style=\"margin-left: 10px\">\n"
						+ "															<i class=\"fa fa-check\"></i>\n"
						+ "														</button>\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\" name=\"hideStatusSelect\"\n"
						+ "															class=\"btn btn-danger hideStatusSelect\"\n"
						+ "															style=\"margin-left: 10px\">\n"
						+ "															<i class=\"fa fa-close\"></i>\n"
						+ "														</button>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<a href=\"tel:" + "+"
						+ rs2.getString(8).replace(",", "").trim() + "\" class=\"btn btn-success\"><i\n"
						+ "															class=\"fa fa-phone\"></i>&nbsp;"
						+ "+" + rs2.getString(8).replace(",", "").trim() + "</a>&nbsp;&nbsp;&nbsp;\n"
						+ "														<a href=\"mailto:" + rs2.getString(9)
						+ "\" class=\"btn btn-yellow\"><i\n"
						+ "															class=\"fa fa-envelope\"></i>&nbsp;"
						+ rs2.getString(9) + "</a>&nbsp;&nbsp;&nbsp;\n"
						+ "														<a href=\"" + rs2.getString(10)
						+ "\" target=\"_blank\"\n"
						+ "															class=\"btn btn-blue\"><i class=\"fa fa-linkedin-square\"></i>&nbsp;Go\n"
						+ "															to LinkedIn Profile</a>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbl\" /></td>\n"
						+ "												<td class=\"td-block\">\n"
						+ "													<div class=\"form-group\">\n"
						+ "														<div class=\"text-center mbl\">\n"
						+ "															<button id=\"" + rs.getString(2)
						+ "\"\n"
						+ "																class=\"btn btn-blue btn-block viewFullProfileButton\">\n"
						+ "																<i class=\"fa fa-user\"></i>&nbsp; FULL PROFILE\n"
						+ "															</button>\n"
						+ "															<!-- \n"
						+ "															&nbsp;\n"
						+ "															<button class=\"btn btn-yellow btn-block editJobPosting\"\n"
						+ "																value=\"" + rs.getString(2)
						+ "\">\n"
						+ "																<i class=\"fa fa-edit\"></i>&nbsp; EDIT USER\n"
						+ "															</button>\n"
						+ "															&nbsp;\n"
						+ "															<button class=\"btn btn-red btn-block deleteJobPosting\"\n"
						+ "																value=\"" + rs.getString(2)
						+ "\">\n"
						+ "																<i class=\"fa fa-remove\"></i>&nbsp; DELETE USER\n"
						+ "															</button>\n"
						+ "															 -->\n"
						+ "														</div>\n"
						+ "													</div>\n"
						+ "												</td>\n"
						+ "											</tr>";

			}
			rs2.close();
			st2.close();

		}
		rs.close();

		rs = st.executeQuery(
				"SELECT DISTINCT(status) FROM application_list WHERE jobid = '" + jobcodeParam + "' ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					appstatusesHtmlList = appstatusesHtmlList + "<li><span data-path=\"."
							+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
				}
			}
		}
		rs.close();

		Set<String> countrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT country FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& countrySet.contains(rs.getString(1)) == false) {
					countrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String country : countrySet) {

			countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + country.replaceAll(" ", "_") + "\">"
					+ country + "</span></li>";
		}

		Set<String> industrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT industry FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& industrySet.contains(rs.getString(1)) == false) {
					industrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String industry : industrySet) {

			industriesHtmlList = industriesHtmlList + "<li><input value=\"" + industry + "\" id=\"" + industry
					+ "\" type=\"checkbox\" />&nbsp; " + industry + "</li>";
		}

		String skillList = "";
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT skills FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					skillList = skillList + rs.getString(1) + ",";
				}
			}
		}
		rs.close();

		if (skillList.endsWith(",")) {
			skillList = skillList.substring(0, skillList.length() - 1);// remove
			// last
			// comma

			Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
			for (String skill : skillsSet) {
				skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
						+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
			}

		}

		st.close();
		conn.close();

		jsonObject.put("jobPostingData", jobPostingHtmlList);
		jsonObject.put("appsData", appsHtmlList);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("appstatusFilterData", appstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("{jobcode}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendAppsDetails2JSON(@PathParam("jobcode") String jobcodeParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		Set<String> userIdSet = new TreeSet<String>();

		JSONArray jobPostingJsonArray = new JSONArray();
		JSONArray appJsonArray = new JSONArray();
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String appstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,createdby,status,DATE_FORMAT(startdate,'%d %b, %Y') FROM job_list WHERE code = '"
						+ jobcodeParam + "'");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				JSONObject jobPostingJsonObject = new JSONObject();

				jobPostingJsonObject.put("jobcode", "JC" + rs.getString(1));
				jobPostingJsonObject.put("jobtitle", rs.getString(2));
				jobPostingJsonObject.put("industry", rs.getString(3));
				jobPostingJsonObject.put("company", rs.getString(4));
				jobPostingJsonObject.put("location", rs.getString(5));
				jobPostingJsonObject.put("country", rs.getString(6));
				jobPostingJsonObject.put("pincode", rs.getString(7));
				jobPostingJsonObject.put("exp", rs.getString(8) + " Years");
				jobPostingJsonObject.put("skills", rs.getString(9));
				jobPostingJsonObject.put("recruiter", rs.getString(10));
				jobPostingJsonObject.put("status", rs.getString(11));
				jobPostingJsonObject.put("createdate", rs.getString(12));

				jobPostingJsonArray.put(jobPostingJsonObject);
			}
		}
		rs.close();

		rs = st.executeQuery(
				"SELECT id,userid,username,DATE_FORMAT(applydate,'%d %b, %Y'),status FROM application_list WHERE jobid='"
						+ jobcodeParam + "'");
		while (rs.next()) {

			Statement st2 = conn.createStatement();
			ResultSet rs2 = st2.executeQuery(
					"SELECT curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl FROM user_list WHERE id = '"
							+ rs.getString(2) + "' AND name = '" + rs.getString(3) + "'");
			while (rs2.next()) {

				JSONObject appJsonObject = new JSONObject();

				appJsonObject.put("appcode", rs.getString(1));
				appJsonObject.put("usercode", rs.getString(2));
				userIdSet.add(rs.getString(2));
				appJsonObject.put("username", rs.getString(3));
				appJsonObject.put("userjobtitle", rs2.getString(1));
				appJsonObject.put("usercompany", rs2.getString(2));
				appJsonObject.put("location", rs2.getString(3));
				appJsonObject.put("country", rs2.getString(4));
				appJsonObject.put("countryFilter", rs2.getString(4).trim().replaceAll(" ", "_"));
				appJsonObject.put("industry", rs2.getString(5));
				appJsonObject.put("joineddate", rs2.getString(6));
				appJsonObject.put("skills", rs2.getString(7));
				appJsonObject.put("phone", "+" + rs2.getString(8).replace(",", "").trim());
				appJsonObject.put("email", rs2.getString(9));
				appJsonObject.put("profileurl", rs2.getString(10));
				appJsonObject.put("videostatus", rs2.getString(11));
				appJsonObject.put("dpurl", rs2.getString(12));
				appJsonObject.put("applydate", rs.getString(4));
				appJsonObject.put("appstatus", rs.getString(5));
				appJsonObject.put("appstatusFilter", rs.getString(5).trim().replaceAll(" ", "_"));

				appJsonArray.put(appJsonObject);

			}
			rs2.close();
			st2.close();

		}
		rs.close();

		rs = st.executeQuery(
				"SELECT DISTINCT(status) FROM application_list WHERE jobid = '" + jobcodeParam + "' ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					appstatusesHtmlList = appstatusesHtmlList + "<li><span data-path=\"."
							+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
				}
			}
		}
		rs.close();

		Set<String> countrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT country FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& countrySet.contains(rs.getString(1)) == false) {
					countrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String country : countrySet) {

			countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + country.replaceAll(" ", "_") + "\">"
					+ country + "</span></li>";
		}

		Set<String> industrySet = new TreeSet<String>();
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT industry FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false
						&& industrySet.contains(rs.getString(1)) == false) {
					industrySet.add(rs.getString(1));
				}
			}
			rs.close();
		}
		for (String industry : industrySet) {

			industriesHtmlList = industriesHtmlList + "<li><input value=\"" + industry + "\" id=\"" + industry
					+ "\" type=\"checkbox\" />&nbsp; " + industry + "</li>";
		}

		String skillList = "";
		for (String userId : userIdSet) {
			rs = st.executeQuery("SELECT skills FROM user_list WHERE id = '" + userId + "'");
			while (rs.next()) {
				if (rs.getString(1).equals("--") == false && rs.getString(1).equals("") == false) {
					skillList = skillList + rs.getString(1) + ",";
				}
			}
		}
		rs.close();

		if (skillList.endsWith(",")) {
			skillList = skillList.substring(0, skillList.length() - 1);// remove
			// last
			// comma

			Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
			for (String skill : skillsSet) {
				skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
						+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
			}

		}

		st.close();
		conn.close();

		jsonObject.put("jobPostingData", jobPostingJsonArray);
		jsonObject.put("appsData", appJsonArray);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("appstatusFilterData", appstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getUserInfo")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendUserDetailsJSON(@QueryParam("userid") String useridParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		JSONArray userJsonArray = new JSONArray();

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
				"SELECT id,name,curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl,coursename1,collegename1,coursename2,collegename2,connections,DATE_FORMAT(addedon,'%d %b, %Y') FROM user_list WHERE id = '"
						+ useridParam + "'");
		while (rs.next()) {

			JSONObject userJsonObject = new JSONObject();

			userJsonObject.put("usercode", rs.getString(1));
			userJsonObject.put("username", rs.getString(2));
			userJsonObject.put("userjobtitle", rs.getString(3));
			userJsonObject.put("usercompany", rs.getString(4));
			userJsonObject.put("location", rs.getString(5));
			userJsonObject.put("country", rs.getString(6));
			userJsonObject.put("industry", rs.getString(7));
			userJsonObject.put("joineddate", rs.getString(8));
			userJsonObject.put("skills", rs.getString(9));
			userJsonObject.put("phone", "+" + rs.getString(10).replace(",", "").trim());
			userJsonObject.put("email", rs.getString(11));
			userJsonObject.put("profileurl", rs.getString(12));
			userJsonObject.put("videostatus", rs.getString(13));
			userJsonObject.put("videourl",
					"https://www.googleapis.com/download/storage/v1/b/crosstabconnect.appspot.com/o/CTC_"
							+ rs.getString(2).replace(" ", "_") + ".mp4?alt=media");
			userJsonObject.put("dpurl", rs.getString(14));
			if (rs.getString(15).equals("--")) {
				userJsonObject.put("crname1", "Not Mentioned");
				userJsonObject.put("clname1", "Not Mentioned");
			} else {
				userJsonObject.put("crname1", rs.getString(15));
				userJsonObject.put("clname1", rs.getString(16));
			}
			if (rs.getString(17).equals("--")) {
				userJsonObject.put("crname2", "Not Mentioned");
				userJsonObject.put("clname2", "Not Mentioned");
			} else {
				userJsonObject.put("crname2", rs.getString(17));
				userJsonObject.put("clname2", rs.getString(18));
			}
			userJsonObject.put("connections", rs.getString(19));
			userJsonObject.put("membersince", rs.getString(20));

			userJsonArray.put(userJsonObject);

		}

		rs.close();
		st.close();
		conn.close();

		jsonObject.put("userData", userJsonArray);
		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getUserInfo/{userid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendUserDetails2JSON(@PathParam("userid") String useridParam)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		JSONArray userJsonArray = new JSONArray();

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
				"SELECT id,name,curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl,coursename1,collegename1,coursename2,collegename2,connections,DATE_FORMAT(addedon,'%d %b, %Y') FROM user_list WHERE id = '"
						+ useridParam + "'");
		while (rs.next()) {

			JSONObject userJsonObject = new JSONObject();

			userJsonObject.put("usercode", rs.getString(1));
			userJsonObject.put("username", rs.getString(2));
			userJsonObject.put("userjobtitle", rs.getString(3));
			userJsonObject.put("usercompany", rs.getString(4));
			userJsonObject.put("location", rs.getString(5));
			userJsonObject.put("country", rs.getString(6));
			userJsonObject.put("industry", rs.getString(7));
			userJsonObject.put("joineddate", rs.getString(8));
			userJsonObject.put("skills", rs.getString(9));
			userJsonObject.put("phone", "+" + rs.getString(10).replace(",", "").trim());
			userJsonObject.put("email", rs.getString(11));
			userJsonObject.put("profileurl", rs.getString(12));
			userJsonObject.put("videostatus", rs.getString(13));
			userJsonObject.put("videourl",
					"https://www.googleapis.com/download/storage/v1/b/crosstabconnect.appspot.com/o/CTC_"
							+ rs.getString(2).replace(" ", "_") + ".mp4?alt=media");
			userJsonObject.put("dpurl", rs.getString(14));
			userJsonObject.put("crname1", rs.getString(15));
			userJsonObject.put("clname1", rs.getString(16));
			userJsonObject.put("crname2", rs.getString(17));
			userJsonObject.put("clname2", rs.getString(18));
			userJsonObject.put("connections", rs.getString(19));
			userJsonObject.put("membersince", rs.getString(20));

			userJsonArray.put(userJsonObject);

		}
		rs.close();
		st.close();
		conn.close();

		jsonObject.put("userData", userJsonArray);
		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/updateAppStatus")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateStatus(@QueryParam("appcode") String appcodeParam,
			@QueryParam("appstatus") String appstatusParam)
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
		int x = st.executeUpdate("UPDATE application_list SET status = '" + appstatusParam
				+ "', updatedate = NOW() WHERE id = '" + appcodeParam + "'");

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
