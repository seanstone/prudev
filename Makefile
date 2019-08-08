BUILD = build
SRC = $(wildcard pru-software-support-package/examples/am335x/PRU_Halt/*.c)
OBJ = $(addprefix build/,$(addsuffix .o,$(SRC)))
ELF = PRU_Halt.elf

include pru-common.mk