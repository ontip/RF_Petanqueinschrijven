*** Settings ***
Documentation      Een deelnemer aan een toernooi schrijft zich in
Resource       ../Resources/InschrijfApp.robot
Resource       ../Resources/Common.robot

Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test

# run command
# robot -d results -T tests/InschrijvenToernooi.robot


*** Variables ***
${toernooi}                 erik_test_toernooi
${url}                      https://www.petanqueinschrijven.com/boulamis/Inschrijfform.php?toernooi=erik_test_toernooi
${browser}                  chrome
${LICENTIE1}                        45909
${LICENTIE2}                        45910
${NAAM1}
#@{inschrijving}  45909  Erik Hendrikx  Boulamis  45910  Petra Hendrikx  Boulamis
&{inschrijving}   licentie1=45909  naam1=Erik Hendrikx  vereniging1=Boulamis  licentie2=45910  naam2=Petra Hendrikx  vereniging2=Boulamis


*** Keywords ***



*** Test Cases ***
Moet zich kunnen inschrijven voor een toernooi
    [Tags]  Inschrijving  critical
    InschrijfApp.Load "Inschrijf formulier"   ${url}
    InschrijfApp.Validate "Inschrijf formulier" is loaded   ${url}
    #InschrijfApp.Should be able to "Inschrijven met behulp van Licenties"      ${url}
    #Set Suite variable   &{INSCHRIJVING)   @{inschrijving}
    Set Suite variable   &{INSCHRIJVING)   &{inschrijving}
    InschrijfApp.Should be able to "Inschrijven met behulp van Licentie en Naam en Vereniging"  ${url}
