WNDCLASS struct
    style                   dd          ?   ; class style
                            dd          ?   ; padding for 8-byte alignment
    lpfnWndProc             dq          ?
    cbClsExtra              dd          ?
    cbWndExtra              dd          ?
    hInstance               dq          ?   ; instance handle
    hIcon                   dq          ?   ; class icon handle
    hCursor                 dq          ?   ; class cursor handle
    hbrBackground           dq          ?   ; class background brush
    lpszMenuName            dq          ?   ; menu name
    lpszClassName           dq          ?   ; far ptr to class name
WNDCLASS ends


MSGSTRUCT struct
    hWnd                    dq          ?
    message                 dd          ?
                            dd          ?   ; padding for 8-byte alignment
    wParam                  dq          ?
    lParam                  dq          ?
    Time                    dd          ?
    ptX                     dd          ?   ; part of POINT structure
    ptY                     dd          ?
                            dd          ?   ; pad for 8-byte alignment
MSGSTRUCT ends


PAINTSTRUCT struct
    hdc                     dq          ?   ; hdc
    fErase                  dd          ?
    rcLeft                  dd          ?   ; RECT structure
    rcTop                   dd          ?
    rcRight                 dd          ?
    rcBottom                dd          ?
    fRestore                dd          ?   ; reserved
    fIncUpdate              dd          ?   ; reserved
    rgbReserved             db          32 dup(?)
                            db          4  dup(?) ; pad for 16-bit align
PAINTSTRUCT ends
