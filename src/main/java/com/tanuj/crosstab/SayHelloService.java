package com.tanuj.crosstab;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;

@Path("/helloservice")
public class SayHelloService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response sendJobPostingJSON() throws JSONException {

		JSONObject jsonObject = new JSONObject();
		
		String htmlContent = "html";
		
		String filterContent = "filter";
		
		jsonObject.put("htmlContent", htmlContent);
		jsonObject.put("filterContent", filterContent);

		return Response.status(200).entity(jsonObject.toString()).build();
	}

}
