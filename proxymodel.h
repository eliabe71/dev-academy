#ifndef PROXYMODEL_H
#define PROXYMODEL_H
#include <QSortFilterProxyModel>
#include <QObject>
#include <QVariant>
class proxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
     proxyModel(QObject *parent = 0);
     QVariant filterUser();
     void setFilterUser(int id);
protected:
    bool filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const override;
    QVariant headerData(int section, Qt::Orientation orientation,int role) const override;
private :
    int id_user;
};

#endif // PROXYMODEL_H
