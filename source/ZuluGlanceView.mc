import Toybox.Graphics;
import Toybox.WatchUi;

import Toybox.System;
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
        var myOffset;

        //Format Zulu Time
        var zTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_MEDIUM);
        var zuluTime = Lang.format("$1$:$2$", [zTime.hour.format("%02d"), zTime.min.format("%02d")])+" Zulu";
        var lTime = System.getClockTime();
        var myDst = lTime.dst/3600;

        if(lTime.timeZoneOffset >= 0) {
            myOffset = "Local = Z +"+lTime.timeZoneOffset/3600;
        } else {
            myOffset = "Local = Z "+lTime.timeZoneOffset/3600;
        }

        //IN DST?
        var myDstDisp;
        if (lTime.hour + myDst == lTime.hour ) {
            myDstDisp = "In DST";
        } else {
            myDstDisp = "Not In DST";
        }


        //Draw Zulu Time
        dc.drawText(dc.getWidth() / 2,dc.getHeight() / 2, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.8, Graphics.FONT_TINY, myOffset, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.1, Graphics.FONT_TINY, myDstDisp, Graphics.TEXT_JUSTIFY_CENTER);
    }

}
