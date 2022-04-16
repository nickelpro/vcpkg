vcpkg_from_github(
  OUT_SOURCE_PATH ZTD_CMAKE_PATH
  REPO soasis/cmake
  REF 4277edaf7bf237de07c4a9833f6546872ab9f151
  SHA512 f05143068a1f22bd46aa0d8c250afb04b29ffbc0f32d746093bfb61f274d0e212ff9786a5163608097ed989b5b212d73811179f311a37d2b2eedce89cc75ee94
  HEAD_REF main
)

vcpkg_from_github(
  OUT_SOURCE_PATH ZTD_IDK_PATH
  REPO soasis/idk
  REF 5ebf7d6357d214d55f877d1ede3efde7f0debc39
  SHA512 712d76b73a5df25240b1736302cc740d178685dca454974a4853ca5621fd5d8e42c7c776cf14a64d6d8bb56a06839447d55542baf202557ec402ad9957fb517b
  HEAD_REF main
)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO soasis/text
  REF cec4c9a0887f20072a4506a2415482308c8a185b
  SHA512 57df8db74f1cdb901e82683b48a409d2eb4a4c03d23ef69db659affc60353289011980a66612de7fecdbf51b97ff9e646fd4a5f35f4348a9cba6212908a2dc2b
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    -DFETCHCONTENT_SOURCE_DIR_ZTD.CMAKE=${ZTD_CMAKE_PATH}
    -DFETCHCONTENT_SOURCE_DIR_ZTD.IDK=${ZTD_IDK_PATH}
)
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
