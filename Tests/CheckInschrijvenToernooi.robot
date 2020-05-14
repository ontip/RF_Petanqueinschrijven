*** Settings ***
Documentation      De inschrijving wordt gekontroleerd en daarna verwijderd
Resource        ../Resources/DB/MySql.robot


Test Setup     MySql.Connect
Test Teardown  MySql.Disconnect

# run command
# robot -d results tests/CheckInschrijvenToernooi.robot


*** Variables ***
${LICENTIE1}             45909
${toernooi}              erik_test_toernooi

*** Keywords ***



*** Test Cases ***

Validate if inschrijvingen exist
    [Documentation]    Check in de database of er inschrijvingen zijn voor dit toernooi
    MySql.Validate if inschrijvingen exist  ${toernooi}

Kontrole of inschrijving gelukt is
    [Tags]  Controle
    MySql.Validate "Inschrijving geregistreerd"   ${LICENTIE1}

Verwijder inschrijving
    [Documentation]    Verwijder de inschrijving uit de database
    log     iets
     MySql.Verwijder "Inschrijving"

Validate "Verwijder inschrijving"
    log     iets
    MySql.Validate "Verwijder Inschrijving"
