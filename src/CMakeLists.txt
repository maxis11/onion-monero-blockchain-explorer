cmake_minimum_required(VERSION 3.0.2)

project(myxrm)

set(SOURCE_HEADERS
        MicroCore.h
		tools.h
		monero_headers.h
		CurrentBlockchainStatus.h)

configure_file("${PROJECT_SOURCE_DIR}/version.h.in" "${PROJECT_BINARY_DIR}/include/version.h")

set(SOURCE_FILES
		MicroCore.cpp
		tools.cpp
		CmdLineOptions.cpp
		page.h
		rpccalls.cpp rpccalls.h
        CurrentBlockchainStatus.cpp 
        MempoolStatus.cpp 
        MempoolStatus.h)

add_subdirectory(crypto)


# make static library called libmyxrm
# that we are going to link to
# in the root CMakeLists.txt file
add_library(myxrm
		STATIC
		${SOURCE_FILES})

target_include_directories(myxrm PUBLIC "${PROJECT_BINARY_DIR}/include")

target_link_libraries(myxrm mycrypto)

