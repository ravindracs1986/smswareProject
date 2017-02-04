package com.smsaware.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/comments")
public class Ecomment {
	
	@GET
	@Path("/{param}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getComments(@PathParam("param") String param) {

		String output = "Jersey say : " + param;

		return Response.status(200).entity(output).build();

	}

}
