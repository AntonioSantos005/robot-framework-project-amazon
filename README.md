
# Projeto Robot Framework - Amazon

Este projeto automatiza parte do fluxo de compra no site [Amazon Brasil](https://www.amazon.com.br/) utilizando Robot Framework com a biblioteca SeleniumLibrary.

## 🔎 Objetivo

Automatizar o seguinte fluxo:

1. Acessar o site da Amazon.
2. Realizar uma busca pelo termo **"livro"**.
3. Selecionar o primeiro item da lista de resultados.
4. Clicar no botão **Comprar Agora**.
5. Realizar o login com e-mail e senha.
6. Validar a exibição de CAPTCHA (quando aplicável) e interagir com elementos em iFrame.

> ⚠️ A etapa final de compra **não pôde ser automatizada devido à proteção contra robôs (CAPTCHA)**, o que foi corretamente tratado no fluxo com verificação da presença de iframe e modal.

---

## 📂 Estrutura do Projeto

```
robot-framework-project-amazon/
├── keywords/
│   ├── HeaderKeywords.robot
│   ├── LoginKeywords.robot
│   ├── ProdutoKeywords.robot
│   └── ResultadosKeywords.robot
├── resources/
│   ├── HeaderPage.resource
│   ├── LoginPage.resource
│   ├── ProdutoPage.resource
│   └── ResultadosPage.resource
├── tests/
│   └── LoginTest.robot
```

---

## ✅ Requisitos

- Python 3.x
- Google Chrome
- ChromeDriver compatível com a versão do navegador

## ⚙️ Instalação e Execução

```bash
# Clone o projeto
git clone https://github.com/AntonioSantos005/robot-framework-project-kabum.git
cd robot-framework-project-amazon

# Instale o Robot Framework e SeleniumLibrary
pip install robotframework
pip install robotframework-seleniumlibrary

# Execute o teste
robot tests/LoginTest.robot
```

---

## 📊 Relatórios

Após a execução, são gerados automaticamente:

- `log.html` – Detalhamento passo a passo da execução
- `report.html` – Sumário geral de sucesso/falhas
- `output.xml` – Arquivo bruto para reprocessamento

---

## 📌 Destaques Técnicos

- **Interação com elementos em iFrame**:
  - Seleção de frame com `Select Frame`
  - Interação com CAPTCHA em `iframe`
  - Retorno ao contexto principal com `Unselect Frame`
- **Validação condicional**:
  - Uso de `Run Keyword And Return Status` para validações opcionais

---

## 🔐 Observação

O fluxo de login é interrompido pela exibição de CAPTCHA pelo site da Amazon. Este cenário foi tratado como **não automatizável** e está devidamente documentado.

