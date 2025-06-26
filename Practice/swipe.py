# SwipeLibrary.py

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class Swipe:

    def _get_driver(self):
        appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
        return appiumlib, appiumlib._current_application()

    @keyword("Swipe Popup")
    def swipe_popup(self, start_x, start_y, end_x, end_y, box_height=100, direction="left"):
        _, driver = self._get_driver()

        start_x = int(start_x)
        start_y = int(start_y)
        end_x = int(end_x)
        end_y = int(end_y)
        height = int(box_height)

        width = abs(start_x - end_x)
        left = min(start_x, end_x)
        top = start_y - height // 2
        percent = 1.0

        args = {
            "left": left,
            "top": top,
            "width": width,
            "height": height,
            "direction": direction,
            "percent": percent
        }

        driver.execute_script("mobile: swipeGesture", args)
