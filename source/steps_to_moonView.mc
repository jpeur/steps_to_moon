import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;

class steps_to_moonView extends WatchUi.View {

    private var stepCount = 0;
    private var stepsToMoon = 1008923520;
    private var stepsLeft = 0;

    private var myText;

    var moon;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        moon = WatchUi.loadResource(Rez.Drawables.MoonIcon);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        var info = ActivityMonitor.getInfo();
        stepCount = info.steps;

        System.println("Current steps: " + stepCount);
        stepsLeft = stepsToMoon - stepCount;

        myText = new WatchUi.Text({
            :text => "Steps left to the Moon\n " + stepsLeft.toString(),
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_SMALL,
            :locX => LAYOUT_HALIGN_CENTER,
            :locY => 125
        });

        System.println(WatchUi.LAYOUT_VALIGN_CENTER);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        myText.draw(dc);

        // because the moon is 100 x 100
        dc.drawBitmap(dc.getWidth()/2 - 50, dc.getHeight()/2 - 100, moon);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
