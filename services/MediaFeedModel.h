#pragma once

#include <QAbstractListModel>
#include <QVector>

class MediaFeedModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        TypeRole = Qt::UserRole + 1,
        AuthorRole,
        HandleRole,
        AvatarColorRole,
        TitleRole,
        CaptionRole,
        BodyRole,
        MediaKindRole,
        MediaUrlRole,
        ThumbnailUrlRole,
        AccentColorRole,
        LikeCountRole,
        CommentCountRole,
        TimeAgoRole,
        LikedRole,
        BookmarkedRole
    };

    explicit MediaFeedModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void refreshDemoData();
    Q_INVOKABLE void addMockPost(const QString &title, const QString &body);
    Q_INVOKABLE void toggleLike(int row);
    Q_INVOKABLE void toggleBookmark(int row);

private:
    struct FeedItem {
        QString type;
        QString author;
        QString handle;
        QString avatarColor;
        QString title;
        QString caption;
        QString body;
        QString mediaKind;
        QString mediaUrl;
        QString thumbnailUrl;
        QString accentColor;
        int likeCount = 0;
        int commentCount = 0;
        QString timeAgo;
        bool liked = false;
        bool bookmarked = false;
    };

    void seedDemoData();

    QVector<FeedItem> m_items;
};
