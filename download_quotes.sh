#!/bin/bash

./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_SG-1 http://en.wikiquote.org/wiki/Stargate:_The_Ark_of_Truth http://en.wikiquote.org/wiki/Stargate:_Continuum > stargate/sg-1
./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_Atlantis > stargate/atlantis
./parse_wikiquote.py http://en.wikiquote.org/wiki/Stargate_Universe > stargate/universe

strfile stargate/sg-1
strfile stargate/atlantis
strfile stargate/universe
