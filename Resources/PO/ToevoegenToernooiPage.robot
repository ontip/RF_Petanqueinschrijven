*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TOEVOEGEN_TOERNOOI_HEADER_TEXT} =   xpath=/html/body/div[4]/h1
${PAGE_FRAME_MAIN} =                  xpath=//iframe[@name='main']

*** Keywords ***
Verify Page is loaded
    [Documentation]    Check of pagina geladen is
    Select Window
    Page should Contain Element         ${PAGE_FRAME_MAIN}
    Select Frame                        ${PAGE_FRAME_MAIN}
    Wait Until Page Contains Element    ${TOEVOEGEN_TOERNOOI_HEADER_TEXT}
    Element text should be              ${TOEVOEGEN_TOERNOOI_HEADER_TEXT}   Toevoegen toernooi
    Select Window


