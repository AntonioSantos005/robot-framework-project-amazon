*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/LoginPage.resource

*** Keywords ***
Quando informar o email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${CAMPO_EMAIL_LOGIN}
    Input Text    ${CAMPO_EMAIL_LOGIN}    ${email}
    Wait Until Element Is Visible    ${BOTAO_CONTINUAR}
    Click Element    ${BOTAO_CONTINUAR}

E informar a senha 
    [Arguments]    ${senha}
    Wait Until Element Is Visible    ${CAMPO_SENHA_LOGIN}
    Input Text    ${CAMPO_SENHA_LOGIN}    ${senha}
    Wait Until Element Is Visible    ${BOTAO_FAZER_LOGIN}
    Click Element    ${BOTAO_FAZER_LOGIN}

Entao o sistema apresenta o modal com o captcha
    #verifica se o iframe do captcha existe na pagina
    ${existe_iframe}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//iframe[contains(@id, 'iframe')]

    #se o iframe existir, executa a validacao do captcha, as vezes sistema carrega um captcha com frame, e as vezes outro sem frame
    Run Keyword If    ${existe_iframe}    Executar validacao do captcha
    #caso o frame nao exista valida diretamente o captcha
    Run Keyword If    not ${existe_iframe}    Executar validacao do captcha sem frame


Executar validacao do captcha
    #troca o contexto para dentro do iframe
    Select Frame    xpath=//iframe[contains(@id, 'iframe')]

    #aguarda o modal do captcha ficar visivel (tempo limite de 10s)
    Wait Until Element Is Visible    ${MODAL_CAPTCHA}    timeout=10s

    #valida que o texto esperado esta presente no modal do captcha
    Element Should Contain    ${MODAL_CAPTCHA}    para proteger sua conta

    #sai do iframe, voltando ao contexto da pagina principal
    Unselect Frame

Executar validacao do captcha sem frame
    #aguarda o modal do captcha ficar visivel (tempo limite de 10s)
    Wait Until Element Is Visible    ${MODAL_CAPTCHA}    timeout=10s
    #valida que o texto esperado esta presente no modal do captcha
    Element Should Contain    ${MODAL_CAPTCHA}    para proteger sua conta


