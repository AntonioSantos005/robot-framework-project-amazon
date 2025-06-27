*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/ProdutoPage.resource

*** Keywords ***
E clicar no botao Comprar Agora
    Click Element    ${CAMPO_COMPRAR_AGORA}
