#include "MediaFeedModel.h"

MediaFeedModel::MediaFeedModel(QObject *parent)
    : QAbstractListModel(parent)
{
    seedDemoData();
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
        return {};
    }

    const FeedItem &item = m_items.at(index.row());

    switch (role) {
    case TypeRole:
        return item.type;
    case AuthorRole:
        return item.author;
    case HandleRole:
        return item.handle;
    case AvatarColorRole:
        return item.avatarColor;
    case TitleRole:
        return item.title;
    case CaptionRole:
        return item.caption;
    case BodyRole:
        return item.body;
    case MediaKindRole:
        return item.mediaKind;
    case MediaUrlRole:
        return item.mediaUrl;
    case ThumbnailUrlRole:
        return item.thumbnailUrl;
    case AccentColorRole:
        return item.accentColor;
    case LikeCountRole:
        return item.likeCount;
    case CommentCountRole:
        return item.commentCount;
    case TimeAgoRole:
        return item.timeAgo;
    case LikedRole:
        return item.liked;
    case BookmarkedRole:
        return item.bookmarked;
    default:
        return {};
    }
}

QHash<int, QByteArray> MediaFeedModel::roleNames() const
{
    return {
        { TypeRole, "type" },
        { AuthorRole, "author" },
        { HandleRole, "handle" },
        { AvatarColorRole, "avatarColor" },
        { TitleRole, "title" },
        { CaptionRole, "caption" },
        { BodyRole, "body" },
        { MediaKindRole, "mediaKind" },
        { MediaUrlRole, "mediaUrl" },
        { ThumbnailUrlRole, "thumbnailUrl" },
        { AccentColorRole, "accentColor" },
        { LikeCountRole, "likeCount" },
        { CommentCountRole, "commentCount" },
        { TimeAgoRole, "timeAgo" },
        { LikedRole, "liked" },
        { BookmarkedRole, "bookmarked" }
    };
}

void MediaFeedModel::refreshDemoData()
{
    beginResetModel();
    seedDemoData();
    endResetModel();
}

void MediaFeedModel::addMockPost(const QString &title, const QString &body)
{
    const int insertAt = 0;
    beginInsertRows({}, insertAt, insertAt);
    m_items.prepend({
        "post",
        "Alex Morgan",
        "@alexm",
        "#3b82f6",
        title.trimmed().isEmpty() ? "New Uni post" : title.trimmed(),
        "",
        body.trimmed().isEmpty() ? "Created through the demo compose overlay and inserted into the Media feed." : body.trimmed(),
        "text",
        "",
        "",
        "#e0f2fe",
        0,
        0,
        "now",
        false,
        false
    });
    endInsertRows();
}

void MediaFeedModel::toggleLike(int row)
{
    if (row < 0 || row >= m_items.count()) {
        return;
    }

    FeedItem &item = m_items[row];
    item.liked = !item.liked;
    item.likeCount += item.liked ? 1 : -1;

    const QModelIndex changed = index(row, 0);
    emit dataChanged(changed, changed, { LikeCountRole, LikedRole });
}

void MediaFeedModel::toggleBookmark(int row)
{
    if (row < 0 || row >= m_items.count()) {
        return;
    }

    m_items[row].bookmarked = !m_items[row].bookmarked;

    const QModelIndex changed = index(row, 0);
    emit dataChanged(changed, changed, { BookmarkedRole });
}

void MediaFeedModel::seedDemoData()
{
    m_items = {
        {
            "media",
            "Uni Creators",
            "@creators",
            "#14b8a6",
            "Course preview",
            "Short-form lesson media for a CS subtopic. The demo keeps playback local and sanitized.",
            "",
            "video",
            "",
            "qrc:/assets/campus-photo.svg",
            "#ccfbf1",
            128,
            18,
            "12m",
            false,
            true
        },
        {
            "post",
            "Maya Chen",
            "@maya",
            "#f97316",
            "Graph traversal review",
            "",
            "Can someone check my BFS notes before I publish them to Learn? I added examples for disconnected graphs.",
            "text",
            "",
            "",
            "#ffedd5",
            34,
            9,
            "42m",
            true,
            false
        },
        {
            "photo",
            "Alex Morgan",
            "@alexm",
            "#8b5cf6",
            "",
            "Profile gallery item shared from the Media surface, using a bundled placeholder instead of private uploads.",
            "",
            "photo",
            "",
            "qrc:/assets/campus-photo.svg",
            "#ede9fe",
            86,
            13,
            "1h",
            false,
            false
        },
        {
            "post",
            "Uni Discover",
            "@discover",
            "#111827",
            "Trending categories",
            "",
            "Trending, Live, Music, Movies + TV, creators, and courses are represented as local mock cards in Discover.",
            "text",
            "",
            "",
            "#e5e7eb",
            57,
            6,
            "2h",
            false,
            true
        }
    };
}
