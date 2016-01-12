if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR
    "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(warnings "-Wall -Wextra -Werror")
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set (SOURCE_FILES
)

set (HEADER_FILES
)

set (SHARED_LIB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set (SHARED_LIB_INCLUDE_DIR ${SHARED_LIB_INCLUDE_DIR} PARENT_SCOPE)

set (FRV_PATH /usr/local/lib/CMake/frverification CACHE PATH "Path of frverification library")

set (Boost_USE_STATIC_LIBS OFF)
set (Boost_USE_MULTITHREAD ON)
set (Boost_USE_STATIC_RUNTIME OFF)
set (BOOST_INCLUDEDIR /usr/include)

find_package(Boost)

if(Boost_FOUND)
  message(STATUS "Boost found!")
  include_directories(${Boost_INCLUDE_DIRS})
endif()

find_package(frverification PATHS ${FRV_PATH} NO_CMAKE_PACKAGE_REGISTRY NO_CMAKE_ENVIRONMENT_PATH)

if (frverification_FOUND)
  message(STATUS "Found FRVerification Library!")
  message(STATUS ${FRVERIFICATION_INCLUDE_DIRS})
  include_directories(${FRVERIFICATION_INCLUDE_DIRS})
endif()

set (CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -fPIC)

add_library(fric STATIC ${SOURCE_FILES})
