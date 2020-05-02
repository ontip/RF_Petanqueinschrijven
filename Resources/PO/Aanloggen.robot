*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# definitie locators
${PAGE_FRAME_MAIN} =                  xpath=//iframe[@name='main']
#${SUBMIT_BUTTON} =                    css=[Name=wachtwoord_button]
${SUBMIT_BUTTON} =                    xpath=/html/body/form/center/center/input
${AANLOGGEN_INPUT} =                  xpath=/html/body/form/center/table
${InputTextBox}                       css=input[Name=Naam]
${InputPasswordBox}                   css=input[Name=secureontip]
${AANLOGGEN_INPUT_HEADER_TEXT} =      xpath=/html/body/form/center/table/tbody/tr[1]/td[2]
${MENU_OPTION_SELECTEER_TOERNOOI} =   xpath=/html/body/div/table/tbody/tr/td[1]/table/tbody/tr[1]/td[2]

*** Keywords ***
Verify Page Loaded
    #Go To   ${URL}
    #Select Window
    Wait until Page Contains Element   ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Sleep  2s
    # Check of pagina Element bevat
    Wait until Page Contains Element  ${AANLOGGEN_INPUT_HEADER_TEXT}
    # Check of Element juiste waarde bevat
    Element text should be   ${AANLOGGEN_INPUT_HEADER_TEXT}   Vul hier je toegangscode en wachtwoord in

User Login with Valid Credentials
    [Arguments]   ${user}  ${password}
    Select Window
    Wait until Page Contains Element   ${PAGE_FRAME_MAIN}
    Select Frame                       ${PAGE_FRAME_MAIN}
    Fill "Toegangscode" Field          ${InputTextBox}            ${user}
    Fill "Wachtwoord" Field            ${InputPasswordBox}        ${password}
    Click "Klik hier na invullen" Button
    # terug naar hoofdscherm
    Select Window


Fill "Toegangscode" Field
    [Arguments]   ${InputTextBox}            ${user}
    Input Text        ${InputTextBox}            ${user}

Fill "Wachtwoord" Field
    [Arguments]  ${InputPasswordBox}        ${password}
     Input Password    ${InputPasswordBox}        ${password}

Click "Klik hier na invullen" Button
    Wait until Page Contains Element   ${SUBMIT_BUTTON}
    # Vind geen inhoud
    #Element text should be   ${SUBMIT_BUTTON}    Klik hier na invullen
    Click Button      ${SUBMIT_BUTTON}

Verify user is aangelogd
     # Na aanloggen bevat het linker menu als tekst Selecteer
     Wait Until Page Contains Element   ${MENU_OPTION_SELECTEER_TOERNOOI}
     Element text should be   ${MENU_OPTION_SELECTEER_TOERNOOI}   Selecteer toernooi
     # break uit het frame
     Select Window
     [Return]  User is logged on!
