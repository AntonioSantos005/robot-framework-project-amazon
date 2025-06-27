*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/HeaderPage.resource
Resource   ../resources/ResultadosPage.resource

*** Keywords ***
Dado que o usuario acessa a loja Amazon
    Open Browser    https://www.amazon.com.br/    chrome
    Maximize Browser Window

E pesquisa por
    [Arguments]    ${produto}
    Wait Until Element Is Visible    ${CAMPO_BUSCAR}
    Input Text    ${CAMPO_BUSCAR}    ${produto}
    Click Element    ${BOTAO_BUSCAR}

    #validar se a tela de pesquisa trouxe os resultados de acordoc om o termo pesquisado
    Validar resultados para o termo pesquisado    ${produto}

