#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString uid READ uid WRITE setUid NOTIFY uidChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString fullName READ fullName WRITE setFullName NOTIFY fullNameChanged)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString bio READ bio WRITE setBio NOTIFY bioChanged)
    Q_PROPERTY(QString profilePictureUrl READ profilePictureUrl WRITE setProfilePicture NOTIFY profilePictureChanged)
    Q_PROPERTY(QString profileCoverImageUrl READ profileCoverImageUrl WRITE setProfileCoverImage NOTIFY profileCoverImageChanged)
    Q_PROPERTY(QString location READ location WRITE setLocation NOTIFY locationChanged)
    Q_PROPERTY(QString dateJoined READ dateJoined WRITE setDateJoined NOTIFY dateJoinedChanged)
    Q_PROPERTY(int followersCount READ followersCount WRITE setFollowersCount NOTIFY followersCountChanged)
    Q_PROPERTY(int followingCount READ followingCount WRITE setFollowingCount NOTIFY followingCountChanged)


public:
    explicit User(QObject* parent = nullptr);

    // Basic user data
    QString uid() const { return m_uid; }
    QString email() const { return m_email; }
    QString fullName() const { return m_fullName; }
    QString username() const { return m_username; }

    QString bio() const { return m_bio; }
    QString profilePictureUrl() const { return m_profilePictureUrl; }
    QString profileCoverImageUrl() const { return m_profileCoverImageUrl; }

    QString location() const { return m_location; }
    QString dateJoined() const { return m_dateJoined; }

    // User Metrics
    int followersCount() const { return m_followersCount; }
    int followingCount() const { return m_followingCount; }


    void setUid(const QString& value) {
        if (m_uid != value) { m_uid = value; emit uidChanged(); }
    }
    void setEmail(const QString& value) {
        if (m_email != value) { m_email = value; emit emailChanged(); }
    }
    void setFullName(const QString& value) {
        if (m_fullName != value) { m_fullName = value; emit fullNameChanged(); }
    }
    void setUsername(const QString& value) {
        if (m_username != value) { m_username = value; emit usernameChanged(); }
    }
    void setBio(const QString& value) {
        if (m_bio != value) { m_bio = value; emit bioChanged(); }
    }

    void setProfilePicture(const QString& value) {
        if (m_profilePictureUrl != value) { m_profilePictureUrl = value; emit profilePictureChanged(); }
    }

    void setProfileCoverImage(const QString& value) {
        if (m_profileCoverImageUrl != value) { m_profileCoverImageUrl = value; emit profileCoverImageChanged(); }
    }

    void setLocation(const QString& value) {
        if (m_location != value) { m_location = value; emit locationChanged(); }
    }
    void setDateJoined(const QString& value) {
        if (m_dateJoined != value) { m_dateJoined = value; emit dateJoinedChanged(); }
    }
    void setFollowersCount(int value) {
        if (m_followersCount != value) {
            m_followersCount = value;
            emit followersCountChanged();
        }
    }

    void setFollowingCount(int value) {
        if (m_followingCount != value) {
            m_followingCount = value;
            emit followingCountChanged();
        }
    }

signals:
    void uidChanged();
    void emailChanged();
    void fullNameChanged();
    void usernameChanged();
    void bioChanged();
    void profilePictureChanged();
    void profileCoverImageChanged();
    void locationChanged();
    void dateJoinedChanged();
    void followersCountChanged();
    void followingCountChanged();

private:
    QString m_uid;
    QString m_email;
    QString m_fullName;
    QString m_username;
    QString m_bio;
    QString m_profilePictureUrl;
    QString m_profileCoverImageUrl;
    QString m_location;
    QString m_dateJoined;
    int m_followersCount = 0;
    int m_followingCount = 0;
};

#endif // USER_H
