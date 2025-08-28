NASM=nasm
LD=ld
VERSION=elf64
OUTPUT_DIRECTORY=out
ENTRY_DIRECTORY=src
DIS=disassembled
ASE=assembled
DEBUG_OUTPUT=debug

all: main.s run
debug: main.s gdb

gdb:
	gdb -x $(ENTRY_DIRECTORY)/$(DEBUG_OUTPUT)/main.gdb $(OUTPUT_DIRECTORY)/$(ASE)/main_app
main.s:
	$(NASM) -f$(VERSION) $(ENTRY_DIRECTORY)/main.s -o $(OUTPUT_DIRECTORY)/$(DIS)/main.o
	$(LD) $(OUTPUT_DIRECTORY)/$(DIS)/main.o -o $(OUTPUT_DIRECTORY)/$(ASE)/main_app
run:
	./$(OUTPUT_DIRECTORY)/$(ASE)/main_app