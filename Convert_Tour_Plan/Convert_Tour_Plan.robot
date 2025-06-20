*** Settings ***
Library    AppiumLibrary
Library     DateTime

*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${APPOINTMENT_DATE}         2025-06-02
${APPOINTMENT_TIME}         14:30
${Survey_name}              MedRep Engagement Insights
${Question_1}               How frequently do you recommend our products to patients for specific health issues?
${Question_2}               How satisfied are you with the availability of our pharmaceutical products?
${Question_3}               What challenges do you face when recommending our products to patients?
${Answer_1}                 Rarely
${Answer_2}                 9
${Answer_3}                 Lack of product Knowledge
${Product_question}         How effective do you find Miconazole for treating fungal infections?
${Product_answer}           Very Effective
${S&T_question_1}           What factors influence your decision to choose Miconazole for treatment?
${S&T_question_2}           How frequently do you prescribe Miconazole for ENT-related fungal infections compared to other antifungal medications?
${S&T_question_3}           What outcomes have you observed in patients using Miconazole for ENT fungal infections?
${S&T_answer_1}             Efficacy
${S&T_answer_2}             9.5
${S&T_answer_3}             Positive outcomes
${Use_Case}                 Miconazole Treatment for Otomycosis (Fungal Ear Infection)
${Classification}           Detailed
${Product_message}          Rapid treatment for fungal infections in the ear, nose, and throat.
${Product}                  Miconazole
${Brand_Discuss_input_text}     Beneficial for infections in ear, nose, and throat.


*** Test Cases ***
Convert Tour Plan and execute Tour

    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    2s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONTACT_NAME}")])[1]     10s
    Sleep    3s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONTACT_NAME}, ${APPOINTMENT_DATE}, ${APPOINTMENT_TIME}"))
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[@text="Tour Plan"]
    Sleep    10s
    #Convert Tour Plan
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Convert 1:1"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
    Sleep   5s
    # Tour execution date
    ${TOUR_EXECUTION_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected date is: ${TOUR_EXECUTION_DATE}
    ${TOUR_EXECUTION_DATE}=    Convert Date    ${TOUR_EXECUTION_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}
    Sleep    5s
    ${TOUR_EXECUTION_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected time is: ${TOUR_EXECUTION_TIME}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s


    #filling survey during tour execution
    #General

    Wait Until Element Is Visible    //android.widget.TextView[@text="Survey"]      10s
    Click Element    //android.view.ViewGroup[@content-desc="Survey"]/android.view.ViewGroup/com.horcrux.svg.SvgView
    Sleep    5s

    Swipe    1280    1295    1280    519    1000
    Sleep    2s

    Wait Until Element Is Visible    //android.widget.TextView[@text="${Survey_name}"]      10s
    Click Element    //android.view.ViewGroup[@content-desc="${Survey_name}"]/android.view.ViewGroup/com.horcrux.svg.SvgView
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Question_1}"]        10s
    Click Element    //android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup      10s
    Click Element    //android.view.ViewGroup[@content-desc="${Answer_1}"]
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Question_2}"]     10s
    Click Element    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]
    Input Text    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]    ${Answer_2}
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Question_3}"]     10s
    Click Element    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]
    Input Text    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]    ${Answer_3}
    Sleep    5s

    #Product
    Wait Until Element Is Visible    //android.widget.TextView[@text="Product"]    10s
    Click Element    //android.view.ViewGroup[@content-desc="Product"]
    Click Element    //android.view.ViewGroup[@content-desc="Product"]
    Sleep    10s

    Log To Console   >>>> Product section is selected
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product_question}"]    10s
    Sleep  5s
    Click Element    //android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.RectView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product_answer}"]      10s
    Click Element    //android.view.ViewGroup[@content-desc="${Product_answer}"]
    Sleep    5s

    #S and T
    Wait Until Element Is Visible    //android.widget.TextView[@text="S And T"]     10s
    Click Element    //android.view.ViewGroup[@content-desc="S And T"]
    Click Element    //android.view.ViewGroup[@content-desc="S And T"]
    Sleep    10s

    Log To Console   >>>> S And T section is selected
    Wait Until Element Is Visible    //android.widget.TextView[@text="${S&T_question_1}"]        10s
    Click Element    xpath =//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup      10s
    Click Element    //android.view.ViewGroup[@content-desc="${S&T_answer_1}"]
    Sleep    5s

    Wait Until Element Is Visible    //android.widget.TextView[@text="${S&T_question_2}"]      10s
    Click Element    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]
    Input Text    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]    ${S&T_answer_2}
    Sleep    5s

    Wait Until Element Is Visible    //android.widget.TextView[@text="${S&T_question_3}"]     10s
    Click Element    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]
    Input Text    //android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]    ${S&T_answer_3}
    Sleep    5s
    Click Element    //android.view.ViewGroup[@content-desc="S And T"]
    Sleep    10s

    Swipe    1280    1295    1280    519    800
    #Fill Brand Discuss
    Wait Until Element Is Visible    //android.widget.TextView[@text="Prio 1 - Brand Discussed"]        10s
    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup      20s
    Sleep    5s
    Click Element    //android.view.ViewGroup[@content-desc="${Use_Case}"]
    Sleep    5s
    Click Element    //android.view.ViewGroup[@content-desc="Select Option"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Classification}"]        10s
    Click Element    //android.view.ViewGroup[@content-desc="${Classification}"]
    Sleep    5s
 
    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[5]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product_message}"]     10s
    Click Element    //android.view.ViewGroup[@content-desc="${Product_message}"]
    Sleep    5s
 
    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product}"]          10s
    Click Element    //android.view.ViewGroup[@content-desc="${Product}"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.view.ViewGroup[@resource-id="@undefined/container"])[3]/android.view.ViewGroup      10s
    Click Element    xpath=(//android.view.ViewGroup[@resource-id="@undefined/container"])[3]/android.view.ViewGroup
    Input Text    xpath=(//android.view.ViewGroup[@resource-id="@undefined/container"])[3]//following-sibling::android.widget.EditText    ${Brand_Discuss_input_text}
    Sleep    5s
    Swipe    1280    1295    1280    519    1000
 
    Swipe    1280    1295    1280    519    1000
 
    Swipe    1280    1295    1280    519    1000
 
    Swipe    1280    1295    1280    519    1000
 
 
    Sleep    2s
 
    Wait Until Element Is Visible    //android.widget.TextView[@text="Sample Delivery"]     10s
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add New"]
    Sleep    20s

    Click Element    //android.view.ViewGroup[@content-desc="Beclometasone nasal spray 20ml, Beclometasone nasal spray 20ml"]
    Sleep    5s
 
    Wait Until Element Is Visible    xpath= (//android.widget.EditText[@resource-id="@undefined/input"])[2]    10s
    Input Text    xpath= (//android.widget.EditText[@resource-id="@undefined/input"])[2]    10
    Sleep    5s
 
    Wait Until Element Is Visible    //android.widget.TextView[@text="OK"]      10s
    Click Element    //android.view.ViewGroup[@content-desc="OK"]
    Sleep    5s
 
    #Saving tour execution
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

    # verify the contact page after saving the tour execution
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]     10s
    Sleep    3s

#    Verify Tour Execution from the Activity Tab

    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s

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





