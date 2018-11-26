using Toybox.WatchUi;

class WeightNumberPickerDelegate extends WatchUi.NumberPickerDelegate {
    var notify;
    function initialize(handler) {
        NumberPickerDelegate.initialize();
        notify=handler;
    }

    function onNumberPicked(value) {
       notify.invoke(value);
    }
}
