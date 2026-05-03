#ifndef MEDIAFEEDMODEL_H
#define MEDIAFEEDMODEL_H

#include <QAbstractListModel>

class MediaFeedModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit MediaFeedModel(QObject *parent = nullptr);

    enum Roles {
        TypeRole = Qt::UserRole + 1,
        UsernameRole,
        DisplayNameRole,
        CaptionRole,
        ContentRole, // This represents the text in a Post upload
        MediaUrlRole,
        LikeCountRole,
        CommentCountRole,
        TimestampRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    struct FeedItem {
        QString type;
        QString username;
        QString displayName;
        QString caption;
        QString content;
        QString mediaUrl;
        int likeCount = 0;
        int commentCount = 0;
        QString timestamp;
    };

    QVector<FeedItem> m_items;
};

#endif // MEDIAFEEDMODEL_H
