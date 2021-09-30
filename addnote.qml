import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

Item {
    property var stack
    property  string name : "addnote"
    anchors.fill: parent
    ColumnLayout{
        spacing: 10
        anchors.fill :parent
        TextField {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth:  true
            id:title
            placeholderText: "Titulo"
        }
        Flickable {
            id:flickable
            Layout.fillHeight: true
            Layout.fillWidth: true
            flickableDirection: Flickable.VerticalFlick

            TextArea.flickable: TextArea {
                id: note
                placeholderText: "Descrição"
                wrapMode: TextArea.Wrap
            }

            ScrollBar.vertical: ScrollBar {
                visible: true
            }

        }
    }
}
