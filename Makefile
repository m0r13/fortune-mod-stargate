.PHONY: all install clean

directory := /usr/share/fortune

all: stargate.dat

install: all
	test -d $(directory) || mkdir -p $(directory)

	install -m 0644 stargate $(directory)/stargate
	install -m 0644 stargate.dat $(directory)/stargate.dat

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
