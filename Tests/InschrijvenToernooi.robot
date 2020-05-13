*** Settings ***
Documentation      Een deelnemer aan een toernooi schrijft zich in
Resource        ../Resources/InschrijfApp.robot
Resource        ../Resources/Common.robot
Resource        ../Resources/DB/MySql.robot

Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test

# run command
# robot -d results -T tests/InschrijvenToernooi.robot

*** Variables ***
${toernooi}                 erik_test_toernooi
${url}                      https://www.petanqueinschrijven.com/boulamis/Inschrijfform.php?toernooi=erik_test_toernooi
${browser}                  chrome
${LICENTIE1}                45909
${LICENTIE2}                45910
${NAAM1}
# Dict variabele
&{inschrijving}   licentie1=45909  naam1=Erik Hendrikx  vereniging1=Boulamis  licentie2=45910  naam2=Petra Hendrikx  vereniging2=Boulamis


*** Test Cases ***
Deelnemer moet zich kunnen inschrijven voor een toernooi
    [Documentation]    Een inschrijf formulier wordt geladen en de deelnemer schrijft zich in met 2 personen
    [Tags]  Inschrijving  critical
    InschrijfApp.Load "Inschrijf formulier"   ${url}
    InschrijfApp.Validate "Inschrijf formulier" is loaded   ${url}
    Set Suite variable   &{INSCHRIJVING)   &{inschrijving}
    InschrijfApp.Should be able to "Inschrijven met behulp van Licentie en Naam en Vereniging"  ${url}
    # Kontroleer in database inschrijving aanwezig is
    MySql.Connect
    MySql.Validate "Inschrijving geregistreerd"   ${LICENTIE1}
    MySql.Disconnect