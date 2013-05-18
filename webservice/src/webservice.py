from flask import Flask, request
from flask.ext.restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}

class SEOTool(Resource):
    def get(self, keyword, site):
        return {keyword: site}

api.add_resource(HelloWorld, '/')
api.add_resource(SEOTool, '/<string:keyword>/<string:site>')

if __name__ == '__main__':
    app.run(debug=True)