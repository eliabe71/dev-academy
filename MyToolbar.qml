import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
ToolBar {
    property  var stack
    RowLayout{
        ToolButton{
           icon.source: "/icons/return.png"
           onClicked: stack.pop()
        }
        TextField{
            placeholderText: "Buscar"
        }
    }
}
