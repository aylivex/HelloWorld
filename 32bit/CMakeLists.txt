project("Hello World 32bit" LANGUAGES ASM_MASM)

set(SOURCE_FILES Hello.asm)

source_group("Source files" FILES ${SOURCE_FILES})

add_executable("HelloWorld" WIN32 ${SOURCE_FILES})

target_link_libraries("HelloWorld" PRIVATE
        "kernel32.lib"
        "user32.lib")

target_link_options("HelloWorld" PRIVATE
        /subsystem:windows,5.1
        /nxcompat
        /safeseh:no
        /version:1.0
        /manifest:embed,id=1
        /manifestinput:../../shared/Hello.manifest
        /entry:main)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        #target_compile_options(${PROJECT_NAME} PRIVATE /Zi)
        target_compile_options("HelloWorld" PRIVATE /Zi)
endif()
