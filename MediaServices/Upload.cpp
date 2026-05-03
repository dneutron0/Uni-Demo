#include "Upload.h"

Upload::Upload(QObject* parent)
    : QObject(parent)
{
}

// ---------------- Getters & Setters ---------------- //

void Upload::setId(const QString& value) {
    if (m_id != value) {
        m_id = value;
        emit idChanged();
    }
}

void Upload::setAuthorId(const QString& value) {
    if (m_authorId != value) {
        m_authorId = value;
        emit authorIdChanged();
    }
}

void Upload::setUsername(const QString &value) {
    if (m_username != value) {
        m_username = value;
        emit usernameChanged();
    }
}


void Upload::setTitle(const QString& value) {
    if (m_title != value) {
        m_title = value;
        emit titleChanged();
    }
}

void Upload::setContent(const QString& value) {
    if (m_content != value) {
        m_content = value;
        emit contentChanged();
    }
}

void Upload::setMediaUrl(const QString& value) {
    if (m_mediaUrl != value) {
        m_mediaUrl = value;
        emit mediaUrlChanged();
    }
}

void Upload::setMediaType(const QString& value) {
    if (m_mediaType != value) {
        m_mediaType = value;
        emit mediaTypeChanged();
    }
}

void Upload::setLikeCount(int value) {
    if (m_likeCount != value) {
        m_likeCount = value;
        emit likeCountChanged();
    }
}

void Upload::setCommentCount(int value) {
    if (m_commentCount != value) {
        m_commentCount = value;
        emit commentCountChanged();
    }
}

void Upload::setTimestamp(const QString& value) {
    if (m_timestamp != value) {
        m_timestamp = value;
        emit timestampChanged();
    }
}

// ---------------- Logic ---------------- //

void Upload::incrementLikes() {
    setLikeCount(m_likeCount + 1);
}

void Upload::decrementLikes() {
    if (m_likeCount > 0)
        setLikeCount(m_likeCount - 1);
}
