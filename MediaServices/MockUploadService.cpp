#include "MockUploadService.h"

MockUploadService::MockUploadService(QObject *parent)
    : QObject(parent)
{
}

Upload* MockUploadService::createUpload()
{
    return new Upload(this);
}

void MockUploadService::uploadTextPost(Upload* upload)
{
    Q_UNUSED(upload)
    emit uploadSuccess();
}

void MockUploadService::uploadMediaPost(Upload* upload)
{
    const QString mediaType = upload ? upload->mediaType() : QStringLiteral("media");
    const QString mediaUrl = upload ? upload->mediaUrl() : QStringLiteral("qrc:/images/Resources/thumbnail.jpg");
    emit mediaUploadProgress(100);
    emit mediaUploadFinished(mediaUrl, mediaType);
    emit uploadSuccess();
}

void MockUploadService::upload(Upload* upload)
{
    uploadMediaPost(upload);
}
