import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;

class steps_to_moon_glanceView extends WatchUi.GlanceView {
    
        private var stepCount = 0;
        private var stepsToMoon = 1008923520;
        private var stepsLeft = 0;
        private var myText;
    
    
        function initialize() {
            GlanceView.initialize();
        }
    
        // Load your resources here
        function onLayout(dc as Dc) as Void {
        }
    
        function onShow() as Void {
            var info = ActivityMonitor.getInfo();
            stepCount = info.steps;
    
            System.println("Current steps: " + stepCount);
            stepsLeft = stepsToMoon - stepCount;
    
            myText = new WatchUi.Text({
                :text => stepsLeft.toString() + " steps",
                :color => Graphics.COLOR_WHITE,
                :font => Graphics.FONT_TINY,
                :locX => LAYOUT_HALIGN_CENTER,
                :locY => LAYOUT_VALIGN_CENTER
            });
    
            System.println(WatchUi.LAYOUT_VALIGN_CENTER);
        }
    
        // Update the view
        function onUpdate(dc as Dc) as Void {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.clear();
            myText.draw(dc);
        }
        
        function onHide() as Void {
        }
}