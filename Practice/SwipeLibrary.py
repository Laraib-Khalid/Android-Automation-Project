# from robot.api.deco import keyword
# from robot.libraries.BuiltIn import BuiltIn
# from selenium.webdriver.common.actions.action_builder import ActionBuilder
# from selenium.webdriver.common.actions.pointer_input import PointerInput
#
# class SwipeLibrary:
#
#     def _get_driver(self):
#         appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
#         return appiumlib, appiumlib._current_application()
#
#     @keyword("Swipe From ${start_x} ${start_y} To ${end_x} ${end_y}")
#     def swipe_from_to(self, start_x, start_y, end_x, end_y):
#         _, driver = self._get_driver()
#
#         start_x = int(start_x)
#         start_y = int(start_y)
#         end_x = int(end_x)
#         end_y = int(end_y)
#
#         # Manually specify "touch" if TOUCH constant is unavailable
#         finger = PointerInput("touch", "finger")
#         actions = ActionBuilder(driver)
#         actions.add_action(finger)
#
#         actions.pointer_action.move_to_location(start_x, start_y)
#         actions.pointer_action.pointer_down()
#         actions.pointer_action.move_to_location(end_x, end_y)
#         actions.pointer_action.pointer_up()
#         actions.perform()







from selenium.webdriver.common.actions.pointer_input import PointerInput
from selenium.webdriver.common.actions.action_builder import ActionBuilder

print(PointerInput.TOUCH)  # should return "touch"