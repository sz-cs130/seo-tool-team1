from flask import Flask, request
from flask.ext.restful import Resource, Api, abort
import urllib2
from customsearch import getURLs
from web_crawler import web_crawl
from json import dumps

app = Flask(__name__)
api = Api(app)

class SEOTool(Resource):
    def get(self, keyword, site):
        validSites = ["retrevo", "bizrate", "shopzilla"]

        if site not in validSites:
            abort(400, message="Cannot analyze the following site: {}".format(site))

        return getCrawlerResult(keyword, site)

def getCrawlerResult(keyword, site):
    parse_data = {'domain':[]} # A dictionary of scraped data from specific web pages
    try:
        search_results = getURLs(keyword, site) # results of custom Google Search using keywords
        for domain,url in search_results.iteritems():
            parse_data[domain] = web_crawl(url, keyword)
            parse_data['domain'].append(domain)
    except urllib2.HTTPError, err:
        abort(err.code, message=str(err.reason))
    except Exception, e:
        abort(400, message=str(e))
    return parse_data

api.add_resource(SEOTool, '/<string:keyword>/<string:site>')

if __name__ == '__main__':
    app.run(debug=True)
