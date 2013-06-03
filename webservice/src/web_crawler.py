# Web Scraper for SEO Metrics

# Dependencies and Setup
from bs4 import BeautifulSoup # Python web parsing tool
import urllib2 # Python 3: use urlib.request
import json #JSON construction API for Python
import re # Python Regular Expression package

def html_parse(address):
    """ A parsing function that returns a BeautifulSoup object for easy
        grabbing of data.
        Input: web address for site to be parsed
        Output: BeautifulSoup object for easy grabbing of data """
    # Open a network object denoted by a URL for reading
    htmlPage = urllib2.urlopen(address)
    htmlText = htmlPage.read()
    soup = BeautifulSoup(htmlText)
    return soup

def web_crawl(address, keyword):
    """ A web crawler function that scrapes relevant SEO data from a web page.
        Input:
        address - web address for site to be parsed
        keyword - search term for gathering certain metrics
        Output:
        JSON String consisting of:
            Title
            Description
            Number of Appearances of Keyword
            Number of characters before first appearance of keyword
            Number of each <h#> tag denomination
            Appearance of keyword in title
            Appearance of keyword in description"""
    # Setup Variables
    data = {}
    soup = html_parse(address) # BeautifulSoup object of html page
    if soup == None:
        raise Exception("Could not parse webpage.")
    
    # Title Data
    try:
        title_string = soup.title.string
        keyword_exists_in_title = bool(re.search(keyword, title_string, re.IGNORECASE))
    except AttributeError:
        title_string = "No title"
        keyword_exists_in_title = False
    title_data = {"title_string":title_string, "keyword_exists":keyword_exists_in_title}
    data['title'] = title_data

    # Description Data
    desc_string = "No Description"
    desc_tag = soup.find("meta", {"name":"description"})
    if desc_tag == None:
        desc_string = "No Description"
    else:
        desc_tag = desc_tag['content']
    keyword_exists_in_desc = bool(re.search(keyword, desc_string, re.IGNORECASE))
    desc_data = {"desc_string":desc_string, "keyword_exists":keyword_exists_in_desc}
    data['description'] = desc_data

    # Heading Data
    # h1 data
    h1_tags = soup.find_all('h1')
    num_h1tags = len(h1_tags)
    keyword_in_h1tags = 0
    for h1 in h1_tags:
        keyword_in_h1tags += len(re.findall(keyword, str(h1), re.IGNORECASE)) # Number of appearances of keyword in h1 tags
    h1_data = {'num_h1tags':num_h1tags, 'keyword_in_h1tags':keyword_in_h1tags}
        
    # h2 data
    h2_tags = soup.find_all('h2')
    num_h2tags = len(h2_tags)
    keyword_in_h2tags = 0
    for h2 in h2_tags:
        keyword_in_h2tags += len(re.findall(keyword, str(h2), re.IGNORECASE)) # Number of appearances of keyword in h tags
    h2_data = {'num_h2tags':num_h2tags, 'keyword_in_h2tags':keyword_in_h2tags}

    # h3 data
    h3_tags = soup.find_all('h3')
    num_h3tags = len(h3_tags)
    keyword_in_h3tags = 0
    for h3 in h3_tags:
        keyword_in_h3tags += len(re.findall(keyword, str(h3), re.IGNORECASE)) # Number of appearances of keyword in h tags
    h3_data = {'num_h3tags':num_h3tags, 'keyword_in_h3tags':keyword_in_h3tags}

    # h4 data
    h4_tags = soup.find_all('h4')
    num_h4tags = len(h4_tags)
    keyword_in_h4tags = 0
    for h4 in h4_tags:
        keyword_in_h4tags += len(re.findall(keyword, str(h4), re.IGNORECASE)) # Number of appearances of keyword in h tags
    h4_data = {'num_h4tags':num_h4tags, 'keyword_in_h4tags':keyword_in_h4tags}

    # h5 data
    h5_tags = soup.find_all('h5')
    num_h5tags = len(h5_tags)
    keyword_in_h5tags = 0
    for h5 in h5_tags:
        keyword_in_h5tags += len(re.findall(keyword, str(h5), re.IGNORECASE)) # Number of appearances of keyword in h tags
    h5_data = {'num_h5tags':num_h5tags, 'keyword_in_h5tags':keyword_in_h5tags}

    # h6 data
    h6_tags = soup.find_all('h6')
    num_h6tags = len(h6_tags)
    keyword_in_h6tags = 0
    for h6 in h6_tags:
        keyword_in_h6tags += len(re.findall(keyword, str(h6), re.IGNORECASE)) # Number of appearances of keyword in h tags
    h6_data = {'num_h6tags':num_h6tags, 'keyword_in_h6tags':keyword_in_h6tags}
        
    heading_data = {'h1':h1_data, 'h2':h2_data, 'h3':h3_data,
                    'h4':h4_data, 'h5':h5_data, 'h6':h6_data}
    data['heading'] = heading_data

    # Content Data
    page_content = soup.body.getText()
    num_keyword = len(re.findall(keyword, page_content, re.IGNORECASE)) # Number of appearances of the keyword
    if num_keyword == 0:
        keyword_position = 0
    else:   
        keyword_position = re.search(keyword, page_content, re.IGNORECASE).start() # Position of first appearance of keyword
    content_data = {'num_keyword':num_keyword, 'keyword_pos':keyword_position}
    data['content'] = content_data
        
    return data # Return the dictionary representation of the data

