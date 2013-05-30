import json
import urllib
import urllib2
from urlparse import urlparse

ignoredDomains = ["amazon.com", "ebay.com", "wikipedia.org"]

NUM_SITES_TO_COMPARE = 5
SHOPZILLA_DOMAINS = ["shopzilla.com", "retrevo.com", "bizrate.com"]


def getCustomSearchResult(query, customSearchID, startResult):
    apiKey = "AIzaSyDnj-rClZX3lgIvaxjfngLKkdtzLW2cm_Y"
    quotedQuery = urllib.quote(query)

    googleBaseUrl = "https://www.googleapis.com/customsearch/v1"
    googleOptionsUrl = "?key={0}&cx={1}&q={2}&start={3}&alt=json".format(
        apiKey, customSearchID, quotedQuery, startResult)

    customSearchURL = googleBaseUrl + googleOptionsUrl

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

def getPageDomainNoSubdomain(json, index):
    domain = getPageDomain(json, index)
    splitDomain = domain.split('.', -1)

    if len(splitDomain) < 2:
        #Invalid domain
        #TODO: throw an exception here
        return ""

    return splitDomain[-2] + "." + splitDomain[-1]

#Input: keyword, a string to search;
#       szSite, a string indicating which site to analyze. Valid inputs: 
#       "shopzilla", "retrevo", or "bizrate"
#Output: A dictionary where each entry is a url to be parsed. The key is the
#        domain without the subdomain, and the value is the url.
def getURLs(keyword, szSite):
    allSitesID = "017616669739552287748:iyhaybi_-pg"
    shopzillaID = "017616669739552287748:nm7mjo9djsk"
    bizrateID = "017616669739552287748:bzys95juvvg"
    retrevoID = "017616669739552287748:7jid7recwjk"

    analyzeShopzilla = False
    analyzeBizrate = False
    analyzeRetrevo = False

    if szSite == "shopzilla":
        analyzeShopzilla = True
    elif szSite == "bizrate":
        analyzeBizrate = True
    elif szSite == "retrevo":
        analyzeRetrevo = True
    

    currSearchIndex = 1
    googleJson = getCustomSearchResult(keyword, allSitesID, currSearchIndex)

    urlDict = {}

    numUrls = 0


    #obtain the urls for the top results on Google

    while numUrls < NUM_SITES_TO_COMPARE:

        #Google result only has 10 entries
        for i in range(0, 9):

            currPageDomain = getPageDomainNoSubdomain(
                googleJson, i).encode("ascii")

            if currPageDomain not in ignoredDomains:

                urlDict[currPageDomain] = getPageUrl(
                    googleJson, i).encode("ascii")

                #we must ignore any future occurances of this domain
                ignoredDomains.append(currPageDomain)
                numUrls += 1
                if numUrls >= NUM_SITES_TO_COMPARE:
                    break

        if numUrls >= NUM_SITES_TO_COMPARE:
            break

        #get the next 10
        currSearchIndex += 10


        #The limit on the total number of indices is 101. 91 is the
        #highest value of currSearchIndex since we are going to search
        #another 10.
        if currSearchIndex > 91:
            #TODO: throw an exception here, since there aren't enough results
            break

        googleJson = getCustomSearchResult(keyword, allSitesID, currSearchIndex)

    #obtain the Shopzilla urls if necessary
    if analyzeShopzilla:
        shopzillaSearch = getCustomSearchResult(keyword, shopzillaID, 1)
        urlDict["shopzilla.com"] = getPageUrl(
            shopzillaSearch, 0).encode("ascii")
    if analyzeRetrevo:
        retrevoSearch = getCustomSearchResult(keyword, retrevoID, 1)
        urlDict["retrevo.com"] = getPageUrl(retrevoSearch, 0).encode("ascii")

    if analyzeBizrate:
        bizrateSearch = getCustomSearchResult(keyword, bizrateID, 1)
        urlDict["bizrate.com"] = getPageUrl(bizrateSearch, 0).encode("ascii")

    return urlDict


def main():
    allSitesID = "017616669739552287748:iyhaybi_-pg"
    shopzillaID = "017616669739552287748:nm7mjo9djsk"
    bizrateID = "017616669739552287748:bzys95juvvg"
    retrevoID = "017616669739552287748:7jid7recwjk"

    searchQuery = "hdtv"

    jsonResult = getCustomSearchResult(searchQuery, shopzillaID, 1)


    #print getPageTitle(jsonResult, 0)
    #print getPageDomain(jsonResult, 0)
    #print json.dumps(jsonResult, sort_keys=True, indent=4, separators=(',', ': '))

    print getURLs(searchQuery, "bizrate")

    #urls = getURLs(searchQuery, True, True, True)

    #print urls["cnet.com"]

if __name__ == '__main__':
    main()
