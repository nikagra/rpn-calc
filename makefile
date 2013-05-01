CC=g++
CFLAGS=-Wall
LDFLAGS=-lfl
SRCS=main.cpp tokens.cpp rpcalc.cpp
OBJS=$(SRCS:.cpp=.o)
LEX=flex
SYN=bison
PROGRAM=foobar

all: $(PROGRAM) 

$(PROGRAM): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) -c -o $@ $<
	
tokens.cpp: tokens.l rpcalc.cpp
	$(LEX) -o $@ $<

rpcalc.cpp: rpcalc.y
	$(SYN) -d -o $@ $<

clean:
	-rm *.o $(PROGRAM) rpcalc.cpp tokens.cpp rpcalc.hpp
