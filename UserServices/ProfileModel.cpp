#include "ProfileModel.h"

ProfileModel::ProfileModel(QObject *parent)
    : QObject(parent)
{
}

QString ProfileModel::campus() const
{
    return QStringLiteral("University Demo Campus");
}

QString ProfileModel::major() const
{
    return QStringLiteral("Biomedical Engineering");
}

int ProfileModel::posts() const
{
    return 18;
}

int ProfileModel::followers() const
{
    return 284;
}

int ProfileModel::saved() const
{
    return 36;
}
