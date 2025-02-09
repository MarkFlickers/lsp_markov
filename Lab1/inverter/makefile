CC = iverilog
VVP = vvp
GTKWAVE = gtkwave

FLAGS = -Wall -Winfloop

COMPILER_OUTPUT = out

BUILD_DIR = build

#SRC_MODULES += $(wildcard *.v)
SRC_MODULES = \
inverter.v \
inverter_delay.v

TESTBENCH = inv_tb.v

DUMPFILE = $(TESTBENCH)cd
DUMPFILE_NAME = '"$(DUMPFILE)"'

all: $(COMPILER_OUTPUT) $(DUMPFILE)

$(COMPILER_OUTPUT): $(SRC_MODULES)
	$(CC) $(FLAGS) -DDUMPFILE=$(DUMPFILE_NAME) -o $@ $(SRC_MODULES) $(TESTBENCH) 

$(DUMPFILE): $(COMPILER_OUTPUT)
	$(VVP) $<

gtk: all
	$(GTKWAVE) $(DUMPFILE)

clean:
	rm -f $(COMPILER_OUTPUT) $(DUMPFILE)

.PHONY: clean wave gtk all