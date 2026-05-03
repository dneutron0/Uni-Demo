#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QVariant>

#include "AuthenticationServices/AuthManager.h"
#include "MediaServices/GalleryManager.h"
#include "MediaServices/MediaFeedModel.h"
#include "MediaServices/Upload.h"
#include "MediaServices/UploadManager.h"
#include "MediaServices/UtilityManager.h"
#include "MessageServices/ConversationManager.h"
#include "UserServices/User.h"
#include "UserServices/UserManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    UtilityManager utilityManager;
    UserManager userManager;
    GalleryManager galleryManager;
    ConversationManager conversationManager;

    AuthManager::instance().setUserManager(&userManager);

    QQmlApplicationEngine engine;

    qmlRegisterType<User>("Uni", 1, 0, "User");
    qmlRegisterType<Upload>("Uni", 1, 0, "Upload");
    qmlRegisterType<MediaFeedModel>("Uni", 1, 0, "MediaFeedModel");

    qmlRegisterSingletonInstance("Uni", 1, 0, "AuthManager", &AuthManager::instance());
    qmlRegisterSingletonInstance("Uni", 1, 0, "UploadManager", &UploadManager::instance());
    qmlRegisterSingletonInstance("Uni", 1, 0, "UserManager", &userManager);

    app.setProperty("galleryManager", QVariant::fromValue(static_cast<QObject *>(&galleryManager)));

    utilityManager.setObjectName("utilityManager");
    engine.rootContext()->setContextProperty("utilityManager", &utilityManager);
    engine.rootContext()->setContextProperty("GalleryManager", &galleryManager);
    engine.rootContext()->setContextProperty("ConversationManager", &conversationManager);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("Uni", "Main");

    return app.exec();
}
