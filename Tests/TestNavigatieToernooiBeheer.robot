*** Settings ***
Documentation     In deze test worden alle menu opties doorlopen onder Toernooi Beheer en gevalideert of het laden van de main
Library  SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/Ontip.robot

Test Setup  Ontip.Logon als admin
Test Teardown  Ontip.Logoff website

*** Test Cases ***
Open de website van de nieuwe OnTip selecteer een toernooi en loop de verschillende menu opties onder Toernooi door

    Ontip.Selecteer een toernooi als admin
    log     Ga door met geselecteerd toernooi
    Ontip.Open toernooi beheer
    if fails
    Wait Until Page Contains    Toevoegen toernooi
    Ontip.Logon als admin

    Ontip.Open toernooi beheer Tab Toernooi
    Ontip.Open toernooi beheer Tab Formulier
    Ontip.Open toernooi beheer Tab Overig
    Ontip.Open toernooi beheer Tab Kopieer
    Ontip.Open toernooi beheer Tab Verwijder
    Ontip.Open toernooi beheer Tab Hoofdmenu





