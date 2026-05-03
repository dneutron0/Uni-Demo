#ifndef UPLOAD_H
#define UPLOAD_H

#include <QObject>
#include <QString>

class Upload : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString authorId READ authorId WRITE setAuthorId NOTIFY authorIdChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString content READ content WRITE setContent NOTIFY contentChanged)
    Q_PROPERTY(QString mediaUrl READ mediaUrl WRITE setMediaUrl NOTIFY mediaUrlChanged)
    Q_PROPERTY(QString mediaType READ mediaType WRITE setMediaType NOTIFY mediaTypeChanged)
    Q_PROPERTY(int likeCount READ likeCount WRITE setLikeCount NOTIFY likeCountChanged)
    Q_PROPERTY(int commentCount READ commentCount WRITE setCommentCount NOTIFY commentCountChanged)
    Q_PROPERTY(QString timestamp READ timestamp WRITE setTimestamp NOTIFY timestampChanged)

public:
    explicit Upload(QObject* parent = nullptr);

    // Getters
    QString id() const                { return m_id; }
    QString authorId() const          { return m_authorId; }
    QString username() const          { return m_username; }
    QString title() const             { return m_title; }
    QString content() const             { return m_content; }
    QString mediaUrl() const          { return m_mediaUrl; }
    QString mediaType() const         { return m_mediaType; }
    int likeCount() const             { return m_likeCount; }
    int commentCount() const          { return m_commentCount; }
    QString timestamp() const         { return m_timestamp; }

    // Setters
    void setId(const QString& value);
    void setAuthorId(const QString& value);
    void setUsername(const QString& value);
    void setTitle(const QString& value);
    void setContent(const QString& value);
    void setMediaUrl(const QString& value);
    void setMediaType(const QString& value);
    void setLikeCount(int value);
    void setCommentCount(int value);
    void setTimestamp(const QString& value);

    // Logic
    Q_INVOKABLE void incrementLikes();
    Q_INVOKABLE void decrementLikes();

signals:
    void idChanged();
    void authorIdChanged();
    void usernameChanged();
    void titleChanged();
    void contentChanged();
    void mediaUrlChanged();
    void mediaTypeChanged();
    void likeCountChanged();
    void commentCountChanged();
    void timestampChanged();

private:
    QString m_id;
    QString m_authorId;
    QString m_username;
    QString m_title;
    QString m_content;
    QString m_mediaUrl;
    QString m_mediaType;

    int m_likeCount = 0;
    int m_commentCount = 0;

    QString m_timestamp;
};

#endif // UPLOAD_H
