#ifndef GALLERYMANAGER_H
#define GALLERYMANAGER_H

#include <QObject>
#include <QString>

class GalleryManager : public QObject
{
    Q_OBJECT

public:
    explicit GalleryManager(QObject *parent = nullptr);

    Q_INVOKABLE void openCameraRoll();
    Q_INVOKABLE QString resolveUriToFilePath(const QString &uri) const;

signals:
    void mediaSelected(const QString &filePath);
    void mediaSelectionCanceled();
};

#endif
