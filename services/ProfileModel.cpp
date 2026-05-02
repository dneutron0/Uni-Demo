#include "ProfileModel.h"

ProfileModel::ProfileModel(QObject *parent)
    : QObject(parent)
{
}

QString ProfileModel::campus() const
{
    return "North Campus";
}

QString ProfileModel::major() const
{
    return "Computer Science";
}

int ProfileModel::posts() const
{
    return 24;
}

int ProfileModel::followers() const
{
    return 418;
}

int ProfileModel::saved() const
{
    return 37;
}
