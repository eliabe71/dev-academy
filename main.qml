import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12

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
    }
    footer: ToolBar{
        id : toolbarFooter
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
                toolbarFooter.visible = true
            }
         }
    }
}
