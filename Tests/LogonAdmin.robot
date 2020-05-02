*** Settings ***
Documentation   Deze test controleert of de optie Aanloggen aanwezig is in het menu, anders wordt er afgelogd
Resource    ../Resources/OntipApp.robot
Resource    ../Resources/Common.robot

Suite Setup     Common.Begin Web Test
Suite Teardown  Common.End Web Test

# robot -d results tests/CheckLogon.robot

*** Variables ***
${URL}                      https://www.petanqueinschrijven.com/boulamis
${BROWSER}                  chrome
${user}                     admin
${password}                 Obelikx61#

*** Test Cases ***
# vanuit testcase alleen call naar Keyword files (common en ontipapp)
# vanuit keyword files call naar Page Object files
# vanuit Page Object files call naar selenium library

Should be able to open MainPage
    [Tags]  test1
    Go to   ${URL}

Verify MainPage loaded
    [documentation]    Kontroleer of Hoofdpagina geladen is incl check header
    [Tags]  test2
    Go to   ${URL}
    OntipApp.Verify MainPage loaded

Should be able to logon
   [Documentation]      Aanloggen met een gebruikerscode en wachtwoord
   [Tags]  test3
   Go to   ${URL}
   OntipApp.Aanloggen Met User En Wachtwoord      ${user}   ${password}
   OntipApp.Verify user is aangelogd

Should be able to logoff
   [Documentation]   Afloggen als er aangelogd is
   [Tags]   test4
   Go to   ${URL}
   OntipApp.Logoff website