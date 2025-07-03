*** Settings ***
Resource    ../../Excel_work/resources/custom_keywords.resource
*** Test Cases ***
Create Login Data for Data-Driven Testing
#    ${users}=    Create List
#    ...    Create Dictionary    username=user1    password=pass123
#    ...    Create Dictionary    username=user2    password=pass456
#    ...    Create Dictionary    username=user3    password=wrongpass
    ${user1}=    Create Dictionary    username=user1    password=pass123
    ${user2}=    Create Dictionary    username=user2    password=pass456
    ${users}=    Create List    ${user1}    ${user2}
    Save Test Data To Excel    ${users}    LoginData
