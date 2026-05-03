#ifndef UPLOADMANAGER_H
#define UPLOADMANAGER_H

#include "MediaServices/MockUploadService.h"

class UploadManager : public MockUploadService
{
    Q_OBJECT

public:
    static UploadManager& instance();

private:
    explicit UploadManager(QObject* parent = nullptr);
    Q_DISABLE_COPY(UploadManager)
};

#endif
