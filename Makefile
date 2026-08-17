CC      := gcc
CFLAGS  := -Wall -O2
LDFLAGS := -lpthread
TESTDIR := Test Client

.PHONY: all server clients test-client clean

all: server clients test-client

server:
	$(CC) $(CFLAGS) Server/server.c -o Server/server $(LDFLAGS)

clients:
	$(CC) $(CFLAGS) Client1/client.c Client1/login.c -o Client1/client $(LDFLAGS)
	$(CC) $(CFLAGS) Client2/client.c Client2/login.c -o Client2/client $(LDFLAGS)
	$(CC) $(CFLAGS) Client3/client.c Client3/login.c -o Client3/client $(LDFLAGS)

test-client:
	$(CC) $(CFLAGS) "$(TESTDIR)/client.c" "$(TESTDIR)/login.c" -o "$(TESTDIR)/client" $(LDFLAGS)

clean:
	rm -f Server/server Client1/client Client2/client Client3/client "$(TESTDIR)/client"
