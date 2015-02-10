#
# To compile, type "make" or make "all"
# To remove files, type "make clean"
#
OBJS = itcs343_server.o itcs343_client.o itcs343.o
TARGET = server

CC = gcc
CFLAGS = -g -Wall -pthread

.SUFFIXES: .c .o 

all: server client

server: itcs343_server.o itcs343.o
	$(CC) $(CFLAGS) -o server itcs343_server.o itcs343.o

client: itcs343_client.o itcs343.o
	$(CC) $(CFLAGS) -o client itcs343_client.o itcs343.o

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	-rm -f $(OBJS) server client 
