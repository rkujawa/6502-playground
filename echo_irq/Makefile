AS=vasm6502_std
LD=vlink

ROM=echo_irq.rom
OBJS=echo_irq.o
LDSCRIPT=symon.ld

all: $(ROM)

$(ROM): $(OBJS) $(LDSCRIPT)
	$(LD) -M -brawbin1 -T $(LDSCRIPT) -o $(ROM) $(OBJS)

%.o : %.s
	$(AS) -Fvobj -o $@ $<

clean:
	rm -f *.o *.rom 

