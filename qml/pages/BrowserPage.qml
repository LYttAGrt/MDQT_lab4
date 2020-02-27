import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        id: column
        anchors.fill: parent

        Drawer {
            id: drawer
            height: parent.height * 6 / 7
            width: parent.width
            foreground: SilicaWebView{
                id: webView
                anchors.fill: parent
                url: "https://doc.qt.io/qt-5/qml-qtwebview-webview.html"
            }
            background: Row {
            id: buttonsRow
            anchors.fill: parent

            IconButton {
                height: parent.height
                width: parent.width / 3
                id: backButton
                icon.source: "image://theme/icon-m-back"
                enabled: webView.canGoBack ? true : false
                onClicked: {
                    if (backButton.enabled) webView.goBack()
                }
            }

            IconButton {
                id: reloadButton
                height: parent.height
                width: parent.width / 3
                icon.source: "image://theme/icon-m-reload"
                onClicked: {
                    webView.reload()
                }
            }

            IconButton {
                id: forwardButton
                height: parent.height
                width: parent.width / 3
                enabled: webView.canGoForward ? true : false
                icon.source: "image://theme/icon-m-forward"
                onClicked: {
                    if (forwardButton.enabled) webView.goForward()
                }
            }
        }
        }

        Row {
            id: searchRow
            height: parent.height / 7
            width: parent.width
            TextField {
                id: addressField
                anchors.fill: parent
                height: parent.height
                width: parent.width * 4 / 5
                validator: RegExpValidator {
                    id: regexValidator
                    // https://stackoverflow.com/questions/3809401/what-is-a-good-regular-expression-to-match-a-url
                    regExp: new RegExp("/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/")
                }
                label: (webView.loadProgress === 1) ? webView.title : "Loading ${webView.loadProgress}%"
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                EnterKey.enabled: validator.regExp.exactMatch ? true : false
                EnterKey.onClicked: {
                    webView.url = addressField.text
                }
            }
            IconButton {
                id: menuButton
                anchors.fill: parent
                height: parent.height
                width: parent.width / 5
                icon.source: "image://theme/icon-m-menu"

                property bool drawerBackgroundShow: false
                onClicked: {
                    drawerBackgroundShow = !drawerBackgroundShow
                    drawer.background.enabled = drawerBackgroundShow
                }
            }
        }
    }
}
