#ifndef MODELPROXY_H
#define MODELPROXY_H

#include <QObject>
#include <QAbstractItemModel>

class ModelProxy : public QAbstractItemModel
{
    Q_OBJECT
private:
     QHash<int, QByteArray> myRoles;
public:
     QHash<int, QByteArray> roleNames() const override;
      QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    explicit ModelProxy(QObject *parent = nullptr);

signals:

};

#endif // MODELPROXY_H
