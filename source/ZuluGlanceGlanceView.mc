using Toybox.WatchUi;
using Toybox.Graphics;

import Toybox.Time.Gregorian;
import Toybox.Time;

(:glance)
class ZuluGlanceGlanceView extends WatchUi.GlanceView {
	
    function initialize() {
      GlanceView.initialize();
    }
    
    function onUpdate(dc) {

        //Draw ZuluTime

        var zTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_MEDIUM);
        var zuluTime = Lang.format("$1$:$2$", [zTime.hour.format("%02d"), zTime.min.format("%02d")])+" Z";

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(0,dc.getHeight() / 2, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
