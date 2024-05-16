*** Settings ***
Library    ../.venv/lib/python3.11/site-packages/SeleniumLibrary/__init__.py

*** Variables ***
# Variables em Page Object são selectores dos elementos da página
${txt_usuario}    css={data-test="username"}
${txt_senha}    css=[data-test="password"]
${btn_login}    id=login-button

*** Keywords ***
Preencher usuario
    [Arguments]    ${usuario}
    Input Text    ${txt_usuario}    ${usuario}

Preencher senha
    [Arguments]    ${senha}
    Input Text    ${txt_senha}    ${senha}

Clicar no botao Login
    Click Button    ${btn_login}