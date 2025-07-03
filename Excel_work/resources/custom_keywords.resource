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

    # Force desired order of headers
    ${raw_headers}=    Create List    username    password

    # Convert to Robot-style variable headers: ${username}, ${password}
    ${headers}=    Create List
    FOR    ${header}    IN    @{raw_headers}
        ${robot_var}=    Evaluate    '$' + '{' + '''${header}''' + '}'
        Append To List    ${headers}    ${robot_var}
    END

    # Write header row
    ${col}=     Set Variable    1
    FOR    ${header}    IN    @{headers}
        ${cell}=    Evaluate    chr(64+${col}) + "1"
        Write To Cell    ${cell}    ${header}    ${sheet_name}
        ${col}=    Evaluate    ${col} + 1
    END

    # Write data rows
    ${row}=  Set Variable   2
    FOR    ${dict}    IN    @{data_dicts}
        ${col}=  Set Variable   1
        FOR    ${key}    IN    @{raw_headers}   # <- Match keys in raw form like 'username'
            ${cell}=    Evaluate    chr(64+${col}) + str(${row})
            Write To Cell    ${cell}    ${dict["${key}"]}    ${sheet_name}
            ${col}=    Evaluate    ${col} + 1
        END
        ${row}=    Evaluate    ${row} + 1
    END
    Save Workbook



#Save Test Data To Excel
#    [Arguments]    ${data_dicts}    ${sheet_name}
##    ${excel_path}=    Set Variable    ${EXECDIR}/data/generated_login_data.xlsx
#    Open Or Create Workbook And Sheet    ${sheet_name}
#
##    ${headers}=    Get Dictionary Keys    ${data_dicts[0]}
#
#    # Force desired order of headers
#    ${raw_headers}=    Create List    username    password
#
#    # Convert to Robot-style variable headers: ${username}, ${password}
#    ${headers}=    Create List
#    FOR    ${header}    IN    @{raw_headers}
#        ${robot_var}=    Set Variable    ${'$' + '{' + header + '}'}
#        Append To List    ${headers}    ${robot_var}
#    END
#
#    # Write header row
#    ${col}=     Set Variable    1
#    FOR    ${header}    IN    @{headers}
#        ${cell}=    Evaluate    chr(64+${col}) + "1"
#        Write To Cell    ${cell}    ${header}    ${sheet_name}
#        ${col}=    Evaluate    ${col} + 1
#    END
#
#    # Write data rows
#    ${row}=  Set Variable   2
#    FOR    ${dict}    IN    @{data_dicts}
#        ${col}=  Set Variable   1
#        FOR    ${key}    IN    @{headers}
#            ${cell}=    Evaluate    chr(64+${col}) + str(${row})
#            Write To Cell    ${cell}    ${dict["${key}"]}    ${sheet_name}
#            ${col}=    Evaluate    ${col} + 1
#        END
#        ${row}=    Evaluate    ${row} + 1
#    END
#    Save Workbook