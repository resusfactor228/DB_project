ifeq ($(origin CC), default)
CC = gcc
endif

TARGET ?= ../lab9
CLIBS ?= -lpq
CFLAGS ?= -Wall -Werror -Wextra -std=c11
SRC = zelbus.c
OBJ = $(SRC:.c=.o)

.PHONY: make_db
make_db:
	./drop_db.sh
	./create_db.sh
	./create_tables.sh
	./create_indexes.sh
	./fill_db.sh
	./create_procedures.sh

.PHONY: create_empty_db
create_db:
	./drop_db.sh
	./create_db.sh
	./create_tables.sh

.PHONY: 

.PHONY: zelbus
zelbus: $(TARGET)/zelbus

$(TARGET)/%: $(OBJ)
	$(CC) $^ -o $@ $(CLIBS)

.PHONY: clean
clean:
	./drop_db.sh
	rm -rf $(OBJ) $(TARGET)/zelbus
