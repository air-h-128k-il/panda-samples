APPLICATIONS = 					\
	TEST1.so

top_srcdir = ..
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SCRAREA SPAAREA LINKAREA DBTEST
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DBTEST: $(top_srcdir)/dbtest.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DBTEST" -prefix "DBTEST-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory dbtest > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
