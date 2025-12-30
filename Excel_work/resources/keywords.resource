*** Settings ***
Library    ExcelSage
Library    Collections
Library    OperatingSystem

*** Variables ***
${EXCEL_PATH}      ${EXECDIR}/Excel_work/data/generated_login_data.xlsx

*** Keywords ***

Open Or Create Workbook And Sheet
    [Arguments]     ${SHEET_NAME}
    ${FILE_EXISTS}=    Run Keyword And Return Status    File Should Exist    ${EXCEL_PATH}
    IF    ${FILE_EXISTS}
        Open Workbook    ${EXCEL_PATH}
    ELSE
        Create Workbook    ${EXCEL_PATH}    overwrite_if_exists=True
        Rename Sheet       Sheet    ${SHEET_NAME}
    END

    ${SHEET}=    Get Sheets
    ${SHEET_EXISTS}=    Run Keyword And Return Status    List Should Contain Value    ${SHEET}    ${SHEET_NAME}
    IF    not ${SHEET_EXISTS}
        Add Sheet    ${SHEET_NAME}
    END

Save Test Data To Excel
    [Arguments]    ${data_dicts}    ${sheet_name}
    Open Or Create Workbook And Sheet    ${sheet_name}

    ${headers}=    Get Dictionary Keys    ${data_dicts[0]}

    # Add Robot-style variable headers like ${username}, ${password}
    ${formatted_headers}=    Create List
    FOR    ${header}    IN    @{headers}
        ${var}=    Set Variable    ${'$' + '{' + header + '}'}
        Append To List    ${formatted_headers}    ${var}
    END

    # Write headers in first row
    Write Row    1    ${formatted_headers}    ${sheet_name}

    # Write each data row
    ${row}=    Set Variable    2
    FOR    ${dict}    IN    @{data_dicts}
        ${values}=    Create List
        FOR    ${key}    IN    @{headers}
            Append To List    ${values}    ${dict[${key}]}
        END
        Write Row    ${row}    ${values}    ${sheet_name}
        ${row}=    Evaluate    ${row} + 1
    END

    Save Workbook
