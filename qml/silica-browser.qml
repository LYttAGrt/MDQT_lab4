import QtQuick 2.6
import Sailfish.Silica 1.0
import "pages/BrowserPage.qml"
import "cover/CoverPage.qml"

ApplicationWindow {
    id: application

    property string currentPageTitle: initialPage.addressField.label
    property bool canNavigateBack: initialPage.webView.canGoBack
    property bool canNavigateForward: initialPage.webView.canGoForward
    
    signal navigateBack()
    signal navigateForward()

    initialPage: Qt.resolvedUrl("pages/BrowserPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    Component.onCompleted: {
        application.navigateBack.connect(initialPage.webView.goBack)
        application.navigateForward.connect(initialPage.webView.goForward)
    }
}
