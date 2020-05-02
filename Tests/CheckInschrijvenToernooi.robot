*** Settings ***
Documentation      De inschrijving wordt gekontroleerd en daarna verwijderd
Resource        ../Resources/DB/MySql.robot


Test Setup     MySql.Connect
Test Teardown  MySql.Disconnect

# run command
# robot -d results tests/CheckInschrijvenToernooi.robot


*** Variables ***
${LICENTIE1}                        45909


*** Keywords ***



*** Test Cases ***

Validate if inschrijvingen exist
    [Documentation]    Check in de database of er inschrijvingen zijn voor dit toernooi
    [Arguments]   ${toernooi}
    MySql.Validate if inschrijvingen exist  ${toernooi}

Kontrole of inschrijving gelukt is
    [Tags]  Controle
    MySql.Validate "Inschrijving geregistreerd"   ${LICENTIE1}

    #OntipApp.Schrijf in voor toernooi   ${URL}   ${toernooi}
    #OntipApp.Validate inschrijving    ${URL}   ${toernooi}
    #OnTipApp.Verwijder inschrijving   ${URL}   ${toernooi}

Verwijder inschrijving
    MySql.Verwijder "Inschrijving"

Validate "Verwijder inschrijving"
    MySql.Validate "Verwijder Inschrijving"
