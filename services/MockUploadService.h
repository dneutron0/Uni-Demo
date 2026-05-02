#pragma once

#include <QObject>
#include <QTimer>

class MockUploadService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool uploading READ uploading NOTIFY uploadingChanged)
    Q_PROPERTY(int progress READ progress NOTIFY progressChanged)

public:
    explicit MockUploadService(QObject *parent = nullptr);

    bool uploading() const;
    int progress() const;

    Q_INVOKABLE void startMockUpload(const QString &title, const QString &body);
    Q_INVOKABLE void cancel();

signals:
    void uploadingChanged();
    void progressChanged();
    void uploadFinished(const QString &title, const QString &body);

private:
    void setUploading(bool uploading);
    void setProgress(int progress);

    QTimer m_timer;
    bool m_uploading = false;
    int m_progress = 0;
    QString m_pendingTitle;
    QString m_pendingBody;
};
