*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# watch for spaces
${PAGE_FRAME_MAIN} =                    xpath=//iframe[@name='main']
${LIJSTEN_HEADER_TEXT} =                xpath=/html/body/div[2]/h2
${MENU_OPTION_HOOFDMENU} =            xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]

*** Keywords ***
Verify Page is loaded
    Select Window
    Wait Until Page Contains Element   ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${LIJSTEN_HEADER_TEXT}
    Element text should be             ${LIJSTEN_HEADER_TEXT}   Lijsten
    # terug naar hoofdscherm
    Select Window
    Page Should Contain Element        ${MENU_OPTION_HOOFDMENU}
    Element Text should be             ${MENU_OPTION_HOOFDMENU}  Hoofdmenu
    Click Element                      ${MENU_OPTION_HOOFDMENU}


