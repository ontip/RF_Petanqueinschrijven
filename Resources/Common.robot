*** Settings ***
Library   SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

End Web test
    #OntipApp.Logoff Website
    Close Browser
