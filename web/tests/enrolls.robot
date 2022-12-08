*** Settings ***
Documentation   Suíte de testes de matrículas de alunos

Resource        ../resources/base.resource
Resource    ../resources/services/sessions.resource

*** Test Cases ***
Testando api
    [Tags]    api    
    ${admin}        Get Fixture    admin
    ${falcao}       Get Fixture   falcao   
    Reset Student    ${falcao}[student][email]
    ${token}        Get Service Token    ${admin}
    Post New Student      ${token}     ${falcao}[student]




Deve matricular um aluno
    # Aluno vai ser Falcao
    ${admin}     Get Fixture    admin
    ${student}   Get Fixture    student
    Reset Student     ${student}[email]    
    Do Login                ${admin}
    Go To Enrolls
    Go To Enroll Form   
    Select Student       ${student}[name]
    Select Plan          ${student}[enroll][plan]
    Fill Start Date  
    Submmit Enroll Form
    Verify Toaster        Matrícula cadastrada com sucesso 





