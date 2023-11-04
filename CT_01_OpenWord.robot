*** Setting ***
Documentation    Suite de teste do Programa Word utilizando o RobotFramework

Library    SikuliLibrary
Library    Process
Library    OperatingSystem

Test Setup     Adicionar caminho
*** Variables ***
${imagens}        ${CURDIR}\\img
${progExist}=  get current date utc     

*** Test Cases ***
TC_001 Iniciando Word no Windows
    Dado que o "word" esteja instalado
TC_002 Abrindo MSWord
    Quando eu clico no ícone MS Word o sistema abrirá
TC_003 Escrevendo Texto
    Então posso efetuar a edição do texto
TC-004 Corrigindo Texto
    Emtão posso corrifir o texto
TC-005 Encerrando a aplicação
    Finalizando o MS Word
*** Keywords ***

Dado que o ${prog} esteja instalado
    Click    iniciar.png
    Input Text    brpesquisaw11.png    word
    Sleep    2
    ${score} =	Get Match Score	    msword.png		
    Run Keyword if    ${score} >= 0.95    Verdadeiro    ELSE	Falso
    
Quando eu clico no ícone MS Word o sistema abrirá
    Click    msword.png
    Wait Until Screen Contain    wordnovo.png    10
    Click     wordnovo.png
    
Então posso efetuar a edição do texto
    Sleep    2
    Paste Text    areadetexto.png    Texto automatizado 01: criado pelo Robot FrameWork utilizando a Biblioteca Sikuli
    Press Special Key    END
    Press Special Key    ENTER
    Input Text    novalinha.png    Texto automatizado 02: criado pelo Robot FrameWork utilizando a Biblioteca Sikuli Linha 2
    Press Special Key    ENTER
    input Text    novalinha.png    Texto automatizado 03: Gostei muito do aprendizado utilizando a Biblioteca Sikuli Linha 3
    Press Special Key    ENTER
    Press Special Key    ENTER
    input Text    novalinha.png    "Texto automatizado 04: Finalizando a automaçao fechando o MSWord sem salvar."
    Press Special Key    ENTER
    Sleep    4

Emtão posso corrifir o texto
    ${score} =	Get Match Score	    automacaocorregir.png	
    Run Keyword If      ${score} >= 0.95    Corrigir    ELSE    Ignorar
    Sleep    4

Finalizando o MS Word
    Click    fecharaplicacao.png 
    Click    btnnaosalvar.png

# KeyWords de apoio 
Verdadeiro 
    log     ${progExist}="True"
Falso
    Log    ${progExist}="False" 
    Capture Screen
    Press Special Key    ESC
    Fail
Corrigir
    input Text    novalinha.png    "Texto automatizado 05: Escrevi errado devo corrigir."
    Sleep    3
    Right Click   automacaocorregir.png
    Click    automacaocorrigido.png
    Ignorar

Ignorar
    Right Click   framework.png
    Click    ignorartudo.png
    Right Click   robot.png
    Click    ignorartudo.png
    Right Click   sikuli.png
    Click    ignorartudo.png
    Right Click   palavra_msword.png
    Click    ignorartudo.png
Adicionar caminho    
    Add Image Path     ${imagens}
