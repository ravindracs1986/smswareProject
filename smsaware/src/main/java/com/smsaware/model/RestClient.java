/*package com.petco.common.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.glassfish.jersey.client.ClientProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petco.common.service.model.ServiceError;


public class RestClient {
	private static final Logger logger = LoggerFactory.getLogger(RestClient.class);

	private static WebTarget target = null;
	private static Client client = null;
	//private static Invocation invocation = null;


	public static <T> T get(String url, Class<T> clazz) {
		T obj = null;
		try {
			client = ClientBuilder.newClient();
			target = client.target(url.toString());
			Response response = target.request().accept(MediaType.APPLICATION_JSON).get();
			if (response.getStatus() == 200) {
				String respString= response.readEntity(String.class);
				ObjectMapper mapper = new ObjectMapper();
				obj = mapper.readValue(respString,clazz);
				return obj;
			} else {
				throw new ServiceException(true);
			}

		} catch (Exception e) {
			logger.error("Exception in Rest client Call");
		}

		return obj;
	}

	public static String get(String url) {
		client = ClientBuilder.newClient();
		target = client.target(url.toString());
		Response response = target.request().accept(MediaType.APPLICATION_JSON).get();
		if (response.getStatus() == 200) {
			return response.readEntity(String.class);
		} else {
			throw new ServiceException(true);
		}

	}
	
	public static String getHtml(String url) {
		client = ClientBuilder.newClient();
		target = client.target(url.toString());
		Response response = target.request().accept(MediaType.TEXT_HTML).get();
		if (response.getStatus() == 200) {
			return response.readEntity(String.class);
		} else {
			throw new ServiceException(true);
		}

	}

	public static <T> T post(String url, Object request, Class<T> clazz) {
		T obj = null;
		try {

			client = ClientBuilder.newClient();
			target = client.target(url.toString());
			Response response = target.request().buildPost(Entity.entity(request, MediaType.APPLICATION_JSON)).invoke();
			if (response.getStatus() == 200) {
				String respString= response.readEntity(String.class);
				ObjectMapper mapper = new ObjectMapper();
				obj = mapper.readValue(respString,clazz);
				
			} else {
				throw new ServiceException(true);
			}

		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return obj;
	}

	public static String post(String url, Object request) {
		String str = "";
		try {
			client = ClientBuilder.newClient();
			target = client.target(url.toString());
			Response response = target.request().buildPost(Entity.entity(request, MediaType.APPLICATION_JSON)).invoke();
			if (response.getStatus() == 200) {
				str = response.readEntity(String.class);
			} else {
				throw new ServiceException(true);
			}

		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return str;
	}

	public static <T> T put(String url, Object request, Class<T> clazz) {
		T obj = null;
		try {
			Client client = ClientBuilder.newClient();
			WebTarget webTarget = client.target(url);
			Invocation.Builder invocationBuilder =  webTarget.request(MediaType.APPLICATION_JSON);
			Response response = invocationBuilder.put(Entity.entity(request, MediaType.APPLICATION_JSON));
			 
			obj= response.readEntity(clazz);
		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return obj;
	}

	public static Response put(String url) {
		Client client = ClientBuilder.newClient();
		WebTarget webTarget = client.target(url).property(ClientProperties.SUPPRESS_HTTP_COMPLIANCE_VALIDATION, true);
		 
		 
		Invocation.Builder invocationBuilder =  webTarget.request(MediaType.APPLICATION_JSON);
		Response response = invocationBuilder.buildPut(null).invoke();
		 
		return Response.status(201).build();
	}

	public static <T> T put(String url, Class<T> clazz) {
		T obj = null;
		try {
			Client client = ClientBuilder.newClient();
			WebTarget webTarget = client.target(url).property(ClientProperties.SUPPRESS_HTTP_COMPLIANCE_VALIDATION, true);
			 
			 
			Invocation.Builder invocationBuilder =  webTarget.request(MediaType.APPLICATION_JSON);
			Response response = invocationBuilder.buildPut(null).invoke();
			 
			obj= response.readEntity(clazz);
			
		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return obj;
	}

	public static String put(String url, Object request) {
		String obj = null;
		try {
			Client client = ClientBuilder.newClient();
			WebTarget webTarget = client.target(url).property(ClientProperties.SUPPRESS_HTTP_COMPLIANCE_VALIDATION, true);
			 
			 
			Invocation.Builder invocationBuilder =  webTarget.request(MediaType.APPLICATION_JSON);
			Response response = invocationBuilder.buildPut(null).invoke();
			 
			obj= response.readEntity(String.class);
		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return obj;
	}

	public static <T> T delete(String url, Class<T> clazz) {
		T obj = null;
		try {
			client = ClientBuilder.newClient();
			target = client.target(url.toString());
			Response response = target.request().accept(MediaType.APPLICATION_JSON).delete();
			if (response.getStatus() == 200) {
				String respString= response.readEntity(String.class);
				ObjectMapper mapper = new ObjectMapper();
				obj = mapper.readValue(respString,clazz);
			} else {
				throw new ServiceException(true);
			}

		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return obj;
	}

	public static String delete(String url) {
		String strObj = "";
		try {
			client = ClientBuilder.newClient();
			target = client.target(url.toString());
			Response response = target.request().accept(MediaType.APPLICATION_JSON).delete();
			if (response.getStatus() == 200) {
				strObj = response.readEntity(String.class);
			} else {
				throw new ServiceException(true);
			}

		} catch (Exception e) {
			ServiceError error = new ServiceError();
			throw new ServiceException(error);
		}
		return strObj;
	}

	public HttpResponse restClient(String url) throws IOException, ClientProtocolException {
		logger.info("restClient URL::" + url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpGet getRequest = new HttpGet(url);
		getRequest.addHeader("accept", "application/json");
		HttpResponse response = null;
		response = httpClient.execute(getRequest);
		return response;

	}

	public HttpResponse restClient(String url, String requestContentType) throws IOException, ClientProtocolException {
		logger.info("restClient URL::" + url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpGet getRequest = new HttpGet(url);
		getRequest.addHeader("accept", requestContentType);
		HttpResponse response = null;
		response = httpClient.execute(getRequest);
		return response;

	}

	public HttpResponse restClientPost(String url, List<NameValuePair> urlParams)
			throws IOException, ClientProtocolException {
		logger.info("restClientPost URL::" + url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(url);
		postRequest.setEntity(new UrlEncodedFormEntity(urlParams));
		postRequest.addHeader("Content-Type", "application/json");
		postRequest.addHeader("Accept", MediaType.APPLICATION_FORM_URLENCODED);
		HttpResponse response = null;
		response = httpClient.execute(postRequest);
		return response;

	}

	public HttpResponse restClientPost(String url) throws IOException, ClientProtocolException {
		logger.info("restClientPost URL::" + url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost postRequest = new HttpPost(url);
		postRequest.addHeader("Content-Type", "application/json");
		HttpResponse response = null;
		response = httpClient.execute(postRequest);
		return response;

	}

	public String invokeService(String url, String contentType) throws ServiceException, IOException {
		String responseString = null;
		HttpResponse httpResponse = restClient(url, contentType);
		responseString = constructResponseString(httpResponse);
		return responseString;
	}

	public String invokeService(String url) throws ServiceException, org.apache.http.ParseException, IOException {
		String responseString = null;
		HttpResponse httpResponse = restClient(url);
		responseString = constructResponseString(httpResponse);
		return responseString;
	}

	public String invokePostService(String url) throws org.apache.http.ParseException, ServiceException, IOException {
		String responseString = null;
		HttpResponse httpResponse = restClientPost(url);
		responseString = constructResponseString(httpResponse);
		return responseString;

	}

	//////
	public String invokePostService(String url, Map<String, String> urlParams) throws ServiceException, IOException {
		String responseString = null;
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		for (Map.Entry<String, String> entry : urlParams.entrySet()) {
			nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}

		HttpResponse httpResponse = restClientPost(url, nvps);
		responseString = constructResponseString(httpResponse);
		return responseString;

	}

	// new
	public String invokePostService1(String url, StringEntity entity) throws ServiceException, IOException {
		String responseString = null;
		HttpResponse httpResponse = restClientPost1(url, entity);
		responseString = constructResponseString(httpResponse);
		return responseString;

	}

	public HttpResponse restClientPost1(String url, StringEntity entity) throws IOException, ClientProtocolException {
		logger.info("restClientPost URL::" + url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost post = new HttpPost(url);
		post.setEntity(entity);
		post.setHeader("Content-type", "application/json");
		HttpResponse response = null;
		response = httpClient.execute(post);
		return response;

	}

	private static String constructResponseString(HttpResponse httpResponse)
			throws ServiceException, org.apache.http.ParseException, IOException {
		String responseString = null;

		if (httpResponse.getStatusLine().getStatusCode() == 200) {
			HttpEntity rewardsEntity = httpResponse.getEntity();
			responseString = EntityUtils.toString(rewardsEntity, "UTF-8");
			logger.info("resRewards::" + responseString);
			if (!responseString.isEmpty()) {
				return responseString;
			}
		}
		if (httpResponse.getStatusLine().getStatusCode() == 500) {
			// check the error code and send Error Object as json
			ServiceError error = new ServiceError();
			error.setErrorCode("500");
			error.setErrorMsg("Internal Server Error");
			responseString = CommonUtils.getJson(error);
			throw new ServiceException(error);
		} else if (httpResponse.getStatusLine().getStatusCode() == 503) {
			ServiceError error = new ServiceError();
			error.setErrorCode("503");
			error.setErrorMsg("Service Unavailable");
			responseString = CommonUtils.getJson(error);
			throw new ServiceException(error);

		} else if (httpResponse.getStatusLine().getStatusCode() == 404) {
			ServiceError error = new ServiceError();
			error.setErrorCode("404");
			error.setErrorMsg("Not Found");
			responseString = CommonUtils.getJson(error);
			throw new ServiceException(error);
		}
		return responseString;

	}
}
*/