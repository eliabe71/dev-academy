#ifndef PROXYMODEL_H
#define PROXYMODEL_H
#include <QSortFilterProxyModel>
#include <QObject>

class proxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    explict proxyModel();

};

#endif // PROXYMODEL_H
