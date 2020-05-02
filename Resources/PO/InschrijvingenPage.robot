*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# watch for spaces
${PAGE_FRAME_MAIN} =                    xpath=//iframe[@name='main']
${INSCHRIJVINGEN_HEADER_TEXT} =         xpath=/html/body/div[2]/h2
${MENU_OPTION_HOOFDMENU} =             xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]
${MENU_OPTION_INSCHRIJVEN_MUTEREN} =    xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]

*** Keywords ***
Verify Page is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${INSCHRIJVINGEN_HEADER_TEXT}
    Element text should be             ${INSCHRIJVINGEN_HEADER_TEXT}   Inschrijvingen
    # terug naar hoofdscherm
    Select Window
    Page Should Contain Element        ${MENU_OPTION_HOOFDMENU}
    Element Text should be             ${MENU_OPTION_HOOFDMENU}  Hoofdmenu
    Click Element                      ${MENU_OPTION_HOOFDMENU}

Load "Inschrijvingen Tab Muteren"
    Select Window
    Wait until Page Contains Element   ${MENU_OPTION_INSCHRIJVINGEN}
    Element text should be             ${MENU_OPTION_INSCHRIJVINGEN}  Inschrijvingen
    Click Element                      ${MENU_OPTION_INSCHRIJVINGEN}
    Wait Until Page Contains Element   ${MENU_OPTION_INSCHRIJVEN_MUTEREN}
    Element text should be             ${MENU_OPTION_INSCHRIJVEN_MUTEREN}   Muteren

Verify "Inschrijvingen Tab Muteren" is loaded

Verify Inschrijving can be changed

