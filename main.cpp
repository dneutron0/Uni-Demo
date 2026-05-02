#include <QGuiApplication>
#include <QCoreApplication>
#include <QQmlApplicationEngine>

#include "services/MediaFeedModel.h"
#include "services/MockAuthService.h"
#include "services/MockUploadService.h"
#include "services/ProfileModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MediaFeedModel mediaFeedModel;
    MockAuthService authService;
    MockUploadService uploadService;
    ProfileModel profileModel;

    qmlRegisterSingletonInstance("UniDemo", 1, 0, "MediaFeedModel", &mediaFeedModel);
    qmlRegisterSingletonInstance("UniDemo", 1, 0, "AuthService", &authService);
    qmlRegisterSingletonInstance("UniDemo", 1, 0, "UploadService", &uploadService);
    qmlRegisterSingletonInstance("UniDemo", 1, 0, "ProfileModel", &profileModel);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("UniDemo", "Main");

    return app.exec();
}
