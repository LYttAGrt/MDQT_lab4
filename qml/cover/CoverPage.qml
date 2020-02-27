import QtQuick 2.0
import Sailfish.Silica 1.0
import "../silica-browser.qml"

CoverBackground {
    id: coverBackground
    property bool canGoNext
    property bool canGoPrevious

    Label {
        id: label
        anchors.centerIn: parent.Center
        text: application.currentPageTitle
        elide: Text.ElideLeft
        wrapMode: Text.WordWrap
        maximumLineCount: 5
    }

    CoverAction {
        id: previous
        iconSource: coverBackground.canGoPrevious ? "image://theme/icon-cover-previous" : ""
        onTriggered: {if (application.canNavigateBack) application.navigateBack() }
     }

    CoverAction {
        id: next
        iconSource: coverBackground.canGoNext ? "image://theme/icon-cover-next" : ""
        onTriggered: {if (application.canNavigateForward) application.navigateForward() }
    }
}
