from flask import Flask, request
from flask.ext.restful import Resource, Api, abort
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
    finalDict = {'domain': []}
    urlDict = getURLs(keyword, site)

    for key,value in urlDict.iteritems():
        finalDict[key] = web_crawl(value, keyword)
        finalDict['domain'].append(key)

    return finalDict

api.add_resource(SEOTool, '/<string:keyword>/<string:site>')

if __name__ == '__main__':
    app.run(debug=True)
