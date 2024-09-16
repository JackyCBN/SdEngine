install(
    TARGETS SdEngine_exe
    RUNTIME COMPONENT SdEngine_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
