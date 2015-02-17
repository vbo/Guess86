org 0x100 ; DOS will always start execution here
jmp main

%macro sys.exit 1 ; status
    mov al, %1
    sys._call 0x4C
%endmacro

%macro sys.write 3 ; fd, buf, length
    mov bx, %1
    mov dx, %2
    mov cx, %3
    sys._call 0x40
%endmacro

%macro sys.read 3 ; fd, buf, length
    mov bx, %1
    mov dx, %2
    mov cx, %3
    sys._call 0x3F
%endmacro

%macro sys._call 1
    mov ah, %1
    int 0x21
%endmacro

