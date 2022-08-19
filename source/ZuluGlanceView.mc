import Toybox.Graphics;
import Toybox.WatchUi;

import Toybox.Time.Gregorian;
import Toybox.Time;

class ZuluGlanceView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));

        //Format Zulu Time
        var zTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_MEDIUM);
        var zuluTime = Lang.format("$1$:$2$", [zTime.hour.format("%02d"), zTime.min.format("%02d")])+" Z";

        //Draw Zulu Time
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(0,dc.getHeight() / 2, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    } 

    // Update the view
    function onUpdate(dc as Dc) as Void {

        //Format Zulu Time
        var zTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_MEDIUM);
        var zuluTime = Lang.format("$1$:$2$", [zTime.hour.format("%02d"), zTime.min.format("%02d")])+" Z";

        //Draw Zulu Time
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(0,dc.getHeight() / 2, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);

        View.onUpdate(dc);
    }

}
