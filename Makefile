SHARED := false
objects = stringutils.o
srcdir = src
headerdir = headers
testdir = test
tempdir = temp

compile: $(objects)
ifeq ($(SHARED), true)
	echo "compiling shared"
else
	echo "compiling static"
	ar -rc cutils.a $(tempdir)/*.o
	ranlib cutils.a
endif

stringutils.o: $(headerdir)/stringutils.h $(srcdir)/stringutils.c
	gcc  -c -I$(headerdir) $(headerdir)/stringutils.h $(srcdir)/stringutils.c
	mv stringutils.o $(tempdir)/

.PHONY: test
test: tests
	./$(testdir)/tests

tests: tests.o
	gcc -o $(testdir)/tests $(testdir)/tests.o

tests.o: $(testdir)/tests.c $(testdir)/tests.h
	gcc -c -L. -lcutils.a -I$(headerdir) $(testdir)/tests.c $(testdir)/tests.h
	mv tests.o $(testdir)/

.PHONY: clear
clear:
	rm $(tempdir)/*
	rm $(testdir)/tests
