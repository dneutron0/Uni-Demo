#pragma once

#include <QObject>
#include <QString>

class ProfileModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString campus READ campus CONSTANT)
    Q_PROPERTY(QString major READ major CONSTANT)
    Q_PROPERTY(int posts READ posts CONSTANT)
    Q_PROPERTY(int followers READ followers CONSTANT)
    Q_PROPERTY(int saved READ saved CONSTANT)

public:
    explicit ProfileModel(QObject *parent = nullptr);

    QString campus() const;
    QString major() const;
    int posts() const;
    int followers() const;
    int saved() const;
};
