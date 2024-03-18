@echo off
ml.exe /c /Cp /Zi Hello.asm && ^
rc /dBITS_32 /fo Hello32.res ..\shared\Hello.rc && ^
link.exe /subsystem:windows,5.1 ^
    /out:HelloWorld.exe ^
    /map:HelloWorld.map ^
    /debug ^
    /nxcompat ^
    /version:1.0 ^
    /manifest:embed,id=1 ^
    /manifestinput:../shared/Hello.manifest ^
    Hello.obj Hello32.res kernel32.lib user32.lib
