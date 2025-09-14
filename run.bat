@echo off

REM Verificando Java
echo Verificando Java
java -version
javac -version

REM Limpar pasta bin
echo Limpando pasta bin...
del /s /q "bin\*.class" 2>nul
del /s /q "src\bin\*.class" 2>nul


REM Compilar a gramática
echo Compilando gramatica...
java -cp "lib\jflex-full-1.9.1.jar" jflex.Main -nobak src\grammar.flex


REM Compilar todos os .java dentro de src/
echo Compilando src...
javac -d bin -cp "lib\jflex-full-1.9.1.jar;." src\*.java

IF %ERRORLEVEL% NEQ 0 (
    echo Erro na compilacao.
    pause
    exit /b %ERRORLEVEL%
)

REM Executar a classe principal
echo Executando...
java -cp "lib\jflex-full-1.9.1.jar;bin" src.Main

pause
