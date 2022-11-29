*** Settings ***
Documentation   Suíte de testes

Resource        ../resources/base.resource


*** Test Cases ***
Login do Administrador
    [Tags]     loginvalido
   

Email não cadastrado
    [Tags]     logininvalido
    Go To Login Page
    Fill Credenciais          teste@smartbit.com.br         qacademy
    Submit Credenciais 
    Verify Toaster             Suas credenciais são inválidas, por favor tente novamente!  

Senha inválida
    [Tags]       senhainvalida
    Go To Login Page
    Fill Credenciais          admin@smartbit.com        senha123
    Submit Credenciais
    Verify Toaster            Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto   
     Go To Login Page
     Fill Credenciais        @com.br    acb123
     Submit Credenciais
     Field Type Shoulde Be Email

Senha em branco
    Go To Login Page
    Fill Credenciais        admin@smartbit.com        ${EMPTY}
    Submit Credenciais 
    Alert Text Shoulde Be    password  A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credenciais        ${EMPTY}       qacademy
    Submit Credenciais 
    Alert Text Shoulde Be    email   O e-mail é obrigatório

Email e senha são obrigatórios
    [Tags]  temp
     Go To Login Page
     Submit Credenciais
     Alert Text Shoulde Be    email       O e-mail é obrigatório
     Alert Text Shoulde Be    password    A senha é obrigatória