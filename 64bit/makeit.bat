@echo off
ml64.exe /c /Cp /FlHello.lst /Zi Hello.asm && ^
rc /dBITS_64 /fo HelloWorld64.res ..\shared\Hello.rc && ^
link.exe /subsystem:windows,6.0 ^
    /out:HelloWorld64.exe ^
    /map:HelloWorld64.map ^
    /debug ^
    /nxcompat ^
    /version:1.0 ^
    /manifest:embed,id=1 ^
    /manifestinput:../shared/Hello.manifest ^
    /entry:main ^
    Hello.obj HelloWorld64.res kernel32.lib user32.lib gdi32.lib
