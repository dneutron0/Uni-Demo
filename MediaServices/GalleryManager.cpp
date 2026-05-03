#include "GalleryManager.h"

GalleryManager::GalleryManager(QObject *parent)
    : QObject(parent)
{
}

void GalleryManager::openCameraRoll()
{
    emit mediaSelected(QStringLiteral("qrc:/images/Resources/test-image.jpg"));
}

QString GalleryManager::resolveUriToFilePath(const QString &uri) const
{
    return uri;
}
