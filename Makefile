.PHONY: all install clean

prefix := /usr/share

all: stargate/sg-1.dat stargate/atlantis.dat stargate/universe.dat

install: all
	test -d $(prefix)/fortune/stargate || mkdir -p $(prefix)/fortune/stargate

	install -m 0644 stargate/sg-1 $(prefix)/fortune/stargate/sg-1
	install -m 0644 stargate/sg-1.dat $(prefix)/fortune/stargate/sg-1.dat
	install -m 0644 stargate/atlantis $(prefix)/fortune/stargate/atlantis
	install -m 0644 stargate/atlantis.dat $(prefix)/fortune/stargate/atlantis.dat
	install -m 0644 stargate/universe $(prefix)/fortune/stargate/universe
	install -m 0644 stargate/universe.dat $(prefix)/fortune/stargate/universe.dat

clean:
	rm -rf stargate/{sg-1,atlantis,universe}{,.dat}

stargate/sg-1:
	./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_SG-1 http://en.wikiquote.org/wiki/Stargate:_The_Ark_of_Truth http://en.wikiquote.org/wiki/Stargate:_Continuum > stargate/sg-1

stargate/atlantis:
	./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_Atlantis > stargate/atlantis

stargate/universe:
	./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_Universe > stargate/universe

%.dat: %
	strfile $<
