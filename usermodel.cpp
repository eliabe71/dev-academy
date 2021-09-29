#include "usermodel.h"

QString userModel::getName()
{
    return this->name;
}

QString userModel::getEmail()
{
    return this->email;
}

void userModel::setEmail(QString email)
{   if(! this->email.compare(email)){
        this->email = email;
        emit emailChanged();
    }

}

void userModel::setName(QString name)
{
    if(! this->name.compare(name)){
        this->name = name;
        emit nameChanged();
    }
}

void userModel::registerInTheDatabase(QString email, QString name, QString senha)
{

    QSqlQuery query(db->database());
     query.prepare("INSERT INTO User (name, email, senha) VALUES (:name, :email , :senha)");
     query.bindValue(":name",name);
     query.bindValue(":email",email);
     query.bindValue(":senha",senha);
     if(query.exec()){
        qDebug()<< "entrou";
        query.prepare("SELECT id FROM User Where email = :email ");
        query.bindValue(":email", email);
        query.exec();
        query.first();
        this->id = query.value(0).toString();
        this->name = name;
        this->senha = senha;
        this->email = email;
     }

}


bool userModel::existsInDataBase(QString email)
{
     QSqlQuery query(db->database());
     query.prepare("SELECT COUNT(*) FROM User WHERE email=:email");
     query.bindValue(":email",email);
     query.exec();
     query.first();
     qDebug()<< query.value(0).toString();
     return query.value(0).toBool();
}

void userModel::cancel()
{
    qDebug()<<"Sorte";
}

userModel::userModel(QObject *parent , Database *database ): QObject(parent)
{
    this->db = database;
}
