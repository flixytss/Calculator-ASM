NASM=nasm
LD=ld
VERSION=elf64
OUTPUT_DIRECTORY=out
ENTRY_DIRECTORY=src
DIS=disassembled
ASE=assembled

all: main.s run

main.s:
	$(NASM) -f$(VERSION) $(ENTRY_DIRECTORY)/main.s -o $(OUTPUT_DIRECTORY)/$(DIS)/main.o
	$(LD) $(OUTPUT_DIRECTORY)/$(DIS)/main.o -o $(OUTPUT_DIRECTORY)/$(ASE)/main_app
run:
	./$(OUTPUT_DIRECTORY)/$(ASE)/main_app