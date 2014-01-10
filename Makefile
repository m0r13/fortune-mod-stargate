.PHONY: all install clean

prefix := /usr

all: stargate.dat

install: all
	test -d $(prefix)/share/fortune || mkdir -p $(prefix)/share/fortune

	install -m 0644 stargate $(prefix)/share/fortune/stargate
	install -m 0644 stargate.dat $(prefix)/share/fortune/stargate.dat

clean:
	rm -rf stargate stargate.dat

stargate:
	./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_SG-1 \
		http://en.wikiquote.org/wiki/Stargate:_The_Ark_of_Truth \
		http://en.wikiquote.org/wiki/Stargate:_Continuum \
		http://en.wikiquote.org/wiki/Stargate_Atlantis \
		http://en.wikiquote.org/wiki/Stargate_Universe > stargate

%.dat: %
	strfile $<
