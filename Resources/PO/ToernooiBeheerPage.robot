*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# watch for spaces
${PAGE_FRAME_MAIN} =                            xpath=//iframe[@name='main']
${TOERNOOI_BEHEER_HEADER_TEXT} =                xpath=/html/body/div[2]/h2
${TOERNOOI_BEHEER_OPTION_TAB_TOERNOOI} =        xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]
${TOERNOOI_BEHEER_OPTION_TAB_FORMULIER} =       xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[3]/td[2]
${TOERNOOI_BEHEER_OPTION_TAB_OVERIG} =          xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[4]/td[2]
${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT} =   xpath=/html/body/b/div[17]/form/table[1]/tbody/tr/td[1]
${TOERNOOI_BEHEER_TAB_FORMULIER_HEADER_TEXT} =  xpath=/html/body/b/div[17]/form/table[1]/tbody/tr/td[1]
${MENU_OPTION_HOOFDMENU} =                      xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]

${input_field_map_locatie} =                    css=Input[name=Ontip_map_locatie]
${input_field_contact_persoon} =                css=Input[name=volledige_naam]


*** Keywords ***
Terug naar Hoofdmenu
    Select Window
    Page should Contain Element        ${MENU_OPTION_HOOFDMENU}
    Element text should be             ${MENU_OPTION_HOOFDMENU}  Hoofdmenu
    Click Element                      ${MENU_OPTION_HOOFDMENU}

Verify Page is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_HEADER_TEXT}
    Element text should be             ${TOERNOOI_BEHEER_HEADER_TEXT}   Toernooi (formulier) aanpassen
    Terug naar Hoofdmenu

Load "Beheer toernooi Tab Toernooi"
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_OPTION_TAB_TOERNOOI}
    Element text should be             ${TOERNOOI_BEHEER_OPTION_TAB_TOERNOOI}   Toernooi
    Click Element                      ${TOERNOOI_BEHEER_OPTION_TAB_TOERNOOI}

Verify "Beheer toernooi Tab Toernooi" is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}
    Element text should be             ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}  Dit scherm bevat de instellingen die direct betrekking hebben op het toernooi.

Verify if field can be changed in Tab Toernooi
    Page should contain Element        ${input_field_map_locatie}
    ${current_value} =                 GET Value  ${input_field_map_locatie}
    Fill "Input" Field                 ${input_field_map_locatie}         Een andere plaats
    Submit Form
    Sleep  2s
    Fill "Input" Field                 ${input_field_map_locatie}         ${current_value}
    Submit Form
    Select Window
    Terug naar Hoofdmenu

Load "Beheer toernooi Tab Formulier"
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_OPTION_TAB_FORMULIER}
    Element text should be             ${TOERNOOI_BEHEER_OPTION_TAB_FORMULIER}   Formulier
    Click Element                      ${TOERNOOI_BEHEER_OPTION_TAB_FORMULIER}

Verify "Beheer toernooi Tab Formulier" is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}
    Element text should be             ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}  Dit scherm bevat de instellingen die direct betrekking hebben op het formulier.

Verify if field can be changed in Tab Formulier
    Submit Form
    Select Window
    Terug naar Hoofdmenu

Load "Beheer toernooi Tab Overig"
    Select Window
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_OPTION_TAB_OVERIG}
    Element text should be             ${TOERNOOI_BEHEER_OPTION_TAB_OVERIG}   Overig
    Click Element                      ${TOERNOOI_BEHEER_OPTION_TAB_OVERIG}

Verify "Beheer toernooi Tab Overig" is loaded
    Select Window
    Page should Contain Element        ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element   ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}
    Element text should be             ${TOERNOOI_BEHEER_TAB_TOERNOOI_HEADER_TEXT}  Dit scherm bevat algemene instellingen.

Verify if field can be changed in Tab Overig
    Page should contain Element        ${input_field_contact_persoon}
    ${current_value} =                 GET Value  ${input_field_contact_persoon}
    Fill "Input" Field                 ${input_field_contact_persoon}         Een andere
    Sleep  2s
    Submit Form
    Fill "Input" Field                 ${input_field_contact_persoon}         ${current_value}
    Sleep  2s
    Submit Form
    Select Window
    Terug naar Hoofdmenu

Fill "Input" Field
    [Arguments]   ${InputTextBox}            ${content}
    Input Text        ${InputTextBox}        ${content}


