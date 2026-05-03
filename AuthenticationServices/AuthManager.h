#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QString>

class User;
class UserManager;

class AuthManager : public QObject
{
    Q_OBJECT

public:
    static AuthManager& instance();

    void setUserManager(UserManager *userManager);

    Q_INVOKABLE void registerNewUser(const QString &email,
                                     const QString &password,
                                     const QString &fullName,
                                     const QString &username);
    Q_INVOKABLE void signInUser(const QString &email, const QString &password);
    Q_INVOKABLE void signOutUser();

signals:
    void registrationSucceeded();
    void registrationFailed(const QString &reason);
    void signInSucceeded(User* user);
    void signInFailed(const QString &errorMessage);
    void signOutSucceeded();

private:
    explicit AuthManager(QObject *parent = nullptr);
    Q_DISABLE_COPY(AuthManager)

    User *createDemoUser(const QString &email,
                         const QString &fullName = QStringLiteral("Maya Chen"),
                         const QString &username = QStringLiteral("@maya"));

    UserManager *m_userManager = nullptr;
};

#endif
