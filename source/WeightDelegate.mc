//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;

class WeightDelegate extends Ui.BehaviorDelegate {
    var myPicker;
    var notify;

    function onMenu() {
        if (WatchUi has :NumberPicker) {
	    var kg=Application.getApp().getKg();
	    kg*=1609.343994;
	     System.println("Starting menu with "+kg);
            myPicker = new WatchUi.NumberPicker(
                WatchUi.NUMBER_PICKER_DISTANCE,
                kg
            );
            WatchUi.pushView(
                myPicker,
                new WeightNumberPickerDelegate(notify),
                WatchUi.SLIDE_IMMEDIATE
            );
        }
        return true;
    }

    function onSelect() {
        return onMenu();
    }
    


    // Set up the callback to the view
    function initialize(handler) {
        Ui.BehaviorDelegate.initialize();
        notify=handler;
    }

}
