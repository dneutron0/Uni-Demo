#include "ConversationManager.h"

#include <QUuid>

ConversationManager::ConversationManager(QObject *parent)
    : QObject(parent)
{
}

void ConversationManager::sendMessage(const QString &otherUserId, const QString &text)
{
    Q_UNUSED(otherUserId)
    if (text.trimmed().isEmpty()) {
        emit sendMessageFailed(QStringLiteral("Message cannot be empty."));
        return;
    }

    emit sendMessageSucceeded(QUuid::createUuid().toString(QUuid::WithoutBraces));
}
