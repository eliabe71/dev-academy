import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
ToolBar {
    id: root
    property  var stack
    property  string magnifyclosesrc : "qrc:/icons/magnify-close.png"
    property  string magnifysrc : "qrc:/icons/magnify.png"
    property  string  buttongridsrc : "qrc:/icons/view-grid-outline.png"
    property  string  buttonlistsrc : "qrc:/icons/view-grid-rows.png"
    signal listbuttonClicked();
    signal buttonSaved();
    function offButtons(){
        search.visible = false
        magnify.visible = false
        savebutton.visible = true
        gridorlist.visible = false
    }
    function onButtons(){
        savebutton.visible = false
        magnify.visible = true
        gridorlist.visible = true
    }
    RowLayout{
//        anchors.verticalCenter: root.verticalCenter
        spacing: 10
        anchors.fill:parent
        Component.onCompleted: {
            console.log("width" + root.width)
            console.log("height" + root.height)
        }
        ToolButton{
            id : buttonreturn
           icon.source: "/icons/return.png"
           onClicked: stack.pop()

        }
        Rectangle{
            id:fillArea
            Layout.fillWidth: true

        }

        TextField{
            id: search
            visible: false
            Layout.fillWidth: true
           placeholderText: "Buscar"

         }
        ToolButton {
            id:savebutton
            icon.source: "/icons/save.png"
            visible:false
            text: "Salvar Nota"
             onClicked: stack.pop()
        }
        ToolButton{

             id: magnify
             icon.source: magnifysrc
//             sourceSize.width: 30  ; sourceSize.height: 30
             onClicked: {

                if(magnify.icon.source == magnifysrc){

                    magnify.icon.source = magnifyclosesrc
                    fillArea.width = 30
                    search.visible= true

                }
                else{
                    magnify.icon.source = magnifysrc
                    search.visible = false
                }
             }

        }
        ToolButton{
            id: gridorlist
            icon.source: buttonlistsrc
//             sourceSize.width: 30  ; sourceSize.height: 30
            onClicked: {

               if(gridorlist.icon.source == buttonlistsrc){

                   gridorlist.icon.source = buttongridsrc

               }
               else{
                   gridorlist.icon.source = buttonlistsrc

               }
               listbuttonClicked()
            }

       }
    }
}
