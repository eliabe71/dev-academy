import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

Item {
    property var stack
    property string name : "addnote"
    property string titles
    property string desc
    property var idNote
    property  var modelNota
    property  int userid
    anchors.fill: parent
    function fill(){
        titles = title.text
        desc = note.text
    }
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

            Component.onDestruction: {
                var currentDate = new Date()
                var data = currentDate.toLocaleDateString(Qt.locale(), Locale.ShortFormat)
                var hora = currentDate.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)

                if( idNote ){
                    if(title.text && note.text)
                        modelNota.updateGrade(idNote,note.text,title.text,data+' '+hora, "red", userid)

                }else {
                    if(title.text && note.text)
                        modelNota.registerGrade(note.text,title.text,data+' '+hora,"red",userid);

                }

            }

        }

}
