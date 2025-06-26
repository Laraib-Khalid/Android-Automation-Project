*** Settings ***
Library    ExcelSage

*** Variables ***
${EXCEL_PATH}       variable.xlsx
${CONTACT_NAME}     Sarah Thompson
${HOSPITAL_NAME}    Alpha Hospital

*** Test Cases ***
Write To Excel Correctly
    Create Workbook    ${EXCEL_PATH}    overwrite_if_exists=True
    Rename Sheet    Sheet    Sheet1
    Write To Cell      A1    appointment_start_date     Sheet1
    Write To Cell      A2    ${CONTACT_NAME}     Sheet1
    Write To Cell      B1    appointment_time            Sheet1
    Write To Cell      B2    ${HOSPITAL_NAME}            Sheet1
    Save Workbook
    
    
Read from Excel Correctly
    Open Workbook    ${EXCEL_PATH}
    ${SEARCH_APPOINTMENT_DATE}=    Get Cell Value    A2     Sheet1
    ${SEARCH_APPOINTMENT_TIME}=    Get Cell Value    B2     Sheet1
    Log To Console    ${SEARCH_APPOINTMENT_DATE}
    Log To Console    ${SEARCH_APPOINTMENT_TIME}