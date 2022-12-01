r_files=$(wildcard day*/*.R)

r-batch=R CMD BATCH --no-save --no-restore $< $@

.DELETE_ON_ERROR:

all: $(r_files:.R=.Rout)

%.Rout: %.R
	$(r-batch)

clean:
	@rm *.Rout

.PHONY: all clear

