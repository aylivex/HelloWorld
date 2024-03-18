@echo off
ml64.exe /c /Cp /Zi Hello.asm && ^
link.exe /subsystem:windows,6.0 ^
    /out:HelloWorld64.exe ^
    /map:HelloWorld64.map ^
    /debug ^
    /nxcompat ^
    /version:1.0 ^
    /manifest:embed,id=1 ^
    /manifestinput:../shared/Hello.manifest ^
    /entry:main ^
    Hello.obj kernel32.lib user32.lib
