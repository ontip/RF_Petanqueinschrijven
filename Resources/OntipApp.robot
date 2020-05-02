*** Settings ***
Library    SeleniumLibrary
Resource    ./PO/MainPage.robot
Resource    ./PO/SelectToernooiPage.robot
Resource    ./PO/ToevoegenToernooiPage.robot
Resource    ./PO/ToernooiBeheerPage.robot
Resource    ./PO/InschrijvingenPage.robot
Resource    ./PO/LijstenPage.robot
Resource    ./PO/OverigPage.robot
Resource    ./PO/Aanloggen.robot

*** Variables ***

*** Keywords ***
Verify user is logged off
    MainPage.Verify optie "Aanloggen"


Verify MainPage loaded
    MainPage.Verify Page Loaded
    MainPage.Verify optie "Aanloggen"

Verify optie "Aanloggen"
    MainPage.Verify optie "Aanloggen"

Aanloggen Met User En Wachtwoord
    [Arguments]   ${user}   ${password}
    MainPage.Verify optie "Aanloggen"
    MainPage.Kies Optie "Aanloggen"
    Aanloggen.Verify Page Loaded
    Aanloggen.User Login with Valid Credentials   ${user}  ${password}

Verify user is aangelogd
    # See  for Return statement in keyword
    ${ReturnedInfo} =  Aanloggen.Verify user is aangelogd
    Log   ${ReturnedInfo}

Load "Selecteer toernooi"
    MainPage.Load "Selecteer toernooi"

Verify "Selecteer toernooi" is loaded
   SelectToernooiPage.Verify Page is loaded

Load "Toevoegen toernooi"
    MainPage.Load "Toevoegen toernooi"

Verify "Toevoegen toernooi" is loaded
   ToevoegenToernooiPage.Verify Page is loaded

Load "Toernooi beheer"
    MainPage.Load "Toernooi beheer"

Verify "Toernooi beheer" is loaded
   ToernooiBeheerPage.Verify Page is loaded

Load "Inschrijvingen"
    MainPage.Load "Inschrijvingen"

Verify "Inschrijvingen" is loaded
   InschrijvingenPage.Verify Page is loaded

Load "Lijsten"
    MainPage.Load "Lijsten"

Verify "Lijsten" is loaded
   LijstenPage.Verify Page is loaded

Load "Overig"
    MainPage.Load "Overig"

Verify "Overig" is loaded
   OverigPage.Verify Page is loaded

Logoff website
   MainPage.Verify optie "Afloggen"
   MainPage.Kies optie "Afloggen"

Verify Logoff website
   # Om te kontroleren of website is afgelogd , check of Aanloggen bestaat
   MainPage.Verify optie "Aanloggen"

Selecteer een toernooi
    [Arguments]    ${toernooi}
    SelectToernooiPage.Selecteer een toernooi     ${toernooi}
    Sleep   2s

Verify toernooi is geselecteerd
    [Arguments]    ${toernooi}
    SelectToernooiPage.Verify toernooi geselecteerd     ${toernooi}

# vanaf hier voor Tab Toernooi

Load "Beheer toernooi Tab Toernooi"
   ToernooiBeheerPage.Load "Beheer toernooi Tab Toernooi"

Verify "Beheer toernooi Tab Toernooi" is loaded
    ToernooiBeheerPage.Verify "Beheer toernooi Tab Toernooi" is loaded

Verify if field can be changed in Tab Toernooi
    ToernooiBeheerPage.Verify if field can be changed in Tab Toernooi

# vanaf hier voor Tab Formulier

Load "Beheer toernooi Tab Formulier"
   ToernooiBeheerPage.Load "Beheer toernooi Tab Formulier"

Verify "Beheer toernooi Tab Formulier" is loaded
    ToernooiBeheerPage.Verify "Beheer toernooi Tab Formulier" is loaded

Verify if field can be changed in Tab Formulier
    ToernooiBeheerPage.Verify if field can be changed in Tab Formulier

# vanaf hier voor Tab Overig

Load "Beheer toernooi Tab Overig"
   ToernooiBeheerPage.Load "Beheer toernooi Tab Overig"

Verify "Beheer toernooi Tab Overig" is loaded
    ToernooiBeheerPage.Verify "Beheer toernooi Tab Overig" is loaded

Verify if field can be changed in Tab Overig
    ToernooiBeheerPage.Verify if field can be changed in Tab Overig

Load "Inschrijvingen Tab Muteren"
    InschrijvingenPage.Load "Inschrijvingen Tab Muteren"


Verify "Inschrijvingen Tab Muteren" is loaded
    InschrijvingenPage.Verify "Inschrijvingen Tab Muteren" is loaded

Verify Inschrijving can be changed


Verify if "Inschrijvingen" is loaded