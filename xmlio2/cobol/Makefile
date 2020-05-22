APPLICATIONS = 		\
	TEST1.so

top_srcdir = ../
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/test1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-BLOB DB-XML2
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-BLOB: $(top_srcdir)/blob.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-BLOB" -prefix "DB-BLOB-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory blob > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-XML2: $(top_srcdir)/xml2.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-XML2" -prefix "DB-XML2-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory xml2 > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-PATH: $(top_srcdir)/directory
	@echo "copygen > $@"
	@copygen -dbpath -ld $(LDNAME) -dir $(top_srcdir)/directory > $@;	\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
