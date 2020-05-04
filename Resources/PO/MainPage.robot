*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# watch for spaces

${MENU_OPTION_AANLOGGEN} =            xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]
${MENU_OPTION_HOOFDMENU} =            xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]
${MENU_OPTION_SELECTEER_TOERNOOI} =   xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]
${MENU_OPTION_TOEVOEGEN_TOERNOOI} =   xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]
${MENU_OPTION_TOERNOOI_BEHEER} =      xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]
${MENU_OPTION_INSCHRIJVINGEN} =       xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]
${MENU_OPTION_LIJSTEN} =              xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[5]/td[2]
${MENU_OPTION_OVERIG} =               xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[6]/td[2]
${HEADER_MAINPAGE} =                  xpath=/html/body/div/table/tbody/tr/td[2]/div[1]/table/tbody/tr/td[1]/span[1]
${MENU_OPTION_AFLOGGEN} =             xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[7]/td[2]
#${First_menu_option} =           ${MENU_OPTION_AANLOGGEN}
${MyValue} =  100
*** Keywords ***

Verify Page Loaded
    Wait until Page Contains element     ${HEADER_MAINPAGE}
    Element text should be               ${HEADER_MAINPAGE}   Beheer OnTip

Verify optie "Aanloggen"
    Select Window
    Page Should Contain Element       ${MENU_OPTION_AANLOGGEN}
    ${menu_option_text} =   GET TEXT  ${MENU_OPTION_AANLOGGEN}
    Log  ${menu_option_text}
    # If .. Else
    Run Keyword if  '${menu_option_text}' != 'Aanloggen'
      ...  Kies Optie "Afloggen"


Load "Selecteer toernooi"
    Wait until Page Contains Element   ${MENU_OPTION_SELECTEER_TOERNOOI}
    Element text should be             ${MENU_OPTION_SELECTEER_TOERNOOI}  Selecteer toernooi
    Click Element                      ${MENU_OPTION_SELECTEER_TOERNOOI}

Load "Toevoegen toernooi"
    Wait until Page Contains Element   ${MENU_OPTION_TOEVOEGEN_TOERNOOI}
    Element text should be             ${MENU_OPTION_TOEVOEGEN_TOERNOOI}  Toevoegen toernooi
    Click Element                      ${MENU_OPTION_TOEVOEGEN_TOERNOOI}

Load "Toernooi beheer"
    Wait until Page Contains Element   ${MENU_OPTION_TOERNOOI_BEHEER}
    Element text should be             ${MENU_OPTION_TOERNOOI_BEHEER}  Toernooi beheer
    Click Element                      ${MENU_OPTION_TOERNOOI_BEHEER}

Load "Inschrijvingen"
    Wait until Page Contains Element   ${MENU_OPTION_INSCHRIJVINGEN}
    Element text should be             ${MENU_OPTION_INSCHRIJVINGEN}  Inschrijvingen
    Click Element                      ${MENU_OPTION_INSCHRIJVINGEN}

Load "Lijsten"
    Wait until Page Contains Element   ${MENU_OPTION_LIJSTEN}
    Element text should be             ${MENU_OPTION_LIJSTEN}  Lijsten
    Click Element                      ${MENU_OPTION_LIJSTEN}

Load "Overig"
    Wait until Page Contains Element   ${MENU_OPTION_OVERIG}
    Element text should be             ${MENU_OPTION_OVERIG}  Overig
    Click Element                      ${MENU_OPTION_OVERIG}

Verify optie "Afloggen"
    Page Should Contain Element        ${MENU_OPTION_AFLOGGEN}
    Element text should be             ${MENU_OPTION_AFLOGGEN}   Uitloggen

Kies Optie "Afloggen"
    Click Element     ${MENU_OPTION_AFLOGGEN}

Kies Optie "Aanloggen"
    Click Element     ${MENU_OPTION_AANLOGGEN}

Kies Optie Selecteer Toernooi
    Click Element   ${MENU_OPTION_SELECTEER_TOERNOOI}

Load  ${menu_option}
    [Arguments]    ${menu_option}
    Click Element   ${menu_option}
    #Sleep   2s





Selecteer een toernooi
    Select from list by value    id=selectBox     ${toernooi}
    Sleep   2s

Verify toernooi geselecteerd
    Wait Until Page Contains  Beheer "