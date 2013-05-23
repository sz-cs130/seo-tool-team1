package com.seo.webapp;

import org.json.simple.*;
import java.net.*;
import java.io.*;
import java.util.*;


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
	private String m_JSONString="{  \"Shopzilla\":    {      \"content\": {        \"keyword_pos\": 0,         \"num_keyword\": 0      },       \"description\": {        \"desc_string\": \"Hey wuddup\",         \"keyword_exists\": false      },       \"heading\": {        \"h1\": {          \"keyword_in_h1tags\": 0,           \"num_h1tags\": 0        },         \"h2\": {          \"keyword_in_h2tags\": 0,           \"num_h2tags\": 0        },         \"h3\": {          \"keyword_in_h3tags\": 0,           \"num_h3tags\": 0        },         \"h4\": {          \"keyword_in_h4tags\": 0,           \"num_h4tags\": 0        },         \"h5\": {          \"keyword_in_h5tags\": 0,           \"num_h5tags\": 0        },         \"h6\": {          \"keyword_in_h6tags\": 0,           \"num_h6tags\": 0        }      },       \"title\": {        \"keyword_exists\": false,         \"title_string\": \"Dudez\"      }    },  \"Ebay\":    {      \"content\": {        \"keyword_pos\": 1,         \"num_keyword\": 1      },       \"description\": {        \"desc_string\": \"OMG\",         \"keyword_exists\": false      },       \"heading\": {        \"h1\": {          \"keyword_in_h1tags\": 1,           \"num_h1tags\": 1        },         \"h2\": {          \"keyword_in_h2tags\": 1,           \"num_h2tags\": 1        },         \"h3\": {          \"keyword_in_h3tags\": 1,           \"num_h3tags\": 1        },         \"h4\": {          \"keyword_in_h4tags\": 1,           \"num_h4tags\": 1        },         \"h5\": {          \"keyword_in_h5tags\": 1,           \"num_h5tags\": 1        },         \"h6\": {          \"keyword_in_h6tags\": 1,           \"num_h6tags\": 1        }      },       \"title\": {        \"keyword_exists\": false,         \"title_string\": \"Sparta\"      }    },  \"Amazon\":    {      \"content\": {        \"keyword_pos\": 2,         \"num_keyword\": 2      },       \"description\": {        \"desc_string\": \"Youtube\",         \"keyword_exists\": false      },       \"heading\": {        \"h1\": {          \"keyword_in_h1tags\": 2,           \"num_h1tags\": 2        },         \"h2\": {          \"keyword_in_h2tags\": 2,           \"num_h2tags\": 2        },         \"h3\": {          \"keyword_in_h3tags\": 2,           \"num_h3tags\": 2        },         \"h4\": {          \"keyword_in_h4tags\": 2,           \"num_h4tags\": 2        },         \"h5\": {          \"keyword_in_h5tags\": 2,           \"num_h5tags\": 2        },         \"h6\": {          \"keyword_in_h6tags\": 2,           \"num_h6tags\": 2        }      },       \"title\": {        \"keyword_exists\": false,         \"title_string\": \"Cracked\"      }    }  \"domain\":[\"Shopzilla\",\"Ebay\",\"Amazon\"]}";
	private ArrayList<SiteMetrics> m_sites;

	/********************************************
	 *                                          *
	 *                Methods                   *
	 *                                          *
	 ********************************************/
	
	
	/**
	 * @return JSON Object in the form of a string 
	 * @throws Exception	If connection to webservice cannot be established. 
	 */
	public void HTTP_Request() throws Exception {
		
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
			//m_JSONString += inputLine;
			System.out.println(inputLine);
			//prev = inputLine;
		}
		
		in.close();

		m_sites = new ArrayList<SiteMetrics>();
		setSiteArray(m_JSONString);

		//return prev;
	}

	public void setSiteArray(String jsonString)
	{
		JSONObject jobj = (JSONObject)JSONValue.parse(jsonString);
		JSONArray domainNames = (JSONArray)jobj.get("domain");

		System.out.println(domainNames.size());
		for(int i = 0; i < domainNames.size(); i++)
		{
			String siteName = domainNames.get(i).toString();
			JSONObject siteObj = (JSONObject)jobj.get(siteName);
			siteObj.put("domain", siteName);
			SiteMetrics  siteMets = new SiteMetrics(siteObj);
			m_sites.add(siteMets);
		}
	}

	public ArrayList<SiteMetrics> getSites()
	{
		return m_sites;
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
