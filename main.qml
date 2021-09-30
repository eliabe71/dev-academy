import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12
import Models 1.0
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true


    Material.theme: Material.dark

    Component.onCompleted:{

        stack.push('qrc:/login.qml', { 'stack' : stack })
        userModel.cancel()
    }
    header: MyToolbar{
        id: toolbar
        stack: stack
        onListbuttonClicked:{
            stack.currentItem.alterGrid()

        }
    }
    footer: ToolBar{
        id : toolbarFooter
        RowLayout{
            anchors.fill: parent
            ToolButton{
                Layout.alignment: Qt.AlignRight
                icon.source: "/icons/plusbutton.png"
                onClicked: {
                    console.log("aqui")

                    stack.push('qrc:/addnote.qml', { 'modelNota':notadata, 'userid' :userModel.getId() ,'stack' : stack })
                }
            }

        }
    }
    NotaDatabaseModel{
        id: notadata
    }
    StackView {
        id:stack
        visible: true
        anchors.fill : parent
        onCurrentItemChanged: {
            if(currentItem.name == "login" ){
                toolbar.visible = false
                toolbarFooter.visible = false
            }
            if(currentItem.name == "singup" ){
                toolbar.visible = false
                toolbarFooter.visible = false
            }
            if(currentItem.name == "homeView" ){
                toolbar.visible = true
                currentItem.notadata= notadata
                toolbarFooter.visible = true
                toolbar.onButtons()

            }
            if(currentItem.name == "addnote"){
                toolbar.offButtons()
//                currentItem.toolbar = toolbar
            }
         }
    }
}
