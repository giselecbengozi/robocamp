*** Settings ***
Documentation        Consumindo a rota da api students

Library              RequestsLibrary
Resource    ../base.resource

*** Keywords ***
Post New Student
    [Arguments]    ${token}    ${student}

    ${headers}    Create Dictionary    Authorization=${token}
    
    ${response}   POST     http://localhost:3333/students    json=${student}   headers=${headers}   expected_status=201

