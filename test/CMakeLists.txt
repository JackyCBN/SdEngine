# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(SdEngineTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(SdEngine_test source/SdEngine_test.cpp)
target_link_libraries(
    SdEngine_test PRIVATE
    SdEngine_lib
    Catch2::Catch2WithMain
)
target_compile_features(SdEngine_test PRIVATE cxx_std_17)

catch_discover_tests(SdEngine_test)

# ---- End-of-file commands ----

add_folders(Test)
