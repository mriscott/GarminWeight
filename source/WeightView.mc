//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi as Ui;
using Toybox.Graphics;

class WeightView extends Ui.View {
    hidden var mMessage = "Loading";
    hidden var mModel;
    var factor=2.20462;

    function initialize(x) {
        Ui.View.initialize();
        setKg(x);
    }

    // Load your resources here
    function onLayout(dc) {
    }

    // Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    function onReceive(x){
      System.println("Received "+x);
      setKg(x/1609.343994);
      
    }
    
    function setLb(lb){
       System.println("SetLb:"+lb);
       setKg(lb/factor);
    }

    function setKg(kg){
       if(kg==null) {
          return;
       }
       Application.getApp().setKg(kg);
       System.println("SetKg:"+kg);
       var lb=Math.round(kg*factor).toLong();
       var st=(lb/14).toLong();
       var stlb=(lb-(st*14)).toLong();
       mMessage=kg.format("%.1f")+"kg\n"+lb+ "lb\n"+st+"st "+stlb+"lb" ;
    }


    // Update the view
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, mMessage, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of your app here.
    function onHide() {
    }

}
