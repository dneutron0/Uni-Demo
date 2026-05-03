#ifndef UTILITYMANAGER_H
#define UTILITYMANAGER_H

#include <QObject>
#include <QString>

class UtilityManager : public QObject
{
    Q_OBJECT

public:
    explicit UtilityManager(QObject *parent = nullptr);

    Q_INVOKABLE bool isCameraPermissionGranted() const;
    Q_INVOKABLE void requestCameraPermission();
    Q_INVOKABLE QString saveToPublicPictures(const QString &sourcePath) const;

signals:
    void cameraPermissionGranted();
    void cameraPermissionDenied();
};

#endif
