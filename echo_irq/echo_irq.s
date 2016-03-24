; One of examples from Symon, rewritten for vasm

.set IOBASE,	0x8800
.set IOSTATUS,  IOBASE + 1
.set IOCMD,	IOBASE + 2
.set IOCTRL,	IOBASE + 3

.section "code","acrx"

start: 	cli 
        lda #0x09
	sta IOCMD      ; Set command status
        lda #0x1A
        sta IOCTRL     ; 0 stop bits, 8 bit word, 2400 baud

;
; Infinite idle loop, waiting for interrupt.
;
idle:   lda #0xFF
        tax 
idle1:  dex
        bne idle1 
        jmp idle

;
; IRQ handler
;
irq:    lda IOBASE      ; Get the character in the ACIA.
        pha		; Save accumulator
echo1:  lda IOSTATUS    ; Read the ACIA status
        and #0x10       ; Is the tx register empty?
        beq echo1	; No, wait for it to empty
        pla		; Otherwise, load saved accumulator,
        sta IOBASE      ; write to output,
        rti		; and return

.section "vectors","adrw"

.word   irq		; NMI vector
.word   start		; RESET vector
.word   irq		; IRQ vector

