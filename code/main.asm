%include "sys.asm"

section .data

%assign NL 0xA

%macro static_string 2 ; name, bytes
    ; NOTE: this allocates memory for a string
    ; and also makes a constant name.length
    ; holding a string size
    %1 db %2
    %1.length equ $-%1
%endmacro

static_string heading, {"Welcome to Guess86, my friend!", NL, NL}
static_string winner, {"Winner!", NL}
static_string prompt, {"Enter a number [0,7]: "}
static_string too_low, {"Nope. It's too low!", NL}
static_string too_high, {"Nope. It's too high!", NL}

%assign input_buf_size 64
input_buf times input_buf_size db 0
rand db 0

%macro init_rand 0
    ; NOTE: this makes a "random"
    ; number from 0 to 7 using last 3 bits
    ; of current cycle count
    ; TODO: make a read RNG
    rdtsc
    and eax, 7
    mov [rand], al
%endmacro

section .text

global main

main:
    init_rand
    sys.write 1, heading, heading.length

retry_loop:
    sys.write 1, prompt, prompt.length
    sys.read 0, input_buf, input_buf_size
    mov al, byte [input_buf]
    sub al, '0'
    cmp al, [rand]
    je equal
    jg greater
    jmp less

equal:
    sys.write 1, winner, winner.length
    sys.exit 0

greater:
    sys.write 1, too_high, too_high.length
    jmp retry_loop

less:
    sys.write 1, too_low, too_low.length
    jmp retry_loop
