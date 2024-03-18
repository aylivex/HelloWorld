project("HelloWorld64" LANGUAGES ASM_MASM)

set(SOURCE_FILES Hello.asm)

source_group("Source files" FILES ${SOURCE_FILES})

add_executable("HelloWorld64" WIN32 ${SOURCE_FILES})

target_link_libraries("HelloWorld64" PRIVATE
        "kernel32.lib"
        "user32.lib")

target_link_options("HelloWorld64" PRIVATE
        /subsystem:windows,6.0
        /nxcompat
        /version:1.0
        /manifest:embed,id=1
        /manifestinput:../../shared/Hello.manifest
        /entry:main)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options("HelloWorld64" PRIVATE /Zi)
endif()
