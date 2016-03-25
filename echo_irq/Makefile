AS=vasm6502_std
ASFLAGS=-Fvobj
LD=vlink
LDFLAGS=-M -brawbin1

ROM=echo_irq.rom
OBJS=echo_irq.o
LDSCRIPT=symon.ld

all: $(ROM)

$(ROM): $(OBJS) $(LDSCRIPT)
	$(LD) $(LDFLAGS) -T $(LDSCRIPT) -o $(ROM) $(OBJS)

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f *.o *.rom 

