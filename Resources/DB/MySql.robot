*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Dialogs
Library    DateTime

*** Variables ***
${DB_NAME} =            u875346739_ontipnlv_db
${DB_USER_NAME} =       u875346739_ontip
${DB_USER_PASSWORD} =   Obelikx61#
# Bij Hostinger is op IP adres 77.171.14.120 een remote database connectie aangebracht
${DB_HOST} =           45.87.80.101
#${DB_HOST} =           localhost

${DB_PORT} =           3306
${PREVIOUS_ROW_COUNT}

*** Keywords ***
Connect
    Connect To Database  pymysql  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}


Validate "Inschrijving geregistreerd"
    [Arguments]    ${LICENTIE1}
        # notice here we use LIMIT 1 instead of TOP 1 in SQL Server

    ${queryResults} =  Query  SELECT Licentie1, Naam1, Toernooi, Kenmerk FROM inschrijf ORDER BY Inschrijving DESC LIMIT 1
    # Examine the (0-based) 1st field of the first record in the results
    Set Test Variable   ${db_licentie1}          ${queryResults[0][0]}
    Set Test Variable   ${db_naam1}              ${queryResults[0][1]}
    Set Test Variable   ${db_toernooi}           ${queryResults[0][2]}
    Set Suite Variable  ${DB_KENMERK}            ${queryResults[0][3]}
    Should be Equal as Strings  ${queryResults[0][0]}  ${LICENTIE1}
    Log Many  "De gevonden Licentie is"  ${db_licentie1}
    Log Many  "De gevonden Naam is"  ${db_naam1}
    Log Many  "Het toernooi is"  ${db_toernooi}
    Log Many  "Het kernmerk is"  ${DB_KENMERK}

Verwijder "Inschrijving"
    ${delete_command} =  Set Variable  Delete FROM inschrijf Where Kenmerk = '${DB_KENMERK}';
    Execute SQL String  ${delete_command}

Validate "Verwijder Inschrijving"
    Row Count is 0  SELECT * FROM inschrijf Where Kenmerk = '${DB_KENMERK}';

Validate if inschrijvingen exist
    [Arguments]   ${toernooi}
    ${current_row_count} =  Row Count   SELECT * FROM inschrijf Where Toernooi = '${toernooi}';
    Log  ${current_row_count}
    Row Count Is Greater Than X  SELECT * FROM inschrijf Where Toernooi = '${toernooi}';   0






















Save Current Row Count
   ${current_row_count} =  Row Count   SELECT * from DemoItems;
   Set Suite Variable  ${PREVIOUS_ROW_COUNT}   ${current_row_count}
   Log   ${current_row_count}

Get Input Data
    # from the dialogs library
    ${name} =  Get Value From User  Enter a First Name
    # save it at the suite scope so subsequent test can use it
    Set Suite Variable  ${FIRST_NAME}  ${name}

Insert Record
    # Optional: Use these commented lines to create your table if necessary
    #Delete All Rows From Table  DemoItems
    #Execute SQL String  DROP TABLE DemoItems
    #Execute SQL String  CREATE TABLE DemoItems (ItemId INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, ItemName VARCHAR(50) NOT NULL, FirstName VARCHAR(50) NOT NULL)

    # I wasn't able to get a DateTime value inside the query like I did on SQL Server
    # so had to do it on a separate line. This is from the DateTime library.
    # For some reason, Pycharm/Intellibot doesn't recognize it and underlines it
    ${current_date} =  Get Current Date

    # also possible to use an input file

    # Execute SQL Script  inputs/SQL/insert.txt

    # notice I've put the variables inside single quotes
    ${insert_command} =  Set Variable  INSERT INTO DemoItems (ItemName, FirstName) VALUES ('New Item ${current_date}', '${FIRST_NAME}')
    Execute SQL String  ${insert_command}

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM DemoItems;
    Log  ${new_row_count}
    # notice that I'm using +1 INSIDE the braces, not after the final brace
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1 }

Verify Last Record
    # notice here we use LIMIT 1 instead of TOP 1 in SQL Server
    ${queryResults} =  Query  SELECT * FROM DemoItems ORDER BY ItemId DESC LIMIT 1
    # Examine the (0-based) 3rd field of the first record in the results
    Should be Equal as Strings  ${queryResults[0][2]}  ${FIRST_NAME}
    # Log Many      ${queryResults}
    Log  ${queryResults[0][2]}

Delete Last Record
    ${delete_command} =  Set Variable  Delete FROM DemoItems Where FirstName = '${FIRST_NAME}';
    Execute SQL String  ${delete_command}

Verify Record Deleted
   ${current_row_count} =  Row Count   SELECT * from DemoItems;
   Should be Equal as Numbers  ${current_row_count}  ${PREVIOUS_ROW_COUNT}


Log All Rows
    ${queryResults} =  Query  SELECT * FROM DemoItems ORDER BY ItemId
    Log Many  ${queryResults}

Logoff user
   [Arguments]   ${user}   ${vereniging}
    ${update_command} =  Set Variable  UPDATE namen SET Aangelogd ='N', IP_adres_md5 ='xx' WHERE Naam = '${user}'  and Vereniging ='${vereniging}';
    Execute SQL String  ${update_command}

Disconnect
    Disconnect from Database