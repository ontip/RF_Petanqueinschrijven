*** Settings ***
Library    SeleniumLibrary
Resource    ./DB/MySql.robot
Resource    ./PO/Inschrijfformulier.robot

*** Keywords ***

Load "Inschrijf formulier"
   [Arguments]    ${url}
    Inschrijfformulier.Load "Inschrijf formulier"  ${url}

Validate "Inschrijf formulier" is loaded
    [Arguments]    ${url}
    Inschrijfformulier.Validate "Inschrijf formulier"  ${url}

Should be able to "Inschrijven met behulp van Licenties"
    [Arguments]    ${url}   &{inschrijving}
    Inschrijfformulier.Should be able to "Inschrijven met behulp van Licenties"   ${url}  &{inschrijving}

Should be able to "Inschrijven met behulp van Licentie en Naam en Vereniging"
    [Arguments]    ${url}   @{inschrijving}
    Inschrijfformulier.Should be able to "Inschrijven met behulp van Licentie en Naam en Vereniging"  ${url}

Validate "Inschrijving geregistreerd"
    [Arguments]    ${LICENTIE1}
    MySQl.Validate "Inschrijving geregistreerd"  ${LICENTIE1}






