OPTIONS=-shared
ifeq ($(shell uname),Darwin)
OPTIONS+= -dynamiclib -undefined dynamic_lookup
endif

CFLAGS=-O2 -fPIC -std=c99 -Wall


priv/signal_handler.so: src/signal_handler_nif.c
	$(CC) $(CFLAGS) -I$(ERTS_INCLUDE_PATH) $(OPTIONS) -o priv/signal_handler.so src/signal_handler_nif.c

clean:
	$(RM) priv/*.so
