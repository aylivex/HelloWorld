.386
.model flat

    extern _MessageBoxA@16   : proc
    extern _ExitProcess@4    : proc

.const

message db 'Hello from Win32', 0
caption db 'Hello Assembly', 0

.code

_main:
    ; MessageBox(NULL, message, caption, 0);
    push    40h                 ; 0 = MB_OK | MB_ICONINFORMATION
    push    offset caption
    push    offset message
    push    0
    call    _MessageBoxA@16

    ; ExitProcess(0)
    push    0
    call    _ExitProcess@4

end _main
