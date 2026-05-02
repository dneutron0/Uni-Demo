cmake_minimum_required(VERSION 3.16)

project(UniDemo VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

if(COMMAND qt_policy)
    qt_policy(SET QTP0004 NEW)
endif()

qt_add_executable(appUniDemo
    main.cpp
)

qt_add_qml_module(appUniDemo
    URI UniDemo
    VERSION 1.0

    QML_FILES
        Main.qml
        qml/AppShell.qml
        qml/AuthView.qml
        qml/ComposeView.qml
        qml/FeedView.qml
        qml/ProfileView.qml
        qml/components/InteractionBar.qml
        qml/components/MediaCard.qml
        qml/components/PhotoCard.qml
        qml/components/PostCard.qml
        qml/components/SectionHeader.qml
        qml/components/StatPill.qml

    RESOURCES
        resources.qrc

    SOURCES
        services/MediaFeedModel.h
        services/MediaFeedModel.cpp
        services/MockAuthService.h
        services/MockAuthService.cpp
        services/MockUploadService.h
        services/MockUploadService.cpp
        services/ProfileModel.h
        services/ProfileModel.cpp
)

target_link_libraries(appUniDemo
    PRIVATE
        Qt6::Quick
        Qt6::Multimedia
)

set_target_properties(appUniDemo PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS appUniDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
