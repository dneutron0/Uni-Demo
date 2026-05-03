cmake_minimum_required(VERSION 3.16)

project(UniDemo VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

if(COMMAND qt_policy)
    qt_policy(SET QTP0004 NEW)
endif()

file(GLOB_RECURSE QML_FILES
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/Auth/*.qml"
    "${CMAKE_CURRENT_SOURCE_DIR}/Core/*.qml"
    "${CMAKE_CURRENT_SOURCE_DIR}/Shared/*.qml"
)

list(APPEND QML_FILES Main.qml)

qt_add_executable(appUniDemo
    main.cpp
)

qt_add_qml_module(appUniDemo
    URI Uni
    VERSION 1.0

    QML_FILES
        ${QML_FILES}

    RESOURCES
        images.qrc

    SOURCES
        AuthenticationServices/AuthManager.h
        AuthenticationServices/AuthManager.cpp
        AuthenticationServices/MockAuthService.h
        AuthenticationServices/MockAuthService.cpp
        MediaServices/GalleryManager.h
        MediaServices/GalleryManager.cpp
        MediaServices/MediaFeedModel.h
        MediaServices/MediaFeedModel.cpp
        MediaServices/MockUploadService.h
        MediaServices/MockUploadService.cpp
        MediaServices/Upload.h
        MediaServices/Upload.cpp
        MediaServices/UploadManager.h
        MediaServices/UploadManager.cpp
        MediaServices/UtilityManager.h
        MediaServices/UtilityManager.cpp
        MessageServices/ConversationManager.h
        MessageServices/ConversationManager.cpp
        UserServices/ProfileModel.h
        UserServices/ProfileModel.cpp
        UserServices/User.h
        UserServices/User.cpp
        UserServices/UserManager.h
        UserServices/UserManager.cpp
)

target_link_libraries(appUniDemo
    PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Multimedia
)

set_target_properties(appUniDemo PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if(ANDROID)
    set_property(TARGET appUniDemo PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_SOURCE_DIR}/android")
endif()

qt6_import_qml_plugins(appUniDemo)

include(GNUInstallDirs)
install(TARGETS appUniDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
