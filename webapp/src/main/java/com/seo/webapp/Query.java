package com.seo.webapp;
import org.json.simple.*;

import java.net.*;
import java.io.*;


public class Query {
	
	/********************************************
	 *                                          *
	 *        MANIFEST CONSTANTS                *
	 *                                          *
	 ********************************************/
	private static final String WEBSERVICE_ADDR = "http://localhost:5000/";
	public  static final String LOG_ERR_MSG     = "Warning!! Could not connect to localhost:5000/*";
	public  static final String PAGE_ERR_MSG    = "Could not connect to webservice.";
	
	/********************************************
	 *                                          *
	 *             Member variables             *
	 *                                          *
	 ********************************************/
	private String m_query;
	private String m_siteToCompare = "shopzilla";
	String s="[0,{\"1\":{\"2\":{\"3\":{\"4\":[5,{\"6\":7}]}}}}]";
	

	/********************************************
	 *                                          *
	 *                Methods                   *
	 *                                          *
	 ********************************************/
	
	
	/**
	 * @return JSON Object in the form of a string 
	 * @throws Exception	If connection to webservice cannot be established. 
	 */
	public String HTTP_Request() throws Exception {
		
		URI site_uri = new URI(
					// scheme
					"http",
					
					// userInfo
					null,
					
					// host
					"localhost",
					
					//port
					5000,
					
					// path
					"/" + m_query + "/" + m_siteToCompare,
					
					//query 
					null,
					
					// fragment
					null
				);
		
		URL url = site_uri.toURL();
		URLConnection uc  = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
		String inputLine  = "";
		String prev       = "";
		
		while ( (inputLine = in.readLine()) != null ) {
			System.out.println(inputLine);
			prev = inputLine;
		}
		
		in.close();
		Object obj=JSONValue.parse(s);
	  JSONArray array=(JSONArray)obj;

		return prev;
	}

	/**
	 * @return Query string
	 */
	public String getQuery() {
		return m_query;
	}

	/**
	 * @param query Sets m_query. 
	 */
	public void setQuery(String query) {
		m_query = query;
	}

	/**
	 * @return The site that the customer wishes to compare (e.g. Shopzilla)
	 */
	public String getSiteToCompare() {
		return m_siteToCompare;
	}

	/**
	 * @param siteToCompare Sets string that represents the site that will be compared against the top Google searches
	 */
	public void setSiteToCompare(String siteToCompare) {
		m_siteToCompare = siteToCompare;
	}
}
