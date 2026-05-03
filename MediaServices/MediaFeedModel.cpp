#include "MediaFeedModel.h"

MediaFeedModel::MediaFeedModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_items = {
        { QStringLiteral("photo"), QStringLiteral("@maya"), QStringLiteral("Maya Chen"), QStringLiteral("Late night study setup in the library."), QString(), QStringLiteral("qrc:/images/Resources/test-image.jpg"), 24, 6, QStringLiteral("22h") },
        { QStringLiteral("media"), QStringLiteral("@jordan"), QStringLiteral("Jordan Lee"), QStringLiteral("Quick clip from the robotics showcase."), QString(), QStringLiteral("qrc:/images/Resources/thumbnail.jpg"), 41, 9, QStringLiteral("18h") },
        { QStringLiteral("post"), QStringLiteral("@sam"), QStringLiteral("Sam Rivera"), QStringLiteral("Study Sess?"), QStringLiteral("Anyone in CS 240 want to review before Friday?"), QString(), 12, 4, QStringLiteral("2h") },
        { QStringLiteral("photo"), QStringLiteral("@noor"), QStringLiteral("Noor Patel"), QStringLiteral("Biomedical prototype notes from today's lab."), QString(), QStringLiteral("qrc:/images/Resources/biomedical-engineering2.jpg"), 58, 13, QStringLiteral("1d") }
    };
}

int MediaFeedModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return m_items.count();
}

QVariant MediaFeedModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_items.count()) {
        return QVariant();
    }

    const FeedItem &item = m_items.at(index.row());

    switch (role) {
    case TypeRole:
        return item.type;
    case UsernameRole:
        return item.username;
    case DisplayNameRole:
        return item.displayName;
    case CaptionRole:
        return item.caption;
    case ContentRole:
        return item.content;
    case MediaUrlRole:
        return item.mediaUrl;
    case LikeCountRole:
        return item.likeCount;
    case CommentCountRole:
        return item.commentCount;
    case TimestampRole:
        return item.timestamp;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> MediaFeedModel::roleNames() const
{
    return {
        { TypeRole, "type" },
        { UsernameRole, "username" },
        { DisplayNameRole, "displayName" },
        { CaptionRole, "caption" },
        { ContentRole, "content" },
        { MediaUrlRole, "mediaUrl" },
        { LikeCountRole, "likeCount" },
        { CommentCountRole, "commentCount" },
        { TimestampRole, "timestamp" }
    };
}
