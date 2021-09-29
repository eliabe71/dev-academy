import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.3
Item {
    id : root
    property string name : "singup"
    property  bool popstack: false
    property var stack

    anchors.fill: parent
    ColumnLayout{
        function widthC(){
            if(parent.width >= 640){
                print(parent.width)
                return 250;
            }else {
                print(parent.width)
                return 280;
            }
        }

        spacing: 5
        anchors.centerIn: parent
        width:widthC()
        ColumnLayout{
            Layout.alignment: Qt.AlignCenter
            Layout.bottomMargin: 50
            Image {
                id: imgCad
                source: "/icons/cadrasto.png"
                sourceSize.width: 100
                sourceSize.height: 100
            }
        }
        ColumnLayout{
            Layout.bottomMargin: 50
            TextField{

                Layout.fillWidth : true
                placeholderText: "Nome"
            }
            TextField{

                Layout.fillWidth : true
                placeholderText: "Email"

            }
            TextField{

                Layout.fillWidth : true
                placeholderText: "Senha"
            }
            RowLayout {
                Layout.leftMargin:10

                Button {
                    text: "Cancelar"
                    onClicked: stack.push('qrc:/singup.qml', {'popstack': true , 'stack' : stack })
                }
                Button {

                    text: "Cadrastar"

                }
            }
        }
    }

}
