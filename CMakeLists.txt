cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    SdEngine
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    SdEngine_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    SdEngine_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(SdEngine_lib PUBLIC cxx_std_17)

find_package(fmt REQUIRED)
target_link_libraries(SdEngine_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(SdEngine_exe source/main.cpp)
add_executable(SdEngine::exe ALIAS SdEngine_exe)

set_property(TARGET SdEngine_exe PROPERTY OUTPUT_NAME SdEngine)

target_compile_features(SdEngine_exe PRIVATE cxx_std_17)

target_link_libraries(SdEngine_exe PRIVATE SdEngine_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT SdEngine_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of SdEngine"
  )
endif()

include(cmake/dev-mode.cmake)
