@echo off
ml.exe /c /Cp /Zi Hello.asm && ^
link.exe /subsystem:windows,5.1 ^
    /out:HelloWorld.exe ^
    /map:HelloWorld.map ^
    /debug ^
    /nxcompat ^
    /version:1.0 ^
    /manifest:embed,id=1 ^
    /manifestinput:../shared/Hello.manifest ^
    Hello.obj kernel32.lib user32.lib
