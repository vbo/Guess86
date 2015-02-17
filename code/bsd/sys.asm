%macro sys.exit 1 ; status
    push dword %1
    sys._call 1
    ; NOTE: code here would not be executed anyway
    ; so we don't need to clean up stack
%endmacro

%macro sys.write 3 ; fd, chars, length
    push dword %3
    push dword %2
    push dword %1
    sys._call 0x04
    add esp, 16
%endmacro

%macro sys.read 3 ; fd, buf, length
    push dword %3
    push dword %2
    push dword %1
    sys._call 0x03
    add esp, 16
%endmacro

%macro sys._call 1
    mov eax, %1
    sub esp, 4
    int 0x80
%endmacro
