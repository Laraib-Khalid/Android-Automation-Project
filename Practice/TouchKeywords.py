# # from robot.api.deco import keyword
# # from appium.webdriver.common.touch_action import TouchAction
# # from robot.libraries.BuiltIn import BuiltIn
# #
# #
# # class TouchKeywords:
# #     @keyword("Long Press Element")
# #     def long_press(self, locator, duration=1000):
# #         # Get the Appium driver instance from AppiumLibrary
# #         appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
# #         driver = appiumlib._current_application()
# #
# #         # Get the WebElement using the locator
# #         element = appiumlib._element_find(locator, True, True)
# #
# #         # Perform long press
# #         actions = TouchAction(driver)
# #         actions.long_press(el=element, duration=duration).release().perform()
#
#
# from robot.api.deco import keyword
# from robot.libraries.BuiltIn import BuiltIn
#
#
# class TouchKeywords:
#     @keyword("Long Press Element")
#     def long_press_element(self, locator, duration=1000):
#         # Get AppiumLibrary and driver
#         appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
#         driver = appiumlib._current_application()
#
#         # Get element and element ID
#         element = appiumlib._element_find(locator, True, True)
#         element_id = element.id
#
#         # Create argument dictionary
#         args = {
#             "elementId": element_id,
#             "duration": int(duration)  # in milliseconds
#         }
#
#         # Execute the longClickGesture
#         driver.execute_script("mobile: longClickGesture", args)


from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

class TouchKeywords:

    def _get_driver(self):
        appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
        return appiumlib, appiumlib._current_application()

    @keyword("Tap Element")
    def tap_element(self, locator):
        appiumlib, driver = self._get_driver()
        element = appiumlib._element_find(locator, True, True)
        args = {"elementId": element.id}
        driver.execute_script("mobile: clickGesture", args)

    @keyword("Long Press Element")
    def long_press_element(self, locator, duration=1000):
        appiumlib, driver = self._get_driver()
        element = appiumlib._element_find(locator, True, True)
        args = {
            "elementId": element.id,
            "duration": int(duration)
        }
        driver.execute_script("mobile: longClickGesture", args)

    @keyword("Tap At Coordinates")
    def tap_by_coordinates(self, x, y):
        _, driver = self._get_driver()
        args = {
            "x": int(x),
            "y": int(y)
        }
        driver.execute_script("mobile: clickGesture", args)

    #
    # @keyword("Swipe Left")
    # def swipe_left(self):
    #     _, driver = self._get_driver()
    #     args = {
    #         "left": 304,
    #         "top": 72,
    #         "width": 1952,
    #         "height": 1464,
    #         "direction": "left",
    #         "percent": 0.75
    #     }
    #     driver.execute_script("mobile: swipeGesture", args)
    #
    #
    # @keyword("Swipe Right")
    # def swipe_right(self):
    #     _, driver = self._get_driver()
    #     args = {
    #         "left": 304,
    #         "top": 72,
    #         "width": 1952,
    #         "height": 1464,
    #         "direction": "right",
    #         "percent": 0.75
    #     }
    #     driver.execute_script("mobile: swipeGesture", args)


    @keyword("Swipe Left")
    def swipe_left(self, left, top, width, height, direction="left", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)


    @keyword("Swipe Right")
    def swipe_right(self, left, top, width, height, direction="right", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: swipeGesture", args)

    @keyword("Scroll Left")
    def scroll_left(self, left, top, width, height, direction="right", percent=0.75):
        _, driver = self._get_driver()
        args = {
            "left": int(left),
            "top": int(top),
            "width": int(width),
            "height": int(height),
            "direction": direction,
            "percent": float(percent)
            }
        driver.execute_script("mobile: scrollGesture", args)
