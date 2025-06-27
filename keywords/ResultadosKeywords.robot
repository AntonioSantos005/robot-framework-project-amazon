*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/ResultadosPage.resource
Resource   ../resources/ProdutoPage.resource

*** Keywords ***
Quando seleciona o primeiro produto da lista
    Wait Until Element Is Visible    ${PRIMEIRO_PRODUTO}
    Click Element    ${PRIMEIRO_PRODUTO}
