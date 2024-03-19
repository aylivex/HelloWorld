    extern MessageBoxW              : proc

    extern GetModuleHandleW         : proc
    extern ExitProcess              : proc

    extern RegisterClassW           : proc
    extern CreateWindowExW          : proc
    extern ShowWindow               : proc
    extern UpdateWindow             : proc

    extern BeginPaint               : proc
    extern EndPaint                 : proc
    extern DefWindowProcW           : proc
    extern GetMessageW              : proc
    extern DispatchMessageW         : proc
    extern TranslateMessage         : proc
    extern PostQuitMessage          : proc

    extern LoadCursorW              : proc
    extern LoadIconW                : proc
    extern LoadStringW              : proc

    extern TextOutW                 : proc


include windows.inc
include win64.inc


.data?

hInst           dq              ?           ; hInstance
hWnd            dq              ?           ; hWnd

paintStruct     PAINTSTRUCT     <?>         ; Painting structure

msg             MSGSTRUCT       <?>         ; Message structure

.data

wndClass    WNDCLASS    < CS_HREDRAW OR CS_VREDRAW, 0, offset WndProc, 0, 0, 0, 0, 0, COLOR_WINDOW + 1, 0, offset szWindowClass >

.const

szWindowClass   dw  'H', 'e', 'l', 'l', 'o',
                    'A', 's', 'm',
                    0
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
    sub     rsp, 20h            ; Shadow space
    sub     rsp, 60h            ; Parameters for CreateWindow

    xor     rcx, rcx
    call    GetModuleHandleW

    mov     [hInst], rax        ; Save hInstance

    mov     [wndClass.hInstance], rax

    ; Load standard app icon as the window icon
    xor     rcx, rcx        ; NULL
    mov     rdx, IDI_APPLICATION
    call    LoadIconW
    mov     [wndClass.hIcon], rax

    ; Cursor for the window
    xor     rcx, rcx        ; NULL
    mov     rdx, IDC_ARROW
    call    LoadCursorW
    mov     [wndClass.hCursor], rax

    lea     rcx, offset wndClass
    call    RegisterClassW          ; Register window class

    or      rax, rax
    jz      displaymessage

    xor     rcx, rcx                    ; dwExStyle
    mov     rdx, offset szWindowClass   ; lpClassName
    mov     r8, offset caption          ; lpWindowName
    mov     r9, WS_OVERLAPPEDWINDOW     ; dwStyle
    mov     r10, CW_USEDEFAULT
    mov     [rsp + 20h], r10            ; x = CW_USEDEFAULT
    mov     [rsp + 28h], r10            ; y = CW_USEDEFAULT (ignored)
    mov     [rsp + 30h], r10            ; width  = CW_USEDEFAULT
    mov     [rsp + 38h], r10            ; height = CW_USEDEFAULT (ignored)
    xor     rax, rax
    mov     [rsp + 40h], rax            ; hWndParent = NULL (0)
    mov     [rsp + 48h], rax            ; hMenu = NULL (0)
    mov     rbx, [hInst]
    mov     [rsp + 50h], rbx            ; hInstance
    mov     [rsp + 58h], rax            ; lpParam = NULL (0)
    call    CreateWindowExW

    mov     [hWnd], rax

    mov     rcx, rax
    mov     rdx, 1; SW_SHOWNORMAL
    call    ShowWindow

    mov     rcx, [hWnd]
    call    UpdateWindow

msg_loop:
    mov     rcx, offset msg
    xor     rdx, rdx
    mov     r8, rdx
    mov     r9, rdx
    call    GetMessageW

    cmp     rax, 0
    je      end_loop

    mov     rcx, offset msg
    call    TranslateMessage

    mov     rcx, offset msg
    call    DispatchMessageW

    jmp     msg_loop

end_loop:
        mov     rcx, [msg.wParam]
        call    ExitProcess             ; Terminate the process


displaymessage:
    ; MessageBox(NULL, message, caption, 0);
    xor     rcx, rcx                ; NULL
    mov     rdx, offset message
    mov     r8,  offset caption
    mov     r9,  40h                ; 0 = MB_OK | MB_ICONINFORMATION
    call    MessageBoxW

    ; ExitProcess(0)
    mov     rcx, rax
    call    ExitProcess
main endp

align 8
WndProc proc
    ; hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD
    ; rcx         rdx         r8            r9

    ; Align stack and allocate shadow space
    sub     rsp, 28h

    cmp     rdx, WM_DESTROY
    je      wmdestroy
    cmp     rdx, WM_PAINT
    je      wmpaint
;    cmp     rcx, WM_PRINTCLIENT
;    je      wmprintclient

    jmp     defwndproc              ; Call default window procedure

wmpaint:        ; Painting the window
    mov     [rsp + 20h], rcx
    mov     rdx, offset paintStruct
    call    BeginPaint              ; Get HDC in eax

    mov     rcx, [rsp + 20h]
    mov     rdx, offset paintStruct
    call    EndPaint                ; Release HDC

    xor     rax, rax                ; Return code for WM_PAINT
    jmp     finish

wmprintclient:

defwndproc:     ; Unhandled messages
    ; push    [lparam]
    ; push    [wparam]
    ; push    [wmsg]
    ; push    [hwnd]
    call    DefWindowProcW          ; Default handling
    jmp     finish

wmdestroy:      ; Destroy the window and exit the message loop
    xor     rcx, rcx
    call    PostQuitMessage

    xor     rax, rax

finish:
    add     rsp, 28h
    ret
WndProc endp

end
