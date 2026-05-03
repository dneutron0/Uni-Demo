#include "UtilityManager.h"

UtilityManager::UtilityManager(QObject *parent)
    : QObject(parent)
{
}

bool UtilityManager::isCameraPermissionGranted() const
{
    return true;
}

void UtilityManager::requestCameraPermission()
{
    emit cameraPermissionGranted();
}

QString UtilityManager::saveToPublicPictures(const QString &sourcePath) const
{
    return sourcePath;
}
