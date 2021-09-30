#include "proxymodel.h"
#include <QSortFilterProxyModel>

proxyModel::proxyModel(QObject *parent) : QSortFilterProxyModel(parent)
{

}

QVariant proxyModel::filterUser()
{
    return this->id_user;
}

void proxyModel::setFilterUser(int id)
{
    this->id_user = id;
}

bool proxyModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    QModelIndex index =  sourceModel()->index(sourceRow,5, sourceParent);
    return (sourceModel()->data(index).toInt() == id_user);
}

QVariant proxyModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    return sourceModel()->headerData(section, orientation,role);
}
