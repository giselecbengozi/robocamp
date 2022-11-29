*** Settings ***
Documentation   Suíte de testes de matrículas de alunos

Resource        ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    # Aluno vai ser Falcao
    ${admin}     Create Dictionary
    ...          name=Admin 
    ...          email=admin@smartbit.com
    ...          pass=qacademy         
    Do Login        ${admin}
    Go To Enrolls
    Go To Enroll Form   
    Select Student       Falcão
    Select Plan          Smart  
    Fiil Start Date    
    Sleep    8