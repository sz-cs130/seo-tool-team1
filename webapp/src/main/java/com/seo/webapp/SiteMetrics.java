package com.seo.webapp;

import org.json.simple.*;

public class SiteMetrics {

	private String m_domain;
	// Contains the first level object of the JSON object
	private JSONObject m_baseObject;
	// Contains the "content" property
	private JSONObject m_content;
	// Contains the "description" property
	private JSONObject m_description;
	// Contains the "title" property
	private JSONObject m_title;
	// Contains the "h#" properties
	private JSONObject m_h1;
	private JSONObject m_h2;
	private JSONObject m_h3;
	private JSONObject m_h4;
	private JSONObject m_h5;
	private JSONObject m_h6;

	// Constructor. Parses down into individual properties
	public SiteMetrics(JSONObject jobj)
	{
		m_baseObject = jobj;

		m_domain = m_baseObject.get("domain").toString();
		
		m_content = (JSONObject)m_baseObject.get("content");
		m_description = (JSONObject)m_baseObject.get("description");
		JSONObject heading = (JSONObject)m_baseObject.get("heading");
		m_h1 = (JSONObject)heading.get("h1");
		m_h2 = (JSONObject)heading.get("h2");
		m_h3 = (JSONObject)heading.get("h3");
		m_h4 = (JSONObject)heading.get("h4");
		m_h5 = (JSONObject)heading.get("h5");
		m_h6 = (JSONObject)heading.get("h6");
		m_title = (JSONObject)m_baseObject.get("title");
	}

	/*
	 * getter functions for access in results.jsp.
	 */
	public String getDomain()
	{
		return m_domain;
	}

	public String getKeywordPos()
	{
		return m_content == null ? "" : m_content.get("keyword_pos").toString();
	}

	public String getNumKeyword()
	{
		return m_content == null ? "" : m_content.get("num_keyword").toString();
	}

	public String getDescString()
	{
		return m_description == null ? "" : m_description.get("desc_string").toString();
	}

	public String getKeywordExistsDesc()
	{
		return m_description == null ? "" :  m_description.get("keyword_exists").toString();
	}

	public String getKeywordH1Tag()
	{
		return m_h1 == null ? "" : m_h1.get("keyword_in_h1tags").toString();
	}

	public String getNumH1Tag()
	{
		return m_h1 == null ? "" : m_h1.get("num_h1tags").toString();
	}
	
	public String getKeywordH2Tag()
	{
		return m_h2 == null ? "" : m_h2.get("keyword_in_h2tags").toString();
	}

	public String getNumH2Tag()
	{
		return m_h2 == null ? "" : m_h2.get("num_h2tags").toString();
	}

	public String getKeywordH3Tag()
	{
		return m_h3 == null ? "" : m_h3.get("keyword_in_h3tags").toString();
	}

	public String getNumH3Tag()
	{
		return m_h3 == null ? "" : m_h3.get("num_h3tags").toString();
	}

	public String getKeywordH4Tag()
	{
		return m_h4 == null ? "" : m_h4.get("keyword_in_h4tags").toString();
	}

	public String getNumH4Tag()
	{
		return m_h4 == null ? "" : m_h4.get("num_h4tags").toString();
	}

	public String getKeywordH5Tag()
	{
		return m_h5 == null ? "" : m_h5.get("keyword_in_h5tags").toString();
	}

	public String getNumH5Tag()
	{
		return m_h5 == null ? "" : m_h5.get("num_h5tags").toString();
	}

	public String getKeywordH6Tag()
	{
		return m_h6 == null ? "" : m_h6.get("keyword_in_h6tags").toString();
	}

	public String getNumH6Tag()
	{
		return m_h6 == null ? "" : m_h6.get("num_h6tags").toString();
	}

	public String getKeywordExistsTitle()
	{
		return m_title == null ? "" : m_title.get("keyword_exists").toString();
	}

	public String getTitleString()
	{
		return m_title == null ? "" : m_title.get("title_string").toString();
	}
}

