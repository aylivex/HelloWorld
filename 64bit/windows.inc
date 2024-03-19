; Class styles
CS_VREDRAW          EQU     0001h
CS_HREDRAW          EQU     0002h
CS_DBLCLKS          EQU     0008h
CS_OWNDC            EQU     0020h
CS_CLASSDC          EQU     0040h
CS_PARENTDC         EQU     0080h
CS_NOCLOSE          EQU     0200h
CS_SAVEBITS         EQU     0800h
CS_BYTEALIGNCLIENT  EQU     1000h
CS_BYTEALIGNWINDOW  EQU     2000h
CS_GLOBALCLASS      EQU     4000h

;                           WinNT 5.1
CS_DROPSHADOW       EQU     00020000h

; Window styles
WS_OVERLAPPED       EQU     00000000h
WS_POPUP            EQU     80000000h
WS_CHILD            EQU     40000000h
WS_MINIMIZE         EQU     20000000h
WS_VISIBLE          EQU     10000000h
WS_DISABLED         EQU     08000000h
WS_CLIPSIBLINGS     EQU     04000000h
WS_CLIPCHILDREN     EQU     02000000h
WS_MAXIMIZE         EQU     01000000h
WS_CAPTION          EQU     00C00000h
WS_BORDER           EQU     00800000h
WS_DLGFRAME         EQU     00400000h
WS_VSCROLL          EQU     00200000h
WS_HSCROLL          EQU     00100000h
WS_SYSMENU          EQU     00080000h
WS_THICKFRAME       EQU     00040000h
WS_GROUP            EQU     00020000h
WS_TABSTOP          EQU     00010000h

WS_MINIMIZEBOX      EQU     00020000h
WS_MAXIMIZEBOX      EQU     00010000h

; Common window styles
WS_OVERLAPPEDWINDOW EQU WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX
WS_POPUPWINDOW      EQU WS_POPUP OR WS_BORDER OR WS_SYSMENU
WS_CHILDWINDOW      EQU WS_CHILD


CW_USEDEFAULT       EQU     80000000h


; ShowWindow commands
SW_HIDE             EQU     0
SW_SHOWNORMAL       EQU     1
SW_NORMAL           EQU     1
SW_SHOWMINIMIZED    EQU     2
SW_SHOWMAXIMIZED    EQU     3
SW_MAXIMIZE         EQU     3
SW_SHOWNOACTIVATE   EQU     4
SW_SHOW             EQU     5
SW_MINIMIZE         EQU     6
SW_SHOWMINNOACTIVE  EQU     7
SW_SHOWNA           EQU     8
SW_RESTORE          EQU     9
SW_SHOWDEFAULT      EQU     10
SW_FORCEMINIMIZE    EQU     11
SW_MAX              EQU     11


; Icon IDs
IDI_APPLICATION     EQU     32512
IDI_HAND            EQU     32513
IDI_ERROR           EQU     IDI_HAND
IDI_QUESTION        EQU     32514
IDI_EXCLAMATION     EQU     32515
IDI_WARNING         EQU     IDI_EXCLAMATION
IDI_ASTERISK        EQU     32516
IDI_INFORMATION     EQU     IDI_ASTERISK
IDI_WINLOGO         EQU     32517


; Cursor IDs
IDC_ARROW           EQU     32512
IDC_IBEAM           EQU     32513
IDC_WAIT            EQU     32514
IDC_CROSS           EQU     32515
IDC_UPARROW         EQU     32516
IDC_SIZENWSE        EQU     32642
IDC_SIZENESW        EQU     32643
IDC_SIZEWE          EQU     32644
IDC_SIZENS          EQU     32645
IDC_SIZEALL         EQU     32646
IDC_NO              EQU     32648
IDC_HAND            EQU     32649
IDC_APPSTARTING     EQU     32650
IDC_HELP            EQU     32651


; Colors
COLOR_SCROLLBAR                 EQU     0
COLOR_BACKGROUND                EQU     1
COLOR_ACTIVECAPTION             EQU     2
COLOR_INACTIVECAPTION           EQU     3
COLOR_MENU                      EQU     4
COLOR_WINDOW                    EQU     5
COLOR_WINDOWFRAME               EQU     6
COLOR_MENUTEXT                  EQU     7
COLOR_WINDOWTEXT                EQU     8
COLOR_CAPTIONTEXT               EQU     9
COLOR_ACTIVEBORDER              EQU     10
COLOR_INACTIVEBORDER            EQU     11
COLOR_APPWORKSPACE              EQU     12
COLOR_HIGHLIGHT                 EQU     13
COLOR_HIGHLIGHTTEXT             EQU     14
COLOR_BTNFACE                   EQU     15
COLOR_BTNSHADOW                 EQU     16
COLOR_GRAYTEXT                  EQU     17
COLOR_BTNTEXT                   EQU     18
COLOR_INACTIVECAPTIONTEXT       EQU     19
COLOR_BTNHIGHLIGHT              EQU     20

COLOR_3DDKSHADOW                EQU     21
COLOR_3DLIGHT                   EQU     22
COLOR_INFOTEXT                  EQU     23
COLOR_INFOBK                    EQU     24

COLOR_HOTLIGHT                  EQU     26
COLOR_GRADIENTACTIVECAPTION     EQU     27
COLOR_GRADIENTINACTIVECAPTION   EQU     28
COLOR_MENUHILIGHT               EQU     29
COLOR_MENUBAR                   EQU     30

COLOR_DESKTOP                   EQU     COLOR_BACKGROUND
COLOR_3DFACE                    EQU     COLOR_BTNFACE
COLOR_3DSHADOW                  EQU     COLOR_BTNSHADOW
COLOR_3DHIGHLIGHT               EQU     COLOR_BTNHIGHLIGHT
COLOR_3DHILIGHT                 EQU     COLOR_BTNHIGHLIGHT
COLOR_BTNHILIGHT                EQU     COLOR_BTNHIGHLIGHT


; Window messages
WM_NULL             EQU     0000h
WM_CREATE           EQU     0001h
WM_DESTROY          EQU     0002h
WM_MOVE             EQU     0003h
WM_SIZE             EQU     0005h
WM_SETFOCUS         EQU     0007h
WM_KILLFOCUS        EQU     0008h
WM_ENABLE           EQU     000Ah
WM_PAINT            EQU     000Fh
WM_QUIT             EQU     0012h
WM_SYSCOLORCHANGE   EQU     0015h
WM_SHOWWINDOW       EQU     0018h

WM_INITDIALOG       EQU     0110h
WM_COMMAND          EQU     0111h
WM_SYSCOMMAND       EQU     0112h

WM_PRINTCLIENT      EQU     0318h

WM_DPICHANGED       EQU     02E0h
WM_DPICHANGED_BEFOREPARENT  EQU     02E2h
WM_DPICHANGED_AFTERPARENT   EQU     02E3h
WM_GETDPISCALEDSIZE         EQU     02E4h

WM_USER             EQU     0400h


; Windows structures

POINT struct
    ptX                     dd          ?
    ptY                     dd          ?
POINT ends

RECT struct
    rcLeft                  dd          ?
    rcTop                   dd          ?
    rcRight                 dd          ?
    rcBottom                dd          ?
RECT ends
