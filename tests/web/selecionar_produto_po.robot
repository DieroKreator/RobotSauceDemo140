*** Settings ***
Resource    ../../pages/base_page.robot

Test Setup    base_page.Abrir navegador
Test Teardown    base_page.Fechar navegador

*** Test Cases ***
Selecionar Mochila
    Tirar Screenshot    1-Home
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Tirar Screenshot    2-Login Preenchido
    Clicar no botao Login
    Element Text Should Be    ${titulo_secao}    Products
    Tirar Screenshot    3-Lista de Produtos
    Clicar no produto    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${inventory_item_product_price}    $29.99
    Tirar Screenshot    4-Detalhes do Produto
    Clicar no botao "Add do cart"
    Clicar no Carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${cart_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${cart_product_price}    $29.99
    Element Text Should Be    ${cart_product_quantity}    1
    Tirar Screenshot    5-Carrinho
    Realizar Logout