*** Settings ***
Library     AppiumLibrary
Library     DateTime
Library    DoubleTapLibrary.py

*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${PRESENTATION_NAME}    Presentation Sample 1

*** Test Cases ***
Execute Tour
    [Documentation]    Execute Tour and e-detail Presentation.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
    Sleep    10s

    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup
    Sleep    10s
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
    Sleep   10s
    # Tour execution date
    ${TOUR_EXECUTION_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected date is: ${TOUR_EXECUTION_DATE}
    ${TOUR_EXECUTION_DATE}=    Convert Date    ${TOUR_EXECUTION_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}

    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
    Sleep    5s

   #Contact -- tour execution -- time --> Hours swipe code
#    Swipe    1428    709    1280    0    800   # 1 swipe

    Swipe    1575    709    1280    0    800   # 2 swipes
    Sleep    2s

    #Contact -- tour execution -- time --> min  swipe code
    Swipe    1575    891    1280    0    800   # 2 swipes
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]

    Sleep    5s
    ${TOUR_EXECUTION_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected time is: ${TOUR_EXECUTION_TIME}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s

    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentation"]
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]

    Sleep    5s

#    Left Swipe
    Swipe    2300    804    2000    804    800
    Sleep    5s
    Swipe    2300    804    2000    804    800
    Sleep    5s
    Swipe    2300    804    2000    804    800
    Sleep    5s
#    Right Swipe
    Swipe    300    804    500    804    800

    Sleep    10s

    Double Tap    1280    804
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="PAUSE"]   10s
    Click Element    xpath=//android.widget.Button[@text="PAUSE"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="RESUME"]    10s
    Click Element    xpath=//android.widget.Button[@text="RESUME"]

    #    Left Swipe
    Swipe    2300    804    2000    804    800

    Sleep    5s

    Double Tap    1280    804
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="FINISH"]   10s
    Sleep    10s
    Click Element    xpath=//android.widget.Button[@text="FINISH"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s


#    View Detailed Presentation Brand Discussed
    Swipe    1280    1295    1280    519    800
    Swipe    1280    1295    1280    519    800
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

    # verify the contact page after saving the tour execution
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]     10s
    Sleep    3s

#    Verify Tour Execution from the Activity Tab

    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
       # click tour plan from the drop-down

    Click Element    xpath=//android.view.ViewGroup[@content-desc="Tour Plan"]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        10s

    # Select tour execution from the drop-down
    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]     10s
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    2s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONTACT_NAME}")])[1]     10s
    Sleep    3s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONTACT_NAME}, ${TOUR_EXECUTION_DATE}, ${TOUR_EXECUTION_TIME}"))
    Sleep    20s
