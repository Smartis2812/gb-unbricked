# Compiler and linker
RGBASM := rgbasm
RGBLINK := rgblink
RGBFIX := rgbfix

# Input and output files
ASM_FILE := main.asm
OBJ_FILE := main.o
ROM_FILE := unbricked.gb
SYM_FILE := unbricked.sym

# Flags
RGBFIXFLAGS := -v -p 0xFF

# Build
build: 
	$(RGBASM) $(ASM_FILE) -o $(OBJ_FILE) 
	$(RGBLINK) -o $(ROM_FILE) $(OBJ_FILE)
	$(RGBFIX) $(RGBFIXFLAGS) $(ROM_FILE) 
	$(RGBLINK) -n $(SYM_FILE) -t $(OBJ_FILE)

# Clean folder
clean:
	rm -f $(OBJ_FILE) $(ROM_FILE) $(SYM_FILE) $(ROM_FILE)

.PHONY: build clean