CC = iverilog
VVP = vvp
GTKWAVE = gtkwave

FLAGS = -Wall -Winfloop

COMPILER_OUTPUT_NAME = out
DUMPFILE_NAME = dump.vcd

BUILD_DIR = build

#SRC_MODULES += $(wildcard *.v)
SRC_MODULES = \
inverter.v \
inverter_delay.v

TESTBENCH = inv_tb.v

all: compile wave

compile:
	$(CC) $(FLAGS) -o $(COMPILER_OUTPUT_NAME) $(SRC_MODULES)

wave: $(COMPILER_OUTPUT_NAME)
	$(VVP) $(COMPILER_OUTPUT_NAME)

gtk: compile wave
	$(GTKWAVE) $(DUMPFILE_NAME)

clean:
	rm -f $(COMPILER_OUTPUT_NAME) $(DUMPFILE_NAME)

.PHONY: clean compile wave gtk all