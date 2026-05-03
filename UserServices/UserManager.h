#ifndef USERMANAGER_H
#define USERMANAGER_H

#include <QObject>

#include "UserServices/User.h"

class UserManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(User* currentUser READ getCurrentUser NOTIFY currentUserChanged)
    Q_PROPERTY(bool loginCheckComplete READ loginCheckComplete NOTIFY loginCheckCompleteChanged)

public:
    explicit UserManager(QObject* parent = nullptr);

    Q_INVOKABLE void updateProfilePicture(const QString& localPath);
    Q_INVOKABLE void updateProfileBanner(const QString& localPath);

    User* getCurrentUser() const;
    bool loginCheckComplete() const;
    void setCurrentUser(User* user);

public slots:
    void handleAuthLogin(User* user);
    void handleSignOut();
    void handleAuthLoginFailed(const QString& errorMessage);

signals:
    void currentUserChanged();
    void loginCheckCompleteChanged();

private:
    User* m_currentUser = nullptr;
    bool m_loginCheckComplete = false;
};

#endif
