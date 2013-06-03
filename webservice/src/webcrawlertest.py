# Test Script for Python web crawler

# Set up
import web_crawler
from json import dumps
import unittest # Python's unit test module

class TestCrawlFunctions(unittest.TestCase):

    def setUp(self):
        self.keyword = "hdtv"
    
    def test_shopzilla(self):
        address = "http://www.shopzilla.com/tv/11520000/products"
        print dumps(web_crawler.web_crawl(address, self.keyword),indent=2,sort_keys=True)

    def test_bizrate(self):
        address = "http://www.bizrate.com/television-tv/"
        print dumps(web_crawler.web_crawl(address, self.keyword),indent=2,sort_keys=True)

    def test_topresult(self):
        address = "http://www.hgtv.com/"
        print dumps(web_crawler.web_crawl(address, self.keyword),indent=2,sort_keys=True)
        
if __name__ == '__main__':
    unittest.main()
