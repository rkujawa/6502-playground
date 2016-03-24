AS=vasm6502_std
LD=vlink

all: echo_irq

echo_irq: echo_irq.o
	$(LD) -M -brawbin1 -T symon.ld -o echo_irq.rom echo_irq.o

echo_irq.o:
	$(AS) -Fvobj -o echo_irq.o echo_irq.s

clean:
	rm -f *.o *.rom 

