*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMPO_BUSCAR}  id:twotabsearchtextbox
${BOTAO_BUSCAR}  id:nav-search-submit-button

# *** Keywords ***
# Lidar com cookies e aviso
#     Wait Until Element Is Visible    ${BOTAO_ENTENDI_COOKIES}
#     Click Element                    ${BOTAO_ENTENDI_COOKIES}
#     Wait Until Element Is Enabled    ${BOTAO_TALVEZ_DEPOIS}
#     Click Element                    ${BOTAO_TALVEZ_DEPOIS}

# #O campo buscar do site kabum eh um form funciona de uma forma dinamica para poder habilitat o botao de pesquisar e a funcao submit, 
# #foi necessario um script usando o javaScript executor para simular a digitacao manual
# #OBS: uma outra forma para contornar essa questao eh digitar a busca direto na url ja que a busca do kabum funciona tambem pesquisando com o link
# # como https://www.kabum.com.br/busca/<termoPesquisado>
# Digita no campo de busca
#     [Arguments]    ${texto}    # Recebe o texto a ser digitado, por exemplo: "notebooks"

#     # Bloco 1: Forca a digitacao no campo usando o "setter" original do input do DOM nativo.
#     # Isso eh necessario porque frameworks como React/Vue nao detectam mudancas feitas com el.value diretamente.
#     Execute JavaScript
#     ...    const el = document.getElementById("inputBusca");    # Localiza o campo pelo id
#     ...    const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;    # Captura o setter nativo de value
#     ...    setter.call(el, "${texto}");    # Define o valor no input como se fosse o navegador digitando
#     ...    el.dispatchEvent(new Event('input', { bubbles: true }));    # Dispara o evento input para ativar listeners do React

#     # Bloco 2: Simula o pressionamento da tecla ENTER no campo de busca
#     # Isso eh necessario porque a busca so eh disparada ao pressionar Enter, nao ao preencher o texto.
#     Execute JavaScript
#     ...    const el = document.getElementById("inputBusca");    # Pega novamente o mesmo campo
#     ...    el.dispatchEvent(new KeyboardEvent("keydown", { key: "Enter", bubbles: true }));    # Simula pressionar a tecla Enter (inicio)
#     ...    el.dispatchEvent(new KeyboardEvent("keypress", { key: "Enter", bubbles: true }));   # Simula o pressionamento continuo
#     ...    el.dispatchEvent(new KeyboardEvent("keyup", { key: "Enter", bubbles: true }));      # Simula soltar a tecla Enter (fim do clique)
