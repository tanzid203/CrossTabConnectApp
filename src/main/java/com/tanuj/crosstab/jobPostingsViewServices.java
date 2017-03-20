package com.tanuj.crosstab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

@Path("/jobPostingsViewServices")
public class jobPostingsViewServices {

	@Path("/getJobPostingData")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPostingJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		JSONArray jobPostingJsonArray = new JSONArray();
		String companiesHtmlList = "<li><span data-path=\"default\">Filter by Company</span></li>\n";
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String jobstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";
		String tagsHtmlList = "<li><span style=\"font-weight: bold;\">TAGS FILTER</span></li>";
		String recruitersHtmlList = "<li><span style=\"font-weight: bold;\">RECRUITER FILTER</span></li>";

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,brief,companybrief,tags,createdby,status,DATE_FORMAT(startdate,'%d %b, %Y') FROM job_list");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				JSONObject jobPostingJsonObject = new JSONObject();

				jobPostingJsonObject.put("jobcode", rs.getString(1));
				jobPostingJsonObject.put("jobtitle", rs.getString(2));
				jobPostingJsonObject.put("industry", rs.getString(3));
				jobPostingJsonObject.put("company", rs.getString(4));
				jobPostingJsonObject.put("companyFilter", rs.getString(4).trim().replaceAll(" ", "_"));
				jobPostingJsonObject.put("location", rs.getString(5));
				jobPostingJsonObject.put("country", rs.getString(6));
				jobPostingJsonObject.put("countryFilter", rs.getString(6).trim().replaceAll(" ", "_"));
				jobPostingJsonObject.put("pincode", rs.getString(7));
				jobPostingJsonObject.put("exp", rs.getString(8) + " Years");
				// --
				// Skills
				ArrayList<String> skillList = new ArrayList<String>(Arrays.asList(rs.getString(9).split("\\s*,\\s*")));
				String skillHtmlList = "";
				for (String skill : skillList) {
					skillHtmlList = skillHtmlList + "<span class=\"skill\">" + skill + "</span>,";
				}
				skillHtmlList = skillHtmlList.substring(0, skillHtmlList.length() - 1);
				jobPostingJsonObject.put("skills", skillHtmlList);

				jobPostingJsonObject.put("jobdescription", rs.getString(10));
				jobPostingJsonObject.put("companyinfo", rs.getString(11));

				// Tags
				ArrayList<String> tagList = new ArrayList<String>(Arrays.asList(rs.getString(12).split("\\s*,\\s*")));
				String tagHtmlList = "";
				for (String tag : tagList) {
					tagHtmlList = tagHtmlList + "<span class=\"label label-default tags tag\">" + tag + "</span>&nbsp;";
				}
				tagHtmlList = tagHtmlList.substring(0, tagHtmlList.length() - 6);
				jobPostingJsonObject.put("tags", tagHtmlList);
				// --
				jobPostingJsonObject.put("recruiter", rs.getString(13));
				jobPostingJsonObject.put("status", rs.getString(14));
				jobPostingJsonObject.put("statusFilter", rs.getString(14).trim().replaceAll(" ", "_"));
				jobPostingJsonObject.put("createdate", rs.getString(15));

