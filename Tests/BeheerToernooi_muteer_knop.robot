*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/OntipApp.robot

Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test

# run command
# robot -d results tests/InschrijvenToernooi.robot


*** Test Cases ***
Open de website van de nieuwe OnTip selecteer een toernooi open beheer toernooi en klik op bevestigen
    #Ontip.Logon als admin
    Ontip.Selecteer een toernooi als admin
    log     Ga door met geselecteerd toernooi
    Ontip.Open toernooi beheer
    Ontip.Open toernooi beheer Tab Toernooi
    log     scherm bevestigen
    OnTip.Click op Knop Wijzigen bevestigen




