#!/usr/bin/env python2

import sys
import urllib2
from bs4 import BeautifulSoup

def parse_wikiquote(url):
    quotes = []
    soup = BeautifulSoup(urllib2.urlopen(url).read())
    for quote in soup.find_all("dl"):
        lines = []
        for dd in quote.find_all("dd"):
            if dd.find("hr") and len(lines) != 0:
                quotes.append("\n".join(lines) + "\n")
                lines = []
            text = dd.get_text().encode("ascii", "ignore").strip()
            if text:
                lines.append(text)
        if len(lines) != 0:
            quotes.append("\n".join(lines) + "\n")
    return quotes

if __name__ == "__main__":
    quotes = []
    for url in sys.argv[1:]:
        quotes.extend(parse_wikiquote(url))
    print "%\n".join(quotes)
