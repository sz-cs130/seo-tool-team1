import json
import urllib2

def getCustomSearchResult(query, customSearchID):
    apiKey = "AIzaSyDnj-rClZX3lgIvaxjfngLKkdtzLW2cm_Y"
    customSearchURL = "https://www.googleapis.com/customsearch/v1?key={0}&cx={1}&q={2}&alt=json".format(apiKey, customSearchID, query)
    jsonResult = json.load(urllib2.urlopen(customSearchURL))
    print json.dumps(jsonResult, sort_keys=True, indent=4, separators=(',', ': '))

def main():
    getCustomSearchResult("monitor", "017616669739552287748:7vs82slhbrk")

if __name__ == '__main__':
    main()