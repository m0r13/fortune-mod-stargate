#!/usr/bin/env python2

import sys
import urllib2
from bs4 import BeautifulSoup

def parse_wikiquote(url):
    quotes = []
    soup = BeautifulSoup(urllib2.urlopen(url).read())
    for quote in soup.find_all("dl"):
        text = quote.get_text().encode("ascii", "ignore").strip()
        if not text:
            continue
        quotes.append(text + "\n")
    return quotes

if __name__ == "__main__":
    quotes = []
    for url in sys.argv[1:]:
        quotes.extend(parse_wikiquote(url))
    print "%\n".join(quotes)
