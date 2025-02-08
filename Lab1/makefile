MAKE = make
GTK =


ifeq (gtk, $(filter gtk,$(MAKECMDGOALS)))
#ifeq ($1, gtk)
	GTK = gtk
endif

all: inverter dff 2nand dffr

gtk:

inverter:
	$(MAKE) $(GTK) -C inverter

dff:
	$(MAKE) $(GTK) -C flip_flop
 
2nand:
	$(MAKE) $(GTK) -C 2nand
 
dffr:
	$(MAKE) $(GTK) -C flip_flop_reset

clean:
	$(MAKE) clean -C inverter
	$(MAKE) clean -C flip_flop
	$(MAKE) clean -C 2nand
	$(MAKE) clean -C flip_flop_reset

.PHONY: all gtk inverter dff 2nand dffr clean