				jobPostingJsonArray.put(jobPostingJsonObject);
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(company) FROM job_list ORDER BY company");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				companiesHtmlList = companiesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(country) FROM job_list ORDER BY country");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(status) FROM job_list ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				jobstatusesHtmlList = jobstatusesHtmlList + "<li><span data-path=\"."
						+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(industry) FROM job_list ORDER BY industry");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				industriesHtmlList = industriesHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();

		String skillList = "";
		rs = st.executeQuery("SELECT DISTINCT(skills) FROM job_list ORDER BY skills");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				skillList = skillList + rs.getString(1) + ",";
			}
		}
		rs.close();

		skillList = skillList.substring(0, skillList.length() - 1);// remove
																	// last
																	// comma

		Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
		for (String skill : skillsSet) {
			skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
					+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
		}

		String tagList = "";
		rs = st.executeQuery("SELECT DISTINCT(tags) FROM job_list ORDER BY tags");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				tagList = tagList + rs.getString(1) + ",";
			}
		}
		rs.close();

		tagList = tagList.substring(0, tagList.length() - 1);// remove
		// last
		// comma

		Set<String> tagsSet = new TreeSet<String>(Arrays.asList(tagList.split(",")));
		for (String tag : tagsSet) {
			tagsHtmlList = tagsHtmlList + "<li><input value=\"" + tag + "\" id=\"" + tag
					+ "\" type=\"checkbox\" />&nbsp; " + tag + "</li>";
		}

		rs = st.executeQuery("SELECT DISTINCT(createdby) FROM job_list ORDER BY createdby");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				recruitersHtmlList = recruitersHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();
		st.close();
		conn.close();

		jsonObject.put("jobPostingsData", jobPostingJsonArray);
		jsonObject.put("companyFilterData", companiesHtmlList);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("jobstatusFilterData", jobstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);
		jsonObject.put("tagFilterData", tagsHtmlList);
		jsonObject.put("recruiterFilterData", recruitersHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getJobPostingDataHtml")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPosting2JSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String jobPostingsHtmlList = "";
		String companiesHtmlList = "<li><span data-path=\"default\">Filter by Company</span></li>\n";
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String jobstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";
		String tagsHtmlList = "<li><span style=\"font-weight: bold;\">TAGS FILTER</span></li>";
		String recruitersHtmlList = "<li><span style=\"font-weight: bold;\">RECRUITER FILTER</span></li>";

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
				"SELECT code,title,industry,company,location,country,pincode,exp,skills,brief,companybrief,tags,createdby,status,DATE_FORMAT(startdate,'%d %b, %Y') FROM job_list");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {

				// Skills
				ArrayList<String> skillList = new ArrayList<String>(Arrays.asList(rs.getString(9).split("\\s*,\\s*")));
				String skillHtmlList = "";
				for (String skill : skillList) {
					skillHtmlList = skillHtmlList + "<span class=\"skill\">" + skill + "</span>,";
				}
				skillHtmlList = skillHtmlList.substring(0, skillHtmlList.length() - 1);

				// Tags
				ArrayList<String> tagList = new ArrayList<String>(Arrays.asList(rs.getString(12).split("\\s*,\\s*")));
				String tagHtmlList = "";
				for (String tag : tagList) {
					tagHtmlList = tagHtmlList + "<span class=\"label label-default tags tag\">" + tag + "</span>&nbsp;";
				}
				tagHtmlList = tagHtmlList.substring(0, tagHtmlList.length() - 1);

				jobPostingsHtmlList = jobPostingsHtmlList + "						<tr class=\"tbl-item\">\n"
						+ "												<td class=\"td-block\">\n"
						+ "													<p class=\"jobcode\">" + "JC"
						+ rs.getString(1) + "</p>\n"
						+ "													<p class=\"title\">" + rs.getString(2)
						+ "</p>\n" + "													<p class=\"company mbl "
						+ rs.getString(4).trim().replaceAll(" ", "_") + "\">" + rs.getString(4) + "</p>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-map-marker\"></i>&nbsp;<span\n"
						+ "															class=\"location\">"
						+ rs.getString(5) + "</span>, <span\n"
						+ "															class=\"country "
						+ rs.getString(6).trim().replaceAll(" ", "_") + "\">" + rs.getString(6) + "</span>,\n"
						+ "														<span class=\"pincode\">"
						+ rs.getString(7) + "</span>\n"
						+ "													</p>&nbsp;&nbsp;\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-suitcase\"></i>&nbsp;<span class=\"exp\">"
						+ rs.getString(8) + " Years</span>&nbsp;(<span\n"
						+ "															class=\"industry\">"
						+ rs.getString(3) + "</span>)\n"
						+ "													</p>&nbsp;&nbsp;\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-wrench\"></i>&nbsp;<span class=\"skills\"\n"
						+ "															data-ng-bind-html=\"jobposting.skills\">"
						+ skillHtmlList + "</span>\n" + "													</p>\n"
						+ "													<p class=\"mbm\" />\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\" name=\"showJDButton\"\n"
						+ "															class=\"btn btn-white showJDButton\">\n"
						+ "															Show Job Description&nbsp;<i class=\"fa fa-angle-down\"></i>\n"
						+ "														</button>\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\" name=\"hideJDButton\"\n"
						+ "															class=\"btn btn-white hideJDButton active\">\n"
						+ "															Hide Job Description&nbsp;<i class=\"fa fa-angle-up\"></i>\n"
						+ "														</button>\n"
						+ "														&nbsp;\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\"\n"
						+ "															name=\"showCompanyInfoButton\"\n"
						+ "															class=\"btn btn-white showCompanyInfoButton\">\n"
						+ "															Show Company Info&nbsp;<i class=\"fa fa-angle-down\"> </i>\n"
						+ "														</button>\n"
						+ "														<button id=\"" + rs.getString(1)
						+ "\"\n"
						+ "															name=\"hideCompanyInfoButton\"\n"
						+ "															class=\"btn btn-white hideCompanyInfoButton active\">\n"
						+ "															Hide Company Info&nbsp;<i class=\"fa fa-angle-up\"> </i>\n"
						+ "														</button>\n"
						+ "													</p>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "													<p class=\"showJD\" id=\"" + rs.getString(1)
						+ "\"\n" + "														hidden=\"hidden\">\n"
						+ "														<span class=\"jobdescription mal\"><b>Job\n"
						+ "																Description:&nbsp;</b>"
						+ rs.getString(10) + "</span>\n"
						+ "													<p class=\"showCompanyInfo\" id=\""
						+ rs.getString(1) + "\"\n"
						+ "														hidden=\"hidden\">\n"
						+ "														<span class=\"companyinfo mal\"><b>Company\n"
						+ "																Info:&nbsp;</b>"
						+ rs.getString(11) + "</span>\n" + "													</p>\n"
						+ "													</p>\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-pencil\"></i>&nbsp;Created By : <span\n"
						+ "															class=\"recruiter\">"
						+ rs.getString(13) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-clock-o\"></i>&nbsp;Created On : <span\n"
						+ "															class=\"createdate\">"
						+ rs.getString(15) + "</span>\n" + "													</p>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-flag\"></i>&nbsp;Status : <span\n"
						+ "															class=\""
						+ rs.getString(14).trim().replaceAll("_", " ") + "\">" + rs.getString(14) + "</span>\n"
						+ "													</p>\n"
						+ "													<p class=\"mbm\" />\n"
						+ "													<hr>\n"
						+ "													<p class=\"maindetails\">\n"
						+ "														<i class=\"fa fa-tags\"></i>&nbsp;<span class=\"tags\"\n"
						+ "															data-ng-bind-html=\"jobposting.tags\">"
						+ tagHtmlList + "</span>\n" + "													</p>\n"
						+ "												</td>"
						+ "												<td class=\"td-block\">\n"
						+ "													<div class=\"form-group\">\n"
						+ "														<div class=\"text-center mbl\">\n"
						+ "															<button id=\"" + rs.getString(1)
						+ "\"\n"
						+ "																class=\"btn btn-blue btn-block btn-sm viewAppsButton\">\n"
						+ "																<i class=\"fa fa-group\"></i>&nbsp; VIEW APPS\n"
						+ "															</button>\n"
						+ "															&nbsp;\n"
						+ "															<button id=\"" + rs.getString(1)
						+ "\"\n"
						+ "																class=\"btn btn-yellow btn-block btn-sm editJobPostingButton\">\n"
						+ "																<i class=\"fa fa-edit\"></i>&nbsp; EDIT\n"
						+ "															</button>\n"
						+ "															&nbsp;\n"
						+ "															<button id=\"" + rs.getString(1)
						+ "\"\n"
						+ "																class=\"btn btn-red btn-sm btn-block deleteJobPostingButton\">\n"
						+ "																<i class=\"fa fa-remove\"></i>&nbsp; DELETE\n"
						+ "															</button>\n"
						+ "														</div>\n"
						+ "													</div>\n"
						+ "												</td>\n"
						+ "											</tr>";

			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(company) FROM job_list ORDER BY company");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				companiesHtmlList = companiesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(country) FROM job_list ORDER BY country");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(status) FROM job_list ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				jobstatusesHtmlList = jobstatusesHtmlList + "<li><span data-path=\"."
						+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(industry) FROM job_list ORDER BY industry");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				industriesHtmlList = industriesHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();

		String skillList = "";
		rs = st.executeQuery("SELECT DISTINCT(skills) FROM job_list ORDER BY skills");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				skillList = skillList + rs.getString(1) + ",";
			}
		}
		rs.close();

		skillList = skillList.substring(0, skillList.length() - 1);// remove
																	// last
																	// comma

		Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
		for (String skill : skillsSet) {
			skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
					+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
		}

		String tagList = "";
		rs = st.executeQuery("SELECT DISTINCT(tags) FROM job_list ORDER BY tags");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				tagList = tagList + rs.getString(1) + ",";
			}
		}
		rs.close();

		tagList = tagList.substring(0, tagList.length() - 1);// remove
		// last
		// comma

		Set<String> tagsSet = new TreeSet<String>(Arrays.asList(tagList.split(",")));
		for (String tag : tagsSet) {
			tagsHtmlList = tagsHtmlList + "<li><input value=\"" + tag + "\" id=\"" + tag
					+ "\" type=\"checkbox\" />&nbsp; " + tag + "</li>";
		}

		rs = st.executeQuery("SELECT DISTINCT(createdby) FROM job_list ORDER BY createdby");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				recruitersHtmlList = recruitersHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();
		st.close();
		conn.close();

		jsonObject.put("jobPostingsData", jobPostingsHtmlList);
		jsonObject.put("companyFilterData", companiesHtmlList);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("jobstatusFilterData", jobstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);
		jsonObject.put("tagFilterData", tagsHtmlList);
		jsonObject.put("recruiterFilterData", recruitersHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/getJobPostingsFilters")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPostingFiltersJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String companiesHtmlList = "<li><span data-path=\"default\">Filter by Company</span></li>\n";
		String countriesHtmlList = "<li><span data-path=\"default\">Filter by Country</span></li>\n";
		String jobstatusesHtmlList = "<li><span data-path=\"default\">Filter by Status</span></li>\n";
		String industriesHtmlList = "<li><span style=\"font-weight: bold;\">INDUSTRY FILTER</span></li>";
		String skillsHtmlList = "<li><span style=\"font-weight: bold;\">SKILLS FILTER</span></li>";
		String tagsHtmlList = "<li><span style=\"font-weight: bold;\">TAGS FILTER</span></li>";
		String recruitersHtmlList = "<li><span style=\"font-weight: bold;\">RECRUITER FILTER</span></li>";

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
		ResultSet rs = st.executeQuery("SELECT DISTINCT(company) FROM job_list ORDER BY company");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				companiesHtmlList = companiesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(country) FROM job_list ORDER BY country");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				countriesHtmlList = countriesHtmlList + "<li><span data-path=\"." + rs.getString(1).replaceAll(" ", "_")
						+ "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(status) FROM job_list ORDER BY status");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				jobstatusesHtmlList = jobstatusesHtmlList + "<li><span data-path=\"."
						+ rs.getString(1).replaceAll(" ", "_") + "\">" + rs.getString(1) + "</span></li>";
			}
		}
		rs.close();

		rs = st.executeQuery("SELECT DISTINCT(industry) FROM job_list ORDER BY industry");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				industriesHtmlList = industriesHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();

		String skillList = "";
		rs = st.executeQuery("SELECT DISTINCT(skills) FROM job_list ORDER BY skills");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				skillList = skillList + rs.getString(1) + ",";
			}
		}
		rs.close();

		skillList = skillList.substring(0, skillList.length() - 1);// remove
																	// last
																	// comma

		Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skillList.split(",")));
		for (String skill : skillsSet) {
			skillsHtmlList = skillsHtmlList + "<li><input value=\"" + skill + "\" id=\"" + skill
					+ "\" type=\"checkbox\" />&nbsp; " + skill + "</li>";
		}

		String tagList = "";
		rs = st.executeQuery("SELECT DISTINCT(tags) FROM job_list ORDER BY tags");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				tagList = tagList + rs.getString(1) + ",";
			}
		}
		rs.close();

		tagList = tagList.substring(0, tagList.length() - 1);// remove
		// last
		// comma

		Set<String> tagsSet = new TreeSet<String>(Arrays.asList(tagList.split(",")));
		for (String tag : tagsSet) {
			tagsHtmlList = tagsHtmlList + "<li><input value=\"" + tag + "\" id=\"" + tag
					+ "\" type=\"checkbox\" />&nbsp; " + tag + "</li>";
		}

		rs = st.executeQuery("SELECT DISTINCT(createdby) FROM job_list ORDER BY createdby");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				recruitersHtmlList = recruitersHtmlList + "<li><input value=\"" + rs.getString(1) + "\" id=\""
						+ rs.getString(1) + "\" type=\"checkbox\" />&nbsp; " + rs.getString(1) + "</li>";
			}
		}
		rs.close();
		st.close();
		conn.close();

		jsonObject.put("companyFilterData", companiesHtmlList);
		jsonObject.put("countryFilterData", countriesHtmlList);
		jsonObject.put("jobstatusFilterData", jobstatusesHtmlList);
		jsonObject.put("industryFilterData", industriesHtmlList);
		jsonObject.put("skillFilterData", skillsHtmlList);
		jsonObject.put("tagFilterData", tagsHtmlList);
		jsonObject.put("recruiterFilterData", recruitersHtmlList);

		jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();

	}

	@Path("/createNewJobPosting")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response createJobPosting(@QueryParam("jobtitle") String jobtitle, @QueryParam("company") String company,
			@QueryParam("industry") String industry, @QueryParam("exp") String exp,
			@QueryParam("country") String country, @QueryParam("location") String location,
			@QueryParam("pincode") String pincode, @QueryParam("skills") String skills,
			@QueryParam("jobdescription") String jobdescription, @QueryParam("companyinfo") String companyinfo,
			@QueryParam("tags") String tags, @QueryParam("jobstatus") String jobstatus,
			@QueryParam("createdby") String createdby, @QueryParam("createdon") String createdon,
			@QueryParam("hrname") String hrname, @QueryParam("hrposition") String hrposition,
			@QueryParam("hrquote") String hrquote, @QueryParam("mediastatus") String mediastatus)
			throws JSONException, SQLException, ClassNotFoundException, Exception {

		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		String jobcode = "";

		String foldername = company.replace(" ", "_");

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
		ResultSet rs = st.executeQuery("SELECT MAX(code)+1 FROM job_list");
		while (rs.next()) {
			jobcode = rs.getString(1);
		}
		rs.close();

		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(createdon);
		String createdate = new SimpleDateFormat("yyyy-MM-dd").format(date);

		int x = st.executeUpdate("INSERT INTO job_list values('" + jobcode.trim() + "','" + jobtitle.trim() + "','"
				+ industry.trim() + "','" + company.trim() + "','" + location.trim() + "','" + country.trim() + "','"
				+ pincode.trim() + "','" + exp.trim() + "','" + skills.trim() + "','" + jobdescription.trim() + "','"
				+ companyinfo.trim() + "','" + tags.trim() + "','--','" + createdby.trim() + "','" + jobstatus.trim()
				+ "','" + createdate.trim() + "', null, '1','" + hrname + "','" + hrposition + "','" + hrquote + "', '"
				+ foldername + "','" + mediastatus + "')");

		String response;

		if (x == 1) {
			response = "SUCCESS";
		} else {
			response = "FAIL";
		}

		// Skills
		ArrayList<String> skillList = new ArrayList<String>(Arrays.asList(skills.split("\\s*,\\s*")));
		String skillHtmlList = "";
		for (String skill : skillList) {
			skillHtmlList = skillHtmlList + "<span class=\"skill\">" + skill + "</span>,";
		}
		skillHtmlList = skillHtmlList.substring(0, skillHtmlList.length() - 1);

		// Tags
		ArrayList<String> tagList = new ArrayList<String>(Arrays.asList(tags.split("\\s*,\\s*")));
		String tagHtmlList = "";
		for (String tag : tagList) {
			tagHtmlList = tagHtmlList + "<span class=\"label label-default tags tag\">" + tag + "</span>&nbsp;";
		}
		tagHtmlList = tagHtmlList.substring(0, tagHtmlList.length() - 1);

		String jobPostingContent = "						<tr class=\"tbl-item\">\n"
				+ "												<td class=\"td-block\">\n"
				+ "													<p class=\"jobcode\">" + "JC" + jobcode + "</p>\n"
				+ "													<p class=\"title\">" + jobtitle + "</p>\n"
				+ "													<p class=\"company mbl "
				+ company.trim().replaceAll(" ", "_") + "\">" + company + "</p>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-map-marker\"></i>&nbsp;<span\n"
				+ "															class=\"location\">" + location
				+ "</span>, <span\n" + "															class=\"country "
				+ country.trim().replaceAll(" ", "_") + "\">" + country + "</span>,\n"
				+ "														<span class=\"pincode\">" + pincode
				+ "</span>\n" + "													</p>&nbsp;&nbsp;\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-suitcase\"></i>&nbsp;<span class=\"exp\">"
				+ exp + " Years</span>&nbsp;(<span\n"
				+ "															class=\"industry\">" + industry
				+ "</span>)\n" + "													</p>&nbsp;&nbsp;\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-wrench\"></i>&nbsp;<span class=\"skills\"\n"
				+ "															data-ng-bind-html=\"jobposting.skills\">"
				+ skillHtmlList + "</span>\n" + "													</p>\n"
				+ "													<p class=\"mbm\" />\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<button id=\"" + jobcode
				+ "\" name=\"showJDButton\"\n"
				+ "															class=\"btn btn-white showJDButton\">\n"
				+ "															Show Job Description&nbsp;<i class=\"fa fa-angle-down\"></i>\n"
				+ "														</button>\n"
				+ "														<button id=\"" + jobcode
				+ "\" name=\"hideJDButton\"\n"
				+ "															class=\"btn btn-white hideJDButton active\">\n"
				+ "															Hide Job Description&nbsp;<i class=\"fa fa-angle-up\"></i>\n"
				+ "														</button>\n"
				+ "														&nbsp;\n"
				+ "														<button id=\"" + jobcode + "\"\n"
				+ "															name=\"showCompanyInfoButton\"\n"
				+ "															class=\"btn btn-white showCompanyInfoButton\">\n"
				+ "															Show Company Info&nbsp;<i class=\"fa fa-angle-down\"> </i>\n"
				+ "														</button>\n"
				+ "														<button id=\"" + jobcode + "\"\n"
				+ "															name=\"hideCompanyInfoButton\"\n"
				+ "															class=\"btn btn-white hideCompanyInfoButton active\">\n"
				+ "															Hide Company Info&nbsp;<i class=\"fa fa-angle-up\"> </i>\n"
				+ "														</button>\n"
				+ "													</p>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "													<p class=\"showJD\" id=\"" + jobcode + "\"\n"
				+ "														hidden=\"hidden\">\n"
				+ "														<span class=\"jobdescription mal\"><b>Job\n"
				+ "																Description:&nbsp;</b>" + jobdescription
				+ "</span>\n" + "													<p class=\"showCompanyInfo\" id=\""
				+ jobcode + "\"\n" + "														hidden=\"hidden\">\n"
				+ "														<span class=\"companyinfo mal\"><b>Company\n"
				+ "																Info:&nbsp;</b>" + companyinfo
				+ "</span>\n" + "													</p>\n"
				+ "													</p>\n"
				+ "													<hr>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-pencil\"></i>&nbsp;Created By : <span\n"
				+ "															class=\"recruiter\">" + createdby
				+ "</span>\n" + "													</p>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-clock-o\"></i>&nbsp;Created On : <span\n"
				+ "															class=\"createdate\">" + createdon
				+ "</span>\n" + "													</p>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-flag\"></i>&nbsp;Status : <span\n"
				+ "															class=\""
				+ jobstatus.trim().replaceAll("_", " ") + "\">" + jobstatus + "</span>\n"
				+ "													</p>\n"
				+ "													<p class=\"mbm\" />\n"
				+ "													<hr>\n"
				+ "													<p class=\"maindetails\">\n"
				+ "														<i class=\"fa fa-tags\"></i>&nbsp;<span class=\"tags\"\n"
				+ "															data-ng-bind-html=\"jobposting.tags\">"
				+ tagHtmlList + "</span>\n" + "													</p>\n"
				+ "												</td>"
				+ "												<td class=\"td-block\">\n"
				+ "													<div class=\"form-group\">\n"
				+ "														<div class=\"text-center mbl\">\n"
				+ "															<button id=\"" + jobcode + "\"\n"
				+ "																class=\"btn btn-blue btn-block btn-sm viewAppsButton\">\n"
				+ "																<i class=\"fa fa-group\"></i>&nbsp; VIEW APPS\n"
				+ "															</button>\n"
				+ "															&nbsp;\n"
				+ "															<button id=\"" + jobcode + "\"\n"
				+ "																class=\"btn btn-yellow btn-block btn-sm editJobPostingButton\">\n"
				+ "																<i class=\"fa fa-edit\"></i>&nbsp; EDIT\n"
				+ "															</button>\n"
				+ "															&nbsp;\n"
				+ "															<button id=\"" + jobcode + "\"\n"
				+ "																class=\"btn btn-red btn-sm btn-block deleteJobPostingButton\">\n"
				+ "																<i class=\"fa fa-remove\"></i>&nbsp; DELETE\n"
				+ "															</button>\n"
				+ "														</div>\n"
				+ "													</div>\n"
				+ "												</td>\n"
				+ "											</tr>";

		st.close();
		conn.close();
		jsonObject.put("response", response);
		jsonObject.put("htmlContent", jobPostingContent);

		jsonArray = jsonArray.put(jsonObject);

		return Response.status(200).entity(jsonArray.toString()).build();
	}

	@Path("/getNewJobPostingFields")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPostingFieldsJSON() throws JSONException, SQLException, ClassNotFoundException, Exception {

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

		String locations = "";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT DISTINCT(location) FROM job_list ORDER BY location");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				locations = locations + rs.getString(1) + ",";
			}
		}
		rs.close();

		locations = locations.substring(0, locations.length() - 1);// remove
		// last
		// comma

		Set<String> locationsSet = new TreeSet<String>(Arrays.asList(locations.split(",")));

		String industries = "";
		rs = st.executeQuery("SELECT DISTINCT(industry) FROM job_list ORDER BY industry");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				industries = industries + rs.getString(1) + ",";
			}
		}
		rs.close();

		industries = industries.substring(0, industries.length() - 1);// remove
		// last
		// comma

		Set<String> industriesSet = new TreeSet<String>(Arrays.asList(industries.split(",")));

		String tags = "";
		rs = st.executeQuery("SELECT DISTINCT(tags) FROM job_list ORDER BY tags");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				tags = tags + rs.getString(1) + ",";
			}
		}
		rs.close();

		tags = tags.substring(0, tags.length() - 1);// remove
		// last
		// comma

		Set<String> tagsSet = new TreeSet<String>(Arrays.asList(tags.split(",")));

		String skills = "";
		rs = st.executeQuery("SELECT DISTINCT(skills) FROM job_list ORDER BY skills");
		if (!rs.isBeforeFirst()) {
		} else {
			while (rs.next()) {
				skills = skills + rs.getString(1) + ",";
			}
		}
		rs.close();

		skills = skills.substring(0, skills.length() - 1);// remove
		// last
		// comma

		Set<String> skillsSet = new TreeSet<String>(Arrays.asList(skills.split(",")));

		st.close();
		conn.close();

		jsonObject.put("locationsList", locationsSet.toString());
		jsonObject.put("industriesList", industriesSet.toString());
		jsonObject.put("skillsList", skillsSet.toString());
		jsonObject.put("tagsList", tagsSet.toString());

		return Response.status(200).entity(jsonObject.toString()).build();
	}

}
