#include "AuthManager.h"

#include "UserServices/User.h"
#include "UserServices/UserManager.h"

AuthManager& AuthManager::instance()
{
    static AuthManager manager;
    return manager;
}

AuthManager::AuthManager(QObject *parent)
    : QObject(parent)
{
}

void AuthManager::setUserManager(UserManager *userManager)
{
    m_userManager = userManager;
}

void AuthManager::registerNewUser(const QString &email,
                                  const QString &password,
                                  const QString &fullName,
                                  const QString &username)
{
    Q_UNUSED(password)
    User *user = createDemoUser(email, fullName, username);
    if (m_userManager) {
        m_userManager->setCurrentUser(user);
    }
    emit registrationSucceeded();
    emit signInSucceeded(user);
}

void AuthManager::signInUser(const QString &email, const QString &password)
{
    Q_UNUSED(password)
    User *user = createDemoUser(email);
    if (m_userManager) {
        m_userManager->setCurrentUser(user);
    }
    emit signInSucceeded(user);
}

void AuthManager::signOutUser()
{
    if (m_userManager) {
        m_userManager->setCurrentUser(nullptr);
    }
    emit signOutSucceeded();
}

User *AuthManager::createDemoUser(const QString &email,
                                  const QString &fullName,
                                  const QString &username)
{
    User *user = new User(this);
    user->setUid(QStringLiteral("demo-user-001"));
    user->setEmail(email.isEmpty() ? QStringLiteral("demo@uni.local") : email);
    user->setFullName(fullName.isEmpty() ? QStringLiteral("Maya Chen") : fullName);
    user->setUsername(username.isEmpty() ? QStringLiteral("@maya") : username);
    user->setBio(QStringLiteral("Biomedical engineering student. Creator, learner, and late-night lab regular."));
    user->setProfilePicture(QStringLiteral("qrc:/images/Resources/test-image.jpg"));
    user->setProfileCoverImage(QStringLiteral("qrc:/images/Resources/biomedical-engineering.jpg"));
    user->setLocation(QStringLiteral("Chicago, IL"));
    user->setDateJoined(QStringLiteral("Joined September 2025"));
    user->setFollowersCount(284);
    user->setFollowingCount(132);
    return user;
}
