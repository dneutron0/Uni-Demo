#include "UploadManager.h"

UploadManager& UploadManager::instance()
{
    static UploadManager manager;
    return manager;
}

UploadManager::UploadManager(QObject* parent)
    : MockUploadService(parent)
{
}
