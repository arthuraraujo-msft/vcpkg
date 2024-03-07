vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO microsoft/CorrelationVector-Cpp
    REF cf38d2b44baaf352509ad9980786bc49554c32e4
    SHA512 f97eaef649ffd010fb79bca0ae6cb7ce6792dcb38f6a5180d04dc6542589d0d727583455bbafb319982cfed1291384180d49c7f32ebe7560b444ec132c76d0c4
    HEAD_REF master
    PATCHES
        "correlation-vector.patch"
)

set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

#if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
#    set(USE_STATIC_CXX_RUNTIME ON CACHE BOOL FORCE)
#endif()

#set(CMAKE_CXX_FLAGS_DEBUG "")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# Handle usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

# Remove duplicated include files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
