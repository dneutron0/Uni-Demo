#ifndef MOCKUPLOADSERVICE_H
#define MOCKUPLOADSERVICE_H

#include <QObject>
#include <QString>

#include "MediaServices/Upload.h"

class MockUploadService : public QObject
{
    Q_OBJECT

public:
    explicit MockUploadService(QObject *parent = nullptr);

    Q_INVOKABLE Upload* createUpload();
    Q_INVOKABLE void uploadTextPost(Upload* upload);
    Q_INVOKABLE void uploadMediaPost(Upload* upload);
    Q_INVOKABLE void upload(Upload* upload);

signals:
    void uploadSuccess();
    void uploadFailed(const QString &error);
    void mediaUploadProgress(int percent);
    void mediaUploadFinished(const QString& downloadUrl, const QString& mediaType);
    void mediaUploadFailed(const QString& error);
};

#endif
