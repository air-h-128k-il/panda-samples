APPLICATIONS =      \
    TEST3.so

top_srcdir = ../../
LDNAME = test2

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common
