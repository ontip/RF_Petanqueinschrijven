*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/OntipApp.robot

Suite Setup     Common.Begin Web Test
Suite Teardown  Common.End Web Test

# run command
# robot -d results tests/MuteerInschrijving.robot

*** Variables ***
${URL}                      https://www.petanqueinschrijven.com/boulamis
${browser}                  chrome

${toernooi}            erik_test_toernooi
${user}                admin
${password}            Obelikx61#

*** Test Cases ***
Should be able to "Selecteer Toernooi voor Muteer inschrijving"
   [Documentation]   Om beheertaken uit te kunnen voeren moet worden aangelogd
    [Tags]   test1
    Go To  ${URL}
    OntipApp.Verify "Aanloggen Met User En Wachtwoord"      ${user}   ${password}
    OntipApp.Load "Selecteer toernooi"
    OntipApp.Verify "Selecteer toernooi" is loaded
    OntipApp.Selecteer een toernooi    ${toernooi}
    OntipApp.Verify toernooi is geselecteerd  ${toernooi}

Should be able to "Muteer inschrijving"
    [Documentation]    Muteer gegevens in Tab Toernooi
    [Tags]   test2
    OntipApp.Load "Inschrijvingen"
    OntipApp.Verify "Inschrijvingen" is loaded
    OntipApp.Load "Inschrijvingen Tab Muteren"
    OntipApp.Verify "Inschrijvingen Tab Muteren" is loaded
    #OntipApp.Verify Inschrijving can be changed
    # TODO  dit moet nog verder uitgewerkt worden

    Sleep   4s
    Select Window
    OntipApp.Logoff Website







