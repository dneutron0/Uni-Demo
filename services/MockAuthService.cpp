#include "MockAuthService.h"

MockAuthService::MockAuthService(QObject *parent)
    : QObject(parent)
{
}

bool MockAuthService::loggedIn() const
{
    return m_loggedIn;
}

QString MockAuthService::displayName() const
{
    return m_displayName;
}

QString MockAuthService::handle() const
{
    return m_handle;
}

void MockAuthService::signIn(const QString &email, const QString &password)
{
    if (email.trimmed().isEmpty() || password.trimmed().isEmpty()) {
        emit loginFailed("Enter any email and password to start the mock session.");
        return;
    }

    setDemoUser();
    emit loginSucceeded();
}

void MockAuthService::continueAsDemoUser()
{
    setDemoUser();
    emit loginSucceeded();
}

void MockAuthService::signOut()
{
    if (!m_loggedIn) {
        return;
    }

    m_loggedIn = false;
    m_displayName.clear();
    m_handle.clear();
    emit loggedInChanged();
    emit displayNameChanged();
}

void MockAuthService::setDemoUser()
{
    m_loggedIn = true;
    m_displayName = "Alex Morgan";
    m_handle = "@alexm";
    emit loggedInChanged();
    emit displayNameChanged();
}
