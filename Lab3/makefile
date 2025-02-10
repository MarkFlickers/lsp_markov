CC = iverilog
VVP = vvp
GTKWAVE = gtkwave

FLAGS = -Wall -Winfloop

COMPILER_OUTPUT = out

BUILD_DIR = build

GTKSAVEFILE = cnt.gtkw

#SRC_MODULES += $(wildcard *.v)
SRC_MODULES = \
behav.v \
struct.v


TESTBENCH = counter_tb.v

DUMPFILE = $(TESTBENCH)cd
DUMPFILE_NAME = '"$(DUMPFILE)"'

all: $(COMPILER_OUTPUT) $(DUMPFILE)

$(COMPILER_OUTPUT): $(SRC_MODULES) $(TESTBENCH)
	$(CC) $(FLAGS) -DDUMPFILE=$(DUMPFILE_NAME) -o $@ $(SRC_MODULES) $(TESTBENCH) 

$(DUMPFILE): $(COMPILER_OUTPUT)
	$(VVP) $<

gtk: all
	$(GTKWAVE) $(DUMPFILE) --save=$(GTKSAVEFILE)

clean:
	rm -f $(COMPILER_OUTPUT) $(DUMPFILE) 

.PHONY: clean wave gtk all