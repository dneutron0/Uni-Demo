#pragma once

#include <QObject>
#include <QString>

class MockAuthService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool loggedIn READ loggedIn NOTIFY loggedInChanged)
    Q_PROPERTY(QString displayName READ displayName NOTIFY displayNameChanged)
    Q_PROPERTY(QString handle READ handle NOTIFY displayNameChanged)

public:
    explicit MockAuthService(QObject *parent = nullptr);

    bool loggedIn() const;
    QString displayName() const;
    QString handle() const;

    Q_INVOKABLE void signIn(const QString &email, const QString &password);
    Q_INVOKABLE void continueAsDemoUser();
    Q_INVOKABLE void signOut();

signals:
    void loggedInChanged();
    void displayNameChanged();
    void loginSucceeded();
    void loginFailed(const QString &message);

private:
    void setDemoUser();

    bool m_loggedIn = false;
    QString m_displayName;
    QString m_handle;
};
