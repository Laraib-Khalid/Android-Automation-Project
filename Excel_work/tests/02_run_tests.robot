*** Settings ***
Library           AppiumLibrary
Library           DataDriver    ${EXECDIR}/Excel_work/data/generated_login_data.xlsx    sheet_name=LoginData
Test Template     Mobile Login Test
Suite Setup       Open App
Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}       http://localhost:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP_PACKAGE}      com.smartrep
${APP_ACTIVITY}     com.smartrep.MainActivity
${UI_AUTOMATION}    uiautomator2

*** Keywords ***

Open App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${UI_AUTOMATION}
    ...    noReset=true
    ...    autoGrantPermissions=true

Mobile Login Test
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]    20s
    Sleep    5s
    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    ${username}
    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    ${password}
    Sleep    5s
    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
    Sleep    5s

*** Test Cases ***
Login Test With ${username}  and  ${password}
    [Tags]    data-driven
    Mobile Login Test