*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary

*** Variables ***
${INSCHRIJF_FORMULIER_FORM}         xpath=//form[@name='myForm']
${Input_field_licentie1}            css=Input[name=Licentie1]
${Input_field_licentie2}            css=Input[name=Licentie2]
${Input_field_naam1}                css=Input[name=Naam1]
${Input_field_naam2}                css=Input[name=Naam2]
${Input_field_vereniging1}          css=Input[name=Vereniging1]
${Input_field_vereniging2}          css=Input[name=Vereniging2]
${Input_field_telefoon}             css=Input[name=Telefoon]
${Input_field_email}                css=Input[name=Email]
${Input_image_loep}                 css=Input[id=loep]
${antispam_challenge}               css=Input[name=challenge]
${Input_field_respons}              css=Input[name=respons]
${checkbox_privacy}                 css=Input[name=privacy]
${Textarea_field_opmerkingen}       css=Textarea[Name=Opmerkingen]
#${submit_button}                    css=body > form > div > center > table > tbody > tr:nth-child(2) > td > input[type=submit]:nth-child(1)
${submit_button}                    css=Input[type=submit]
#@{inschrijving}  45909  Erik Hendrikx  Boulamis  45910  Petra Hendrikx  Boulamis

*** Keywords ***

Load "Inschrijf formulier"
    [Arguments]    ${url}
    Go To      ${url}

Validate "Inschrijf formulier"
    [Arguments]   ${url}
    Go To  ${url}
    Title should be                    OnTip Inschrijfformulier
    Wait until Page contains Element   ${INSCHRIJF_FORMULIER_FORM}
    Wait until Page contains Element   ${Input_field_licentie1}
    Wait until Page contains Element   ${Input_field_licentie2}
    Wait until Page contains Element   ${Input_field_naam1}
    Wait until Page contains Element   ${Input_field_naam2}
    Wait until Page contains Element   ${Input_field_vereniging1}
    Wait until Page contains Element   ${Input_field_vereniging2}
    Wait until Page contains Element   ${Input_field_telefoon}
    Wait until Page contains Element   ${Input_field_email}
    Wait until Page contains Element   ${antispam_challenge}
    Wait until Page contains Element   ${Input_field_respons}
    Wait until Page contains Element   ${checkbox_privacy}
    Wait until Page contains Element   ${Input_image_loep}
    # Wait until Page contains Element   ${submit_button}



Should be able to "Inschrijven met behulp van Licentie en Naam en Vereniging"
     [Documentation]       Inschrijven het invullen van de licentie, naam en vereniging
     [Arguments]   ${url}
     Go To  ${url}
     # @{inschrijving}           45909 Erik Hendrikx Boulamis 45910 Petra Hendrikx Boulamis
     Set Suite Variable              ${LICENTIE1}                     &{INSCHRIJVING}[licentie1]
     Fill "Input" Field              ${Input_field_licentie1}         &{INSCHRIJVING}[licentie1]
     Fill "Input" Field              ${Input_field_licentie2}         &{INSCHRIJVING}[licentie2]
     Fill "Input" Field              ${Input_field_naam1}             &{INSCHRIJVING}[naam1]
     Fill "Input" Field              ${Input_field_naam2}             &{INSCHRIJVING}[naam2]
     Fill "Input" Field              ${Input_field_vereniging1}       &{INSCHRIJVING}[vereniging1]
     Fill "Input" Field              ${Input_field_vereniging2}       &{INSCHRIJVING}[vereniging2]
     Fill "Input" Field              ${Input_field_telefoon}          033-2988547
     Fill "Input" Field              ${Input_field_email}             erik.hendrikx@kpnmail.nl
     Fill "Input" Field              ${Textarea_field_opmerkingen}    Dit betreft een geautomatiseerde test
     Select checkbox field           ${checkbox_privacy}
     ${challenge} =                  Get Value                       ${antispam_challenge}
     # bij gheautomatiseerde test wordt de antispam niet gecontroleerd. Weet niet waarom niet
     Fill "Input" Field              ${Input_field_respons}          ${challenge}
     Sleep    4s

     Submit Form

Fill "Input" Field
    [Arguments]   ${InputTextBox}            ${content}
    Input Text        ${InputTextBox}        ${content}

Select checkbox field
    [Arguments]   ${InputCheckBox}
    Select checkbox   ${InputCheckBox}

Validate "Naam" Field
    [Arguments]    ${Input_field}
    Wait until Page contains Element   ${Input_field}
    Element text should be  ${Input_field}  Erik Hendrikx

