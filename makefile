MAKE = make

all: lab1 lab2 lab3 lab4

lab1:
	$(MAKE) -C Lab1

lab2:
	$(MAKE) -C Lab2

lab3:
	$(MAKE) -C Lab3
 
lab4:
	$(MAKE) -C Lab4

clean:
	$(MAKE) clean -C Lab1
	$(MAKE) clean -C Lab2
	$(MAKE) clean -C Lab3
	$(MAKE) clean -C Lab4

.PHONY: lab1 lab2 lab3 lab4 clean