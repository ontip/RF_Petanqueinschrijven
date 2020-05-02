*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/Ontip.robot
Resource    ../Resources/PO/SignonPage.robot
Resource    ../Resources/PO/SelectPage.robot


Test Setup  Ontip.Logon als admin
Test Teardown  Ontip.Logoff website

*** Test Cases ***
Open de website van de nieuwe OnTip en log aan als gebruiker
    Common.Begin Web Test
    Ontip.Logon als admin
    Common.End Web Test

Open de website van de nieuwe OnTip en selecteer een toernooi




*** Keywords ***

