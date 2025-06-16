*** Settings ***
Library     AppiumLibrary
Library    DoubleTapLibrary.py


*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${PRESENTATION_NAME}    Presentation Sample 1

*** Test Cases ***
View Presentation
    [Documentation]    View Presentation from Presentation Tab.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Presentations"])[1]    10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]//following-sibling::android.view.ViewGroup[@content-desc="View"]
    Sleep    5s
    
#    Left Swipe
    Swipe    2300    804    2000    804    800
    Sleep    5s
    Swipe    2300    804    2000    804    800
    Sleep    5s
#    Right Swipe
    Swipe    300    804    500    804    800

    Sleep    5s
    
    Double Tap    1280    804
    
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
    Click Element    xpath=//android.widget.Button[@text="FINISH"]
    Sleep    20s



