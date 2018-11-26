//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Application as App;

class WeightApp extends App.AppBase {
    hidden var mView;
    var kg;

    function initialize() {
        App.AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

   function setKg(x) {
      kg=x;
      Application.getApp().setProperty("kg",kg);
   }

  function getKg(){
    kg=Application.getApp().getProperty("kg");
    if (kg==null) {
       kg=80;
    }
    return kg;
  }

    // Return the initial view of your application here
    function getInitialView() {
        mView = new WeightView(getKg());
        return [mView, new WeightDelegate(mView.method(:onReceive))];
    }
}
