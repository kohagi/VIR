test: encode.pl
	./encode.pl test/volup.ir.dec | diff - test/volup.ir
	@echo TEST OK

