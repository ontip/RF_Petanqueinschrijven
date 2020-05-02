*** Settings ***
Documentation     In deze test worden alle menu opties doorlopen onder het Hoofdmenu
Resource    ../Resources/Common.robot
Resource    ../Resources/OntipApp.robot

Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test

# run command
# robot -d results tests/NavigatieHoofdMenu.robot

*** Variables ***

${InputTextBox}             css=input[Name=Naam]
${user}                     admin
${vereniging}               Boulamis
${InputPasswordBox}         css=input[Name=secureontip]
${password}                 Obelikx61#
${toernooi}                 Vishussel
${URL}                      https://www.petanqueinschrijven.com/boulamis
${browser}                  chrome

*** Test Cases ***
# vanuit testcase alleen call naar Keyword files (common en ontipapp)
# vanuit keyword files call naar Page Object files
# vanuit Page Object files call naar selenium library

Make sure user if logged off before we start
    [Tags]  test1
    Go to   ${URL}
    OntipApp.Verify user is logged off

Verify Menu Option Aanloggen
    [Documentation]   Om beheertaken uit te kunnen voeren moet worden aangelogd
    [Tags]   test1
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Selecteer Toernooi
    [Documentation]   Selecteer menu optie Selecteer toernooi
    [Tags]   test2
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OntipApp.Load "Selecteer toernooi"
    OntipApp.Verify "Selecteer toernooi" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Toevoegen toernooi
    [Documentation]   Selecteer menu optie Toevoegen toernooi
    [Tags]   test3  test22
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OnTipApp.Load "Toevoegen toernooi"
    OntipApp.Verify "Toevoegen toernooi" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Toernooi beheer
    [Documentation]   Selecteer menu optie Toernooi beheer
    [Tags]   test4  test22
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OnTipApp.Load "Toernooi beheer"
    OntipApp.Verify "Toernooi beheer" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Inschrijvingen
    [Documentation]   Selecteer menu optie Inschrijvingen
    [Tags]   test5
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OnTipApp.Load "Inschrijvingen"
    OntipApp.Verify "Inschrijvingen" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Lijsten
    [Documentation]   Selecteer menu optie Lijsten
    [Tags]   test6
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OnTipApp.Load "Lijsten"
    OntipApp.Verify "Lijsten" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Overig
    [Documentation]   Selecteer menu optie Overig
    [Tags]   test7
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OnTipApp.Load "Overig"
    OntipApp.Verify "Overig" is loaded
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website

Logged On user should be able to select Afloggen
    [Documentation]   Selecteer menu optie Afloggen
    [Tags]   test8
    Go To  ${URL}
    OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
    OntipApp.Verify user is aangelogd
    OntipApp.Logoff Website
    #OntipApp.Verify Logoff Website






