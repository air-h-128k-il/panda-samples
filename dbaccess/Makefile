all: directory
	@cd cobol; make all

directory: directory.in
	@rm -f $@
	@sed -e "s|%PWD%|$${PWD}|g" \
	    $< > $@

clean: 
	rm -f directory
	@cd cobol; make clean
