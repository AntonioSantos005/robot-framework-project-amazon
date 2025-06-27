*** Settings ***
Documentation     Cenário: Adicionar produto ao carrinho com sucesso
...               Este teste cobre a compra de um notebook com frete e garantia estendida.
Resource          ../keywords/HeaderKeywords.robot
Resource          ../keywords/ResultadosKeywords.robot
Resource          ../keywords/ProdutoKeywords.robot
Resource          ../keywords/LoginKeywords.robot


*** Test Cases ***
#Cenario de login negativo pois o site detecta login com robo e apresenta Captcha, ou seja, nao eh um fluxo automatizavel
Login invalido com captcha
    Dado que o usuario acessa a loja Amazon
    E pesquisa por    livro
    Quando seleciona o primeiro produto da lista
    E clicar no botao Comprar Agora
    #Campo email ja confirma que esta na tela de login
    Quando informar o email    teste@teste.com
    E informar a senha    123456tt
    # Interacao com IFrame
    Entao o sistema apresenta o modal com o captcha

