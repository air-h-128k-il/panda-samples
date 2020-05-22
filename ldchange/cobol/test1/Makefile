APPLICATIONS =      \
    TEST1.so         \
    TEST2.so

top_srcdir = ../../
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common
