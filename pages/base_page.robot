*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    5000ms
${url}        https://www.saucedemo.com/
${browser}    Chrome

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Fechar navegador
    Sleep    500ms    # pode ser necessario para dar tempo de realizar a última acão/validação
    # Delete Cookie    CUIDADO 
    Close Browser        

Clicar no Carrinho
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Realizar Logout
    Click Element    id=react-burger-menu-btn  
    Click Link    id=logout_sidebar_link 
    Wait Until Element Is Visible    css=.login_logo    ${timeout}
    
Tirar Screenshot    
    [Arguments]    ${screenshot_name}
# Ler a data e hora do Sistema Operacional
    ${date} =    Get Current Date
    ${date} =    Convert Date    {date}    result_format=%Y.%m.%d_%H.%M.%$
    Capture Page Screenshot    screenshots/${TEST_NAME}/${date}.jpg

    #1 - screenshots/<system_name>/<test_name>/<date>.jpg
    #2 - screenshots/<system_name>/<date>/<test_name>.jpg

    #1 - selecionar_produto_po/2024.05.15_20.11.jpg
    #2 - 2024.05.15_20.11/selecionar_produto_po.jpg

    #3 - screenshots/<system_name>/<ano>/<mes>/<dia>/<hora>/<test_name>

# suite setup = antes de todos os testes
# before / setup = executa antes de cada script
# script
# after / teardown = executa depois de cada script
# suite teardown = depois de tudo