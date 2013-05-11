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
    try:
        # Open a network object denoted by a URL for reading
        htmlPage = urllib2.urlopen(address)
    except urllib2.HTTPError, e:
        print 'HTTPError = ' + str(e.code)
    except urllib2.URLError, e:
        print 'URLError = ' + str(e.reason)
    except Exception:
        import traceback
        print 'Generic Exception: ' + traceback.format_exc()
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
    # Title Data
    title_string = soup.title.string
    if title_string == None:
        title_string = "No Title"
        keyword_exists_in_title = False
    else:
        keyword_exists_in_title = bool(re.search(keyword, title_string, re.IGNORECASE))
    title_data = {"title_string":title_string, "keyword_exists":keyword_exists_in_title}
    data['title'] = title_data

    # Description Data
    desc_string = soup.find("meta", {"name":"description"})['content']
    if desc_string == None:
        desc_string = "No Description"
        keyword_exists_in_desc = False
    else:
        keyword_exists_in_desc = bool(re.search(keyword, desc_string, re.IGNORECASE))
    desc_data = {"desc_string":desc_string, "keyword_exists":keyword_exists_in_desc}
    data['description'] = desc_data

    # Heading Data
    num_h1tags = len(soup.find_all('h1'))
    num_h2tags = len(soup.find_all('h2'))
    num_h3tags = len(soup.find_all('h3'))
    num_h4tags = len(soup.find_all('h4'))
    num_h5tags = len(soup.find_all('h5'))
    num_h6tags = len(soup.find_all('h6'))
    heading_data = {'h1':num_h1tags, 'h2':num_h2tags, 'h3':num_h3tags,
                    'h4':num_h4tags, 'h5':num_h5tags, 'h6':num_h6tags}
    data['heading'] = heading_data

    # Content Data
    page_content = soup.body.getText()
    num_keyword = len(re.findall(keyword, page_content, re.IGNORECASE)) # Number of appearances of the keyword
    keyword_position = re.search(keyword, page_content, re.IGNORECASE).start() # Position of first appearance of keyword
    content_data = {'num_keyword':num_keyword, 'keyword_pos':keyword_position}
    data['content'] = content_data

    return json.dumps(data, sort_keys=True, indent=2) # Return a JSON representation of the data

# Basic Test when the script is run
if __name__ == "__main__":
    test_url = "http://www.pcmag.com/category2/0,2806,6,00.asp"
    test_keyword = "hdtv"
    print web_crawl(test_url, test_keyword)


        
    
