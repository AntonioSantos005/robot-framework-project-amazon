*** Settings ***
Library    SeleniumLibrary
Library    String
Library    BuiltIn

*** Variables ***
${RESULTADO_BUSCA}    xpath=//h1//h2

# Primeiro item da lista de produtos, pegando pelo index
${PRIMEIRO_PRODUTO}  xpath=(//img[@class='s-image'])[1]

*** Keywords ***
Validar resultados para o termo pesquisado
    [Arguments]    ${produto}
    Element Should Contain    ${RESULTADO_BUSCA}    ${produto}


