import QtQuick 2.0
import Models  1.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property string name : "homeView"
    property  var stack
    property  int index :0
    property  int cont
    property  int cont2
    function alterGrid(){
        notegrid.delegate =comp1
        notegrid.visible = true
        list.visible = false
    }
    NotaDatabaseModel{
        id: notadata
    }
    ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }
    GridView{
        id: notegrid
        anchors.fill:  parent
        ScrollBar.vertical: ScrollBar {
            visible: true
        }
        visible: false
        model: fruitModel

    }
    ListView{
        spacing: 3
        id:list
        visible:true
        anchors.fill: parent
        model :fruitModel
        delegate: Rectangle{
            function ff(){
                if(fruitModel.get(index).name == "Apple"){
                    console.log("Cym" + list.count)
                    cont++
                    return false
                }
                else{
                    return true
                }
            }
             visible: ff()
             height: 50
             color: "red"
            width:parent.width-20

        }
        Component.onCompleted: console.log(list.currentIndex)

    }
    Component{
        id: comp1
//        visible : false
        Rectangle{
//            visible: nameV()
            id: rec
            color: "red"
            width:50 ; height : 50
//            Card{
//                id:card
//            }
        }
    }
    Component{
        id: comp2

            Rectangle{


                height: 50
                color: "red"
               width:parent.width-20
            }
    }
}
