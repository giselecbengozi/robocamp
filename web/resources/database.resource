*** Settings ***
Documentation    Gerenciando a massa de testes

Library        DatabaseLibrary

*** Keywords ***
Connect to Postgres
    Connect To Database    psycopg2
    ...                    naunxhtf
    ...                    naunxhtf
    ...                    r3qZKZU5OD6GAuIMjIvQR6gUwdQDlbUU
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where Email
    [Arguments]        ${email} 
    ${query}           Set Variable
    ...                SELECT * FROM "public"."students" where email = '${email}';
    ${result}         Query    ${query}
    [return]           ${result}[0]

Delete Enroll By Email
    [Arguments]     ${email}
    ${user}         Select Student Where Email    ${email}   
    ${query}        Set Variable
    ...             DELETE FROM public.enrollments where student_id='${user}[0]';
    Execute Sql String   ${query}

Delete Student By Email
    [Arguments]    ${email}
    ${query}    Set Variable     DELETE FROM public.students where email = '${email}'
    Execute Sql String   ${query}  

#Helpers
Reset Student 
    [Arguments]                ${email}
    Connect to Postgres
    Delete Student By Email     ${email}    
    Disconnect from Database  



