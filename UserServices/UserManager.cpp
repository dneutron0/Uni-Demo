#include "UserManager.h"

UserManager::UserManager(QObject* parent)
    : QObject(parent)
{
    User *demoUser = new User(this);
    demoUser->setUid(QStringLiteral("demo-user-001"));
    demoUser->setEmail(QStringLiteral("demo@uni.local"));
    demoUser->setFullName(QStringLiteral("Maya Chen"));
    demoUser->setUsername(QStringLiteral("@maya"));
    demoUser->setBio(QStringLiteral("Biomedical engineering student. Creator, learner, and late-night lab regular."));
    demoUser->setProfilePicture(QStringLiteral("qrc:/images/Resources/test-image.jpg"));
    demoUser->setProfileCoverImage(QStringLiteral("qrc:/images/Resources/biomedical-engineering.jpg"));
    demoUser->setLocation(QStringLiteral("Chicago, IL"));
    demoUser->setDateJoined(QStringLiteral("Joined September 2025"));
    demoUser->setFollowersCount(284);
    demoUser->setFollowingCount(132);

    m_currentUser = demoUser;
    m_loginCheckComplete = true;
}

void UserManager::updateProfilePicture(const QString& localPath)
{
    if (m_currentUser) {
        m_currentUser->setProfilePicture(localPath);
    }
}

void UserManager::updateProfileBanner(const QString& localPath)
{
    if (m_currentUser) {
        m_currentUser->setProfileCoverImage(localPath);
    }
}

User* UserManager::getCurrentUser() const
{
    return m_currentUser;
}

bool UserManager::loginCheckComplete() const
{
    return m_loginCheckComplete;
}

void UserManager::setCurrentUser(User* user)
{
    if (m_currentUser == user) {
        return;
    }

    if (user && user->parent() == nullptr) {
        user->setParent(this);
    }

    m_currentUser = user;
    if (!m_loginCheckComplete) {
        m_loginCheckComplete = true;
        emit loginCheckCompleteChanged();
    }
    emit currentUserChanged();
}

void UserManager::handleAuthLogin(User* user)
{
    setCurrentUser(user);
}

void UserManager::handleSignOut()
{
    setCurrentUser(nullptr);
}

void UserManager::handleAuthLoginFailed(const QString& errorMessage)
{
    Q_UNUSED(errorMessage)
    if (!m_loginCheckComplete) {
        m_loginCheckComplete = true;
        emit loginCheckCompleteChanged();
    }
}
