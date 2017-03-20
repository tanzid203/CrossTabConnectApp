package com.tanuj.crosstab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Path("/profilesViewServices")
public class profilesViewServices {

	@Path("/getProfiles")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendUsersDetailsJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		Set<String> userIdSet = new TreeSet<String>();

		JSONArray userJsonArray = new JSONArray();
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
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
				"SELECT id,name,curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl FROM user_list");
		while (rs.next()) {

			JSONObject userJsonObject = new JSONObject();

			userJsonObject.put("usercode", rs.getString(1));
			userIdSet.add(rs.getString(1));
			userJsonObject.put("username", rs.getString(2));
			userJsonObject.put("userjobtitle", rs.getString(3));
			userJsonObject.put("usercompany", rs.getString(4));
			userJsonObject.put("location", rs.getString(5));
			userJsonObject.put("country", rs.getString(6));
			userJsonObject.put("countryFilter", rs.getString(6).trim().replaceAll(" ", "_"));
			userJsonObject.put("industry", rs.getString(7));
			userJsonObject.put("joineddate", rs.getString(8));
			userJsonObject.put("skills", rs.getString(9));
			userJsonObject.put("phone", "+" + rs.getString(10).replace(",", "").trim());
			userJsonObject.put("email", rs.getString(11));
			userJsonObject.put("profileurl", rs.getString(12));
			userJsonObject.put("videostatus", rs.getString(13));
			userJsonObject.put("dpurl", rs.getString(14));

			userJsonArray.put(userJsonObject);

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

		jsonObject.put("usersData", userJsonArray);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getProfilesHtml")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendAppsDetailsHtmlJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		Set<String> userIdSet = new TreeSet<String>();

		String usersHtmlList = "";
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
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
				"SELECT id,name,curtitle,curcompany,location,country,industry,joineddate,skills,phone,email,profileurl,videostatus,dpurl FROM user_list");
		while (rs.next()) {

			userIdSet.add(rs.getString(1));

			usersHtmlList = usersHtmlList + "<tr class=\"tbl-item\">\n"
					+ "												<!-- data -->\n"
					+ "												<td class=\"td-block\"><img src=\"";
			if (rs.getString(14).equals("--")) {
				usersHtmlList = usersHtmlList + "images/avatar/nodp.png";

			} else {
				usersHtmlList = usersHtmlList + rs.getString(14);
			}
			usersHtmlList = usersHtmlList + "\"\n"
					+ "													width=\"90\" height=\"90\" alt=\"Profile Picture\" title=\"\"\n"
					+ "													style=\"display: inline-block; float: left; clear: left; margin-right: 20px;\"\n"
					+ "													class=\"img-responsive img-circle\">\n"
					+ "													<p class=\"usercode\">UC" + rs.getString(1)
					+ "</p>\n" + "													<p class=\"username\">"
					+ rs.getString(2) + "</p>\n";
			if (rs.getString(3).equals("--")) {
				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailscolored\">\n"
						+ "														<span class=\"userjobtitle\"></span>(Currently Not Working)<span class=\"usercompany\"></span>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";
			} else {
				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailscolored\">\n"
						+ "														<span class=\"userjobtitle\">"
						+ rs.getString(3) + "</span>&nbsp;-&nbsp;\n"
						+ "														<span class=\"usercompany\">"
						+ rs.getString(4) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";
			}

			usersHtmlList = usersHtmlList
					+ "													<p class=\"maindetailsbig\">\n"
					+ "														<i class=\"fa fa-map-marker\"></i>&nbsp;Location :&nbsp;<span\n"
					+ "															class=\"userlocation\">"
					+ rs.getString(5) + "</span>, <span\n"
					+ "															class=\"usercountry "
					+ rs.getString(6).trim().replaceAll(" ", "_") + "\">" + rs.getString(6) + "</span>\n"
					+ "													</p>&nbsp;&nbsp;\n";
			if (rs.getString(7).equals("--")) {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-suitcase\"></i>&nbsp;Industry : NA (Not Mentioned By User)<span class=\"userindustry\"></span>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";
			} else {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-suitcase\"></i>&nbsp;Industry :&nbsp;<span\n"
						+ "															class=\"userindustry\">"
						+ rs.getString(7) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";

			}

			if (rs.getString(9).equals("--")) {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-wrench\"></i>&nbsp;Skills : NA (Not Mentioned By User)&nbsp;<span\n"
						+ "															class=\"userskills\" data-ng-bind-html=\"profile.skills\"></span>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";
			} else {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-wrench\"></i>&nbsp;Skills :&nbsp;<span\n"
						+ "															class=\"userskills\" data-ng-bind-html=\"profile.skills\">"
						+ rs.getString(9) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";

			}

			if (rs.getString(13).equals("0")) {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-video-camera\"></i>&nbsp;Video Brief :&nbsp;<span\n"
						+ "															class=\"VideoNA\">NA</span>&nbsp;(Not Uploaded By User)\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";
			} else {

				usersHtmlList = usersHtmlList
						+ "													<p class=\"maindetailsbig\">\n"
						+ "														<i class=\"fa fa-video-camera\"></i>&nbsp;Video Brief :&nbsp;<span\n"
						+ "															class=\"VideoAvailable\">Available</span>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbs\" />\n"
						+ "													<hr>\n";

			}

			usersHtmlList = usersHtmlList
					+ "													<p class=\"maindetails\">\n"
					+ "														<a href=\"tel:" + "+"
					+ rs.getString(10).replace(",", "").trim() + "\" class=\"btn btn-success\"><i\n"
					+ "															class=\"fa fa-phone\"></i>&nbsp;" + "+"
					+ rs.getString(10).replace(",", "").trim() + "</a>&nbsp;&nbsp;&nbsp;\n"
					+ "														<a href=\"mailto:" + rs.getString(11)
					+ "\" class=\"btn btn-yellow\"><i\n"
					+ "															class=\"fa fa-envelope\"></i>&nbsp;"
					+ rs.getString(11) + "</a>&nbsp;&nbsp;&nbsp;\n"
					+ "														<a href=\"" + rs.getString(12)
					+ "\" target=\"_blank\"\n"
					+ "															class=\"btn btn-blue\"><i class=\"fa fa-linkedin-square\"></i>&nbsp;Go\n"
					+ "															to LinkedIn Profile</a>\n"
					+ "													</p>\n"
					+ "													<p class=\"mbl\" /></td>\n"
					+ "												<td class=\"td-block\">\n"
					+ "													<div class=\"form-group\">\n"
					+ "														<div class=\"text-center mbl\">\n"
					+ "															<button id=\"" + rs.getString(1)
					+ "\"\n"
					+ "																class=\"btn btn-blue btn-block viewFullProfileButton\">\n"
					+ "																<i class=\"fa fa-user\"></i>&nbsp; FULL PROFILE\n"
					+ "															</button>\n"
					+ "															<!-- \n"
					+ "															&nbsp;\n"
					+ "															<button class=\"btn btn-yellow btn-block editJobPosting\"\n"
					+ "																value=\"" + rs.getString(1)
					+ "\">\n"
					+ "																<i class=\"fa fa-edit\"></i>&nbsp; EDIT USER\n"
					+ "															</button>\n"
					+ "															&nbsp;\n"
					+ "															<button class=\"btn btn-red btn-block deleteJobPosting\"\n"
					+ "																value=\"" + rs.getString(1)
					+ "\">\n"
					+ "																<i class=\"fa fa-remove\"></i>&nbsp; DELETE USER\n"
					+ "															</button>\n"
					+ "															 -->\n"
					+ "														</div>\n"
					+ "													</div>\n"
					+ "												</td>\n"
					+ "											</tr>";

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

		jsonObject.put("usersData", usersHtmlList);
		jsonObject.put("countryFilterData", countriesHtmlList);
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
			if (rs.getString(3).equals("--")) {
				userJsonObject.put("userjobtitle", "Not Working");
				userJsonObject.put("usercompany", "Not Working");
			} else {
				userJsonObject.put("userjobtitle", rs.getString(3));
				userJsonObject.put("usercompany", rs.getString(4));
			}
			userJsonObject.put("location", rs.getString(5));
			userJsonObject.put("country", rs.getString(6));
			if (rs.getString(7).equals("--")) {
				userJsonObject.put("industry", "NA (Not Mentioned By User)");
			} else {
				userJsonObject.put("industry", rs.getString(7));
			}
			userJsonObject.put("joineddate", rs.getString(8));
			if (rs.getString(9).equals("--")) {
				userJsonObject.put("skills", "NA (Not Mentioned By User)");
			} else {
				userJsonObject.put("skills", rs.getString(9));
			}
			userJsonObject.put("phone", "+" + rs.getString(10).replace(",", "").trim());
			userJsonObject.put("email", rs.getString(11));
			userJsonObject.put("profileurl", rs.getString(12));
			userJsonObject.put("videostatus", rs.getString(13));
			userJsonObject.put("videourl",
					"https://www.googleapis.com/download/storage/v1/b/crosstabconnect.appspot.com/o/CTC_"
							+ rs.getString(2).replace(" ", "_") + ".mp4?alt=media");
			if (rs.getString(14).equals("--")) {
				userJsonObject.put("dpurl", "images/avatar/nodp.png");
			} else {
				userJsonObject.put("dpurl", rs.getString(14));
			}
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

}
