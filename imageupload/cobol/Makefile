APPLICATIONS = 					\
	TEST1.so

top_srcdir = ..
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA DB-BLOB
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
