*** Settings ***
Documentation  This some basic info for the whole suite
Resource    ../Resources/OntipApp.robot
Resource    ../Resources/PO/SelectToernooiPage.robot
Resource    ../Resources/Common.robot

# robot -d results  tests/SelecteerToernooi.robot

# gebruik Suite omdat anders tussendoor wordt afgelogd
Suite Setup       Common.Begin Web Test
Suite Teardown    Common.End Web Test

*** Variables ***
${InputTextBox}             css=input[Name=Naam]
${user}                     admin
${InputPasswordBox}         css=input[Name=secureontip]
${password}                 Obelikx61#
${toernooi}                 Vishussel
${url}                      https://www.petanqueinschrijven.com/boulamis
${browser}                  chrome

*** Test Cases ***
# vanuit testcase alleen call naar Keyword files (common en ontipapp)
# vanuit keyword files call naar Page Object files
# vanuit Page Object files call naar selenium library


Should be able to login
    [Documentation]   Om beheertaken uit te kunnen voeren moet worden aangelogd
    OntipApp.Verify "Aanloggen met user en wachtwoord"   ${user}  ${password}

Logged On user should be able to select a toernooi
    [Documentation]   Als user is aangelogd kan er een toernooi worden geselecteerd
    SelectToernooiPage.Load
    SelectToernooiPage.Verify Page Loaded
    SelectToernooiPage.Selecteer een toernooi
    SelectToernooiPage.Verify toernooi geselecteerd