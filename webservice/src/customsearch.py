import json
import urllib
import urllib2
from urlparse import urlparse

def getCustomSearchResult(query, customSearchID):
    apiKey = "AIzaSyDnj-rClZX3lgIvaxjfngLKkdtzLW2cm_Y"
    quotedQuery = urllib.quote(query)
    customSearchURL = "https://www.googleapis.com/customsearch/v1?key={0}&cx={1}&q={2}&alt=json".format(apiKey, customSearchID, quotedQuery)
    
    jsonResult = json.load(urllib2.urlopen(customSearchURL))
    return jsonResult

def getPageTitle(json, index):
    return json["items"][index]["title"]

def getPageUrl(json, index):
    return json["items"][index]["link"]

def parseDomain(url):
    return urlparse(url).netloc

def getPageDomain(json, index):
    url = getPageUrl(json, index)
    return parseDomain(url)

def main():
    allSitesID = "017616669739552287748:iyhaybi_-pg"
    shopzillaID = "017616669739552287748:nm7mjo9djsk"
    bizrateID = "017616669739552287748:bzys95juvvg"
    retrevoID = "017616669739552287748:7jid7recwjk"
    
    searchQuery = "hdtv"

    jsonResult = getCustomSearchResult(searchQuery, shopzillaID)
    
    print getPageTitle(jsonResult, 0)
    print getPageDomain(jsonResult, 0)

if __name__ == '__main__':
    main()
