*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
# watch for spaces
${PAGE_FRAME_MAIN} =                       xpath=//iframe[@name='main']
${SELECTEER_TOERNOOI_HEADER_TEXT} =        xpath=/html/body/div[2]/blockquote/h2
${SELECTEER_TOERNOOI_PAGE_HEADER} =        xpath=/html/body/div/table/tbody/tr/td[2]/div[1]/table/tbody/tr/td[1]/span[1]

*** Keywords ***
Verify Page is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${SELECTEER_TOERNOOI_HEADER_TEXT}
    Element text should be             ${SELECTEER_TOERNOOI_HEADER_TEXT}   Selecteer een aangemaakt toernooi formulier
    Select Window

Verify toernooi geselecteerd
    [Arguments]     ${toernooi}
    Wait Until Page Contains Element   ${SELECTEER_TOERNOOI_PAGE_HEADER}
    #${substring_toernooi_page} =   Get Substring  ${SELECTEER_TOERNOOI_PAGE_HEADER} , 0 , 9
    Element should contain        ${SELECTEER_TOERNOOI_PAGE_HEADER}  Beheer "


Selecteer een toernooi
    [Arguments]     ${toernooi}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Select from list by value    id=selectBox     ${toernooi}
    Sleep   2s

