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

        stack.push('qrc:/singup.qml', {'name':'singup' , 'stack' : stack })
        userModel.cancel()
    }

    StackView {
        id:stack
        visible: true
        anchors.fill : parent
        onCurrentItemChanged: {
            if(stack.currentItem.name =="singup" && stack.currentItem.popstack){
                stack.clear()
            }
        }
    }
}
