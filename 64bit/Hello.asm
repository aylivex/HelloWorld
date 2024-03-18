    extern MessageBoxW    : proc
    extern ExitProcess    : proc

.const

message     dw  'H', 'e', 'l', 'l', 'o',        ; Hello from Win64
                ' ', 'f', 'r', 'o', 'm',
                ' ', 'W', 'i', 'n', '6', '4',
                13,  10,
                041Fh, 0440h, 0438h, 0432h,     ; Привет из Win64
                0435h, 0442h, 0020h, 0438h,
                0437h, 0020h, 0057h, 0069h,
                006Eh, 0036h, 0034h,
                0

caption     dw  'H', 'e', 'l', 'l', 'o',
                ' ', '/', ' ',
                041Fh, 0440h, 0438h, 0432h,     ; Привет
                0435h, 0442h,
                ' ',
                'A', 's', 's', 'e', 'm', 'b', 'l', 'y',
                0

.code

main proc
    ; Align stack to 16 bytes
    ; (rsp comes unaligned because of return address pushed to stack
    ;  its address ends with 0x###8)
    sub     rsp, 8

    ; Allocate shadow space for function calls
    sub     rsp, 20h

    ; MessageBox(NULL, message, caption, 0);
    xor     rcx, rcx                 ; NULL
    mov     rdx, offset message
    mov     r8,  offset caption
    mov     r9,  40h                 ; 0 = MB_OK | MB_ICONINFORMATION
    call    MessageBoxW

    ; ExitProcess(0)
    mov     rcx, rax
    call    ExitProcess
main endp

end
