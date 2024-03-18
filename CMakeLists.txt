cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project("Hello World"
#        VERSION 1.0.0.0
#        DESCRIPTION "Displays Hello World"
#        LANGUAGES ASM_MASM
)

if(${CMAKE_VS_PLATFORM_NAME} STREQUAL win32)
    add_subdirectory(32bit)
else()
    add_subdirectory(64bit)
endif()
#add_subdirectory(shared)
