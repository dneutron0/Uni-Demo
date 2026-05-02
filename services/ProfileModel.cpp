#include "ProfileModel.h"

ProfileModel::ProfileModel(QObject *parent)
    : QObject(parent)
{
}

QString ProfileModel::campus() const
{
    return "Creator profile";
}

QString ProfileModel::major() const
{
    return "Computer Science path";
}

int ProfileModel::posts() const
{
    return 18;
}

int ProfileModel::followers() const
{
    return 214;
}

int ProfileModel::saved() const
{
    return 42;
}
