if($ENV{CONAN_INSTALL})
    find_program(CONAN_TOOL_PATH conan)
    if(CONAN_TOOL_PATH)
        execute_process(COMMAND ${CONAN_TOOL_PATH} install -u ${CMAKE_CURRENT_SOURCE_DIR}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
    endif()
endif()
set(USE_CONAN false CACHE INTERNAL "")
if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    set(USE_CONAN true)
elseif(EXISTS ${CMAKE_SOURCE_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_SOURCE_DIR}/conanbuildinfo.cmake)
    set(USE_CONAN true)
endif()
if(USE_CONAN)
    cmake_minimum_required(VERSION 3.4) # Conan Boost package requires this
    set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/scripts/cmake/conan ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})
    message(STATUS "Using conan package manager")
    set(OGS_LIB_VTK System CACHE INTERNAL "")
    set(OGS_LIB_BOOST System CACHE INTERNAL "")
    set(OGS_LIB_EIGEN System CACHE INTERNAL "")
endif()
