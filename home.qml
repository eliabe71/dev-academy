import QtQuick 2.0
import Models  1.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Material.impl 2.12


Item {
    property var notadata
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


    GridView{
        id: notegrid
        anchors.fill:  parent
        ScrollBar.vertical: ScrollBar {
            visible: true
        }
        visible: false
        model: notadata

    }
    ListView{
        spacing: 3
        id:list
        visible:true
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: (5*parent.width/100)
        model :notadata
        ScrollBar.vertical: ScrollBar {
            visible: true
        }
        anchors.centerIn: Qt.AlignCenter
        delegate: Rectangle{
            ColumnLayout{
                anchors.fill: parent
                spacing: 3
                TextField{
                    Layout.fillWidth: true
                    Layout.maximumHeight: 35
                    Layout.leftMargin: 5
                    Layout.topMargin: 8
                    font :Font.Black
                    Text {


                        text: titulo
                        font.pointSize: 10; font.bold: true
                    }
                    readOnly: true
                }

                Text {
                    Layout.leftMargin: 5
                    Layout.fillHeight: true
                    id: name
                    text: desc
                    font.pointSize: 11
                }


            }


            layer.enabled: true
            layer.effect: ElevationEffect {
                elevation: 10
            }
            height:notegrid.height/3.7
            function corAlter(){
                if(!cor){

                    return "#303030"
                }
                else {
                    return cor
                }
            }
            color: corAlter()
            radius: 10
            width: parent.width-(8*parent.width/100)
            MouseArea{
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent;
                onClicked: stack.push('qrc:/addnote.qml', {'titles': titulo , 'desc':desc,
                                          'idNote':id ,'colorName':cor
                                          ,'modelNota':notadata, 'userid' :userModel.getId() ,'stack' : stack })

            }

        }


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
