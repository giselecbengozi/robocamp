*** Settings ***
Documentation   Suíte de testes de matrículas de alunos

Resource        ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    # Aluno vai ser Falcao
    ${admin}     Get Fixture    admin
    ${student}   Get Fixture    student
    Reset Student Enroll    ${student}[email]    
    Do Login                ${admin}
    Go To Enrolls
    Go To Enroll Form   
    Select Student       ${student}[name]
    Select Plan          ${student}[enroll][plan]
    Fill Start Date  
    Submmit Enroll Form
    Verify Toaster        Matrícula cadastrada com sucesso 





