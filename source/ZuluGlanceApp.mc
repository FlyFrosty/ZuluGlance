import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class ZuluGlanceApp extends Application.AppBase {

    function getGlanceView() {
        return [ new ZuluGlanceGlanceView() ];
    }

    function initialize() {
        AppBase.initialize();
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new ZuluGlanceView() ];
    }

}

function getApp() as ZuluGlanceApp {
    return Application.getApp() as ZuluGlanceApp;
}