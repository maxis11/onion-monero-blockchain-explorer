find_path(RANDOMX_INCLUDE_DIR NAMES randomx.h)
find_library(RANDOMX_LIBRARY NAMES librandomx.a randomx librandomx)
set(RANDOMX_LIBRARIES ${RANDOMX_LIBRARY})
set(RANDOMX_INCLUDE_DIRS ${RANDOMX_INCLUDE_DIR})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RANDOMX DEFAULT_MSG RANDOMX_LIBRARY RANDOMX_INCLUDE_DIR)

if(NOT TARGET RandomX::RandomX)
    add_library(RandomX::RandomX INTERFACE IMPORTED)
endif()

# Assign target properties
set_property(TARGET RandomX::RandomX
             PROPERTY INTERFACE_LINK_LIBRARIES
             ${RANDOMX_LIBRARY})
set_property(TARGET RandomX::RandomX
             PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             ${RANDOMX_INCLUDE_DIR})