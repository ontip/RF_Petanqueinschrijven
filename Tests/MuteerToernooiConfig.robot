*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/OntipApp.robot

Suite Setup     Common.Begin Web Test
Suite Teardown  Common.End Web Test

# run command
# robot -d results tests/MuteerToernooiConfig.robot

*** Variables ***
${URL}                      https://www.petanqueinschrijven.com/boulamis
${browser}                  chrome

${toernooi}            erik_test_toernooi
${user}                admin
${password}            Obelikx61#

*** Test Cases ***
Should be able to "Selecteer Toernooi voor Muteer toernooi config"
   [Documentation]   Om beheertaken uit te kunnen voeren moet worden aangelogd
    [Tags]   test1
    Go To  ${URL}
    OntipApp.Verify "Aanloggen Met User En Wachtwoord"      ${user}   ${password}
    OntipApp.Load "Selecteer toernooi"
    OntipApp.Validate "Selecteer toernooi" is loaded
    OntipApp.Selecteer een toernooi    ${toernooi}
    OntipApp.Validate toernooi is geselecteerd  ${toernooi}

Should be able to "Muteer toernooi config Tab Toernooi"
    [Documentation]    Muteer gegevens in Tab Toernooi
    [Tags]   test2
    OntipApp.Load "Toernooi beheer"
    OntipApp.Load "Beheer toernooi Tab Toernooi"
    OntipApp.Validate "Beheer toernooi Tab Toernooi" is loaded
    OntipApp.Validate if field can be changed in Tab Toernooi

Should be able to "Muteer toernooi config Tab Formulier"
    [Documentation]    Muteer gegevens in Tab Toernooi
    OntipApp.Load "Toernooi beheer"
    OntipApp.Load "Beheer toernooi Tab Formulier"
    OntipApp.Validate "Beheer toernooi Tab Formulier" is loaded
    OntipApp.Validate if field can be changed in Tab Formulier


Should be able to "Muteer toernooi config Tab Overig"
    [Documentation]   Muteer gegevens in Tab Overig
    [Tags]   test3
    OntipApp.Load "Toernooi beheer"
    OntipApp.Load "Beheer toernooi Tab Overig"
    OntipApp.Validate "Beheer toernooi Tab Overig" is loaded
    OntipApp.Validate if field can be changed in Tab Overig

    #OntipApp.Muteer field in "Toernooi Beheer Tab Toernooi"
    Sleep   4s
    Select Window
    OntipApp.Logoff Website







