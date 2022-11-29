*** Settings ***
Documentation    Tudo começa aqui

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource


*** Keywords ***
# helpers
Do Login
    [Arguments]    ${user}  
    Go To Login Page
    Fill Credenciais          ${user}[email]      ${user}[pass]
    Submit Credenciais 
    User Should Be Looged In       ${user}[name]