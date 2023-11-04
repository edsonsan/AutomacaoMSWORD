*** Setting ***
Documentation    Suite de teste do Programa Word utilizando o RobotFramework
Library    SikuliLibrary
#Library    Process

Test Setup     Adicionar caminho
*** Variables ***
${imagens}        ${CURDIR}\\img
${progExist}      

*** Test Cases ***
TC_001 Iniciando Word no Windows
    Dado que o "word" esteja instalado
    Quando eu clico no ícone MS Word o sistema abrirá
    Então posso efetuar a edição do texto

*** Keywords ***

Dado que o ${prog} esteja instalado
    Click    iniciar.png
    Input Text    brpesquisar.png    word
    Sleep    3
    ${score} =	Get Match Score	    msword.png		
    Run Keyword if    ${score} >= 0.95    Verdadeiro    ELSE	Falso
    
Quando eu clico no ícone MS Word o sistema abrirá
    Click    msword.png
    Wait Until Screen Contain    wordnovo.png    5
    Click     wordnovo.png

Então posso efetuar a edição do texto
    Sleep    3
    Paste Text    areadetexto.png    Texto automatizado: criado pelo RobotFrameWork utilizando a Biblioteca Sikuli
    Sleep    3
    Press Special Key   END
    Press Special Key   ENTER
    Input Text    novoparagrafo.png    Texto automatizado: criando 2ª linha.
    Press Special Key   ENTER
    Input Text    novoparagrafo.png    Texto automatizado: criando 3ª linha.
    Sleep    4
    Click    fecharaplicacao.png
    Click    btnnaosalvar.png

# KeyWords de apoio 
verdadeiro 
    log     ${progExist}="True"
Falso
    Log    ${progExist}="False" 
    Capture Screen
    Press Special Key    ESC
    Fail
Adicionar caminho    
    Add Image Path     ${imagens}
