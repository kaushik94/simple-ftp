# compiler flags
CC=gcc
CFLAGS_SOLARIS=-lnsl -lsocket -lresolv
CFLAGS=-Wall -g -O #$(DEPS_SOLARIS) #-DNODEBUG

# targets
DEPS=siftp.o service.o
TARGETS=myftp myftpd

all: $(TARGETS)

myftpd: $(DEPS) server.o
	$(CC) $(CFLAGS) -o $@ $^

myftp: $(DEPS) client.o
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f *.o $(TARGETS)
