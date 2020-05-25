APPLICATIONS = 		\
	TEST1.so

top_srcdir = ../
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/test1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-BLOB DB-MA DB-FETCH
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-BLOB: $(top_srcdir)/blob.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-BLOB" -prefix "BLOB-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory blob > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-MA: $(top_srcdir)/ma.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-MA" -prefix "MA-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory ma > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-FETCH: $(top_srcdir)/tbl_fetch_test.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-FETCH" -prefix "FETCH-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory tbl_fetch_test > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
