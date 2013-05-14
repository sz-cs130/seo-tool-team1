# Test Script for Python web crawler

# Set up
import web_crawler
import unittest # Python's unit test module

class TestCrawlFunctions(unittest.TestCase):

    def setUp(self):
        self.keyword = "hdtv"
    
    def test_shopzilla(self):
        address = "http://www.shopzilla.com/tv/11520000/products"
        print web_crawler.web_crawl(address, self.keyword)

    def test_bizrate(self):
        address = "http://www.bizrate.com/television-tv/"
        print web_crawler.web_crawl(address, self.keyword)

    def test_topresult(self):
        address = "http://www.hgtv.com/"
        print web_crawler.web_crawl(address, self.keyword)

if __name__ == '__main__':
    unittest.main()
