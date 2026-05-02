#include "MockUploadService.h"

#include <QtGlobal>

MockUploadService::MockUploadService(QObject *parent)
    : QObject(parent)
{
    m_timer.setInterval(120);
    connect(&m_timer, &QTimer::timeout, this, [this]() {
        setProgress(m_progress + 12);
        if (m_progress >= 100) {
            m_timer.stop();
            setProgress(100);
            setUploading(false);
            emit uploadFinished(m_pendingTitle, m_pendingBody);
            m_pendingTitle.clear();
            m_pendingBody.clear();
        }
    });
}

bool MockUploadService::uploading() const
{
    return m_uploading;
}

int MockUploadService::progress() const
{
    return m_progress;
}

void MockUploadService::startMockUpload(const QString &title, const QString &body)
{
    if (m_uploading) {
        return;
    }

    m_pendingTitle = title;
    m_pendingBody = body;
    setProgress(0);
    setUploading(true);
    m_timer.start();
}

void MockUploadService::cancel()
{
    if (!m_uploading) {
        return;
    }

    m_timer.stop();
    setUploading(false);
    setProgress(0);
    m_pendingTitle.clear();
    m_pendingBody.clear();
}

void MockUploadService::setUploading(bool uploading)
{
    if (m_uploading == uploading) {
        return;
    }

    m_uploading = uploading;
    emit uploadingChanged();
}

void MockUploadService::setProgress(int progress)
{
    const int bounded = qBound(0, progress, 100);
    if (m_progress == bounded) {
        return;
    }

    m_progress = bounded;
    emit progressChanged();
}
