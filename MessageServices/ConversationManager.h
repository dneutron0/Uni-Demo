#ifndef CONVERSATIONMANAGER_H
#define CONVERSATIONMANAGER_H

#include <QObject>
#include <QString>

class ConversationManager : public QObject
{
    Q_OBJECT

public:
    explicit ConversationManager(QObject *parent = nullptr);

    Q_INVOKABLE void sendMessage(const QString &otherUserId, const QString &text);

signals:
    void sendMessageSucceeded(const QString &conversationId);
    void sendMessageFailed(const QString &error);
};

#endif
