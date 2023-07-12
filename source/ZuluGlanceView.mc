import Toybox.Graphics;
import Toybox.WatchUi;

import Toybox.System;
import Toybox.Time.Gregorian;
import Toybox.Time;
import Toybox.Math;

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
        
        
        //Get the current Zulu Date
        var dateString = Lang.format("$1$, $2$ $3$", 
            [zTime.day_of_week,
            zTime.day,
            zTime.month]);

        //Get the Julian Date
        var jTime = Gregorian.utcInfo(Time.now(), Time.FORMAT_SHORT);
        var A;
        var B;
        var C;
        var E;
        var F;
        var JD;
        var Y = jTime.year;
        var M = jTime.month;
        var D = jTime.day;
        var JDTime; 
        var jDayCount = 0;

        A = Math.floor(Y/100);
        B = Math.floor(A/4);
        C = Math.floor(2-A+B);
        E = Math.floor(365.25 * (Y+4716));
        F = Math.floor(30.6001 * (M+1));
        JD = C+D+E+F-1524.5;
        JDTime = "Jul Date: "+Lang.format("$1$", [JD.format("%01.1f")]);

        //Figure Julian Daye (YY followed by what number of the year it is (1-365))
        //Inspiration provided by MESURF88
        var nonLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
        var leapYear= [31,29,31,30,31,30,31,31,30,31,30,31];

        if (jTime.year % 4 == 0) {
            var i;
            for (i =0; i < (jTime.month - 1); i++ ) {
                jDayCount = jDayCount + nonLeapYear[i];
            }
            jDayCount = jDayCount + jTime.day;
        } else {
            var i;
            for (i =0; i < (jTime.month - 1); i++ ) {
                jDayCount = jDayCount + leapYear[i];
            }
            jDayCount = jDayCount + jTime.day;
        }

        //get a 2 digit year
        var yrMod = jTime.year - 2000;
        //create julian day
        var jDayDisp = "Jul Day: "+Lang.format("$1$", [yrMod.format("%01d")])+Lang.format("$1$", [jDayCount.format("%01d")]);


        //Determine Offset labeling
        if(lTime.timeZoneOffset >= 0) {
            myOffset = "Local = Z +"+lTime.timeZoneOffset/3600;
        } else {
            myOffset = "Local = Z "+lTime.timeZoneOffset/3600;
        }

        //Draw Screen Time
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.40, Graphics.FONT_LARGE, zuluTime, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.5, Graphics.FONT_SYSTEM_XTINY, myOffset, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.1, Graphics.FONT_SYSTEM_XTINY, "Z Date", Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.2, Graphics.FONT_TINY, dateString, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.75, Graphics.FONT_SYSTEM_XTINY, JDTime, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth() / 2,dc.getHeight() * 0.65, Graphics.FONT_SYSTEM_XTINY, jDayDisp, Graphics.TEXT_JUSTIFY_CENTER);
    }

}
