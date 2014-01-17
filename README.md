fortune-mod-stargate
==================

This project contains quotes from the Stargate series in a format usable
with fortune. The quotes are downloaded and parsed from wikiquote with
a small Python script.

Use the Makefile to download and install the fortune cookies.
Run ``make stargate`` to download/parse the quotes and 
``make stargate.dat`` to create the random access file required for
fortune. ``make prefix=<directory> install`` will install the fortune 
cookies into the directory ``<directory>``. This directory defaults to
``/usr/share/fortune``, but some Linux distributions might have another
directory for fortune cookies.

You need Python 2 and the ``BeautifulSoup`` module to download and parse
the quotes from wikiquote. The quotes are already contained in the
repository, so you usually only need to create the random access file
for fortune with strfile. If you still want to use the
``parse_wikiquote.py`` script, the usage is `./parse_wikiquote.py
[wikiquote-urls]` and the script outputs the quotes separated with the
``%`` char.
