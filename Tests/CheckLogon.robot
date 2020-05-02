*** Settings ***
Documentation   Deze test zorgt voor het aanloggen als admin
Resource    ../Resources/OntipApp.robot
Resource    ../Resources/Common.robot

Suite Setup     Common.Begin Web Test
Suite Teardown  Common.End Web Test

# robot -d results tests/LogonAdmin.robot

*** Variables ***
${URL}                      https://www.petanqueinschrijven.com/boulamis
${BROWSER}                  chrome
${user}                     admin
${password}                 Obelikx61#

*** Test Cases ***
# vanuit testcase alleen call naar Keyword files (common en ontipapp)
# vanuit keyword files call naar Page Object files
# vanuit Page Object files call naar selenium library

Make sure user if logged off before we start
    [Tags]  test1
    Go to   ${URL}
    OntipApp.Verify user is logged off



