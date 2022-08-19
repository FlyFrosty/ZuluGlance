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
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLUE);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        //Format Zulu Time
        var zTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_MEDIUM);
        var zuluTime = Lang.format("$1$:$2$", [zTime.hour.format("%02d"), zTime.min.format("%02d")])+" Zulu";

        //Draw Zulu Time
        dc.drawText(dc.getWidth() / 2,dc.getHeight() / 2, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

    }

}
