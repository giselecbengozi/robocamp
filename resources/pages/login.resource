*** Settings ***
Library    Browser

*** Keywords ***
Fill Credenciais
    [Arguments]    ${email}      ${pass}
    Fill Text    css=input[name=email]           ${email}      
    Fill Text    css=input[name=password]        ${pass}


Submit Credenciais
    Click        css=button >> text=Entrar no sistema 

 Go To Login Page 
    New Browser      headless=false      browser=chromium
    New Page        http://localhost:3000  


Field Type Shoulde Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]  type   equal  email

Alert Text Shoulde Be
    [Arguments]   ${field}  ${expected_text}
    Get Text     xpath=//input[@type="${field}"]/..//span  equal  ${expected_text}