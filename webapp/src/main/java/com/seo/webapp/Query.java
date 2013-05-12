package com.seo.webapp;

public class Query {
	private String m_query;
	private String m_siteToCompare = "Shopzilla";

	public String getQuery() {
		return m_query;
	}

	public void setQuery(String query) {
		m_query = query;
	}

	public String getSiteToCompare() {
		return m_siteToCompare;
	}

	public void setSiteToCompare(String siteToCompare) {
		m_siteToCompare = siteToCompare;
	}
}